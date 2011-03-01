unit UAlternator;

interface

uses
  URuleType, UITokenSet, UTokenType, UASTNode, UIParser, Contnrs;

type
  /// <Description>Prototype/Interface for an Alternate.</Description>
  IAlternate = class
  protected
    /// <Description>Returns the name of the Alternate.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    /// <Description>Use the public DisplayText property to access!</Description>
    function GetDisplayText: string; virtual; abstract;

  public
    /// <Description>Returns the name of the Alternate.</Description>
    /// <Description>Calls the GetDisplayText() function.</Description>
    property DisplayText: string read GetDisplayText;

    /// <Description>Tries to parse the next Token.</Description>
    /// <Description>Returns nil if Alternate requirements do not match the next Token.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function TryParse(AParser: IParser): TASTNode; virtual; abstract;

    /// <Description>Checks whether the Alternate can parse the next Token.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function LookAhead(AParser: IParser): Boolean; virtual; abstract;
  end;

  /// <Description>Alternate implementation for a TokenSet.</Description>
  TTokenSetAlternate = class(IAlternate)
  private
    /// <Description>TokenSet to use for checking and executing.</Description>
    FTokenSet: ITokenSet;
    /// <Description>Should we destroy the TokenSet on destruction?</Description>
    FDestroyTokenSet: Boolean;

  protected
    /// <Description>Returns the name of the Alternate.</Description>
    /// <Description>Use the public DisplayText property to access!</Description>
    function GetDisplayText: string; override;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(ATokenSet: ITokenSet; ADestroyTokenSet: Boolean = False);
    /// <Description>Default destructor.</Description>
    destructor Destroy; override;

    /// <Description>Tries to parse the next Token.</Description>
    /// <Description>Returns nil if Alternate requirements do not match the next Token.</Description>
    function TryParse(AParser: IParser): TASTNode; override;
    /// <Description>Checks whether the Alternate can parse the next Token.</Description>
    function LookAhead(AParser: IParser): Boolean; override;
  end;

  /// <Description>Alternate implementation for a Rule.</Description>
  TRuleAlternate = class(IAlternate)
  private
    /// <Description>Rule to use for checking and executing.</Description>
    FRuleType: TRuleType;

  protected
    /// <Description>Returns the name of the Alternate.</Description>
    /// <Description>Use the public DisplayText property to access!</Description>
    function GetDisplayText: string; override;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(ARuleType: TRuleType);

    /// <Description>Tries to parse the next Token.</Description>
    /// <Description>Returns nil if Alternate requirements do not match the next Token.</Description>
    function TryParse(AParser: IParser): TASTNode; override;
    /// <Description>Checks whether the Alternate can parse the next Token.</Description>
    function LookAhead(AParser: IParser): Boolean; override;
  end;

  /// <Description>Helper class that checks multiple Rules and/or TokenSets sequentially.</Description>
  TAlternator = class
  private
    /// <Description>TObjectList of IAlternate elements.</Description>
    FAlternates: TObjectList;

    FDiscardParseExceptions: Boolean;

    /// <Description>Textual representation of the Alternates.</Description>
    /// <Description>Use the public DisplayText property to access!</Description>
    function GetDisplayText: string;

  public
    /// <Description>Default constructor initializing the Alternates list.</Description>
    constructor Create(ADiscardParseExceptions: Boolean = False);
    /// <Description>Default destructor destroying the Alternates list.</Description>
    destructor Destroy; override;

    /// <Description>Adds a Rule to the Alternator.</Description>
    procedure AddRule(ARuleType: TRuleType);
    /// <Description>Adds a TokenSet to the Alternator.</Description>
    procedure AddToken(ATokenSet: ITokenSet); overload;
    /// <Description>Adds a single TokenType to the Alternator.</Description>
    procedure AddToken(ATokenType: TTokenType); overload;

    /// <Description>Textual representation of the Alternates.</Description>
    /// <Description>Calls the GetDisplayText() function.</Description>
    property DisplayText: string read GetDisplayText;

    /// <Description>Tries to execute the Alternates.</Description>
    /// <Description>Returns nil if no matching Alternate found.</Description>
    function Execute(AParser: IParser): TASTNode;
    /// <Description>Checks whether the next Token is expected by any of the Alternates.</Description>
    function LookAhead(AParser: IParser): Boolean;
  end;

implementation

uses
  USingleTokenTokenSet, TypInfo, UInvalidOperationException,
  UParseException, UIFrame;

{ TAlternator }

procedure TAlternator.AddRule(ARuleType: TRuleType);
begin
  // Create a RuleAlternate and add it to the Alternates list
  FAlternates.Add(TRuleAlternate.Create(ARuleType));
end;

procedure TAlternator.AddToken(ATokenSet: ITokenSet);
begin
  // Create a TokenSetAlternate and add it to the Alternates list
  FAlternates.Add(TTokenSetAlternate.Create(ATokenSet));
end;

procedure TAlternator.AddToken(ATokenType: TTokenType);
begin
  // Create a SingleTokenTokenSet, create a TokenSetAlternate from it
  // and add it to the Alternates list

  // True: Remember that this TokenSet needs to be destroyed
  //       on Alternator destruction!
  FAlternates.Add(TTokenSetAlternate.Create(
    TSingleTokenTokenSet.Create(ATokenType), True));
end;

constructor TAlternator.Create(ADiscardParseExceptions: Boolean);
begin
  inherited Create;
  // Initialize the Alternates list
  FAlternates := TObjectList.Create;
  FDiscardParseExceptions := ADiscardParseExceptions;
end;

destructor TAlternator.Destroy;
begin
  // Destroy the Alternates list and its children
  FAlternates.Free;
  inherited;
end;

function TAlternator.Execute(AParser: IParser): TASTNode;
var
  I: Integer;
  AAlternate: IAlternate;
  ANextFrame: IFrame;
begin
  Result := nil;

  // Iterate through the Alternates list
  for I := 0 to FAlternates.Count - 1 do
  begin
    // Try to parse the next Token with each Alternate
    AAlternate := (FAlternates.Items[I] as IAlternate);
    if AAlternate <> nil then
    begin
      try
        ANextFrame := AParser.NextFrame;
        Result := AAlternate.TryParse(AParser);
      except
        on EParseException do
        begin
          Result.Free;
          Result := nil;
          AParser.NextFrame := ANextFrame;
          if not FDiscardParseExceptions then
            raise;
        end;
      end;
      
      if Result <> nil then
        // ... and stop iterating when parsing was successful
        Break;
    end;
  end;

  if Result = nil then
    // Raise ParserException if no matching Alternate was found
    raise AParser.Failure(DisplayText);
end;

function TAlternator.GetDisplayText: string;
var
  I: Integer;
begin
  // If no Alternates available -> raise Exception
  if FAlternates.Count = 0 then
    raise EInvalidOperationException.Create(
      'Alternation requires at least one alternative');

  // Concatenate Alternate with ", " or " or " as seperators
  Result := '';
  for I := 0 to FAlternates.Count - 1 do
  begin
    // No prefix seperator for the first item
    if I > 0 then
    begin
      if I = FAlternates.Count - 1 then
        // " or " only for the last item
        Result := Result + ' or '
      else
        // ", " for the others
        Result := Result + ', ';
    end;
    Result := Result + (FAlternates.Items[I] as IAlternate).DisplayText;
  end;
end;

function TAlternator.LookAhead(AParser: IParser): Boolean;
var
  I: Integer;
begin
  Result := False;

  // Iterate through the Alternates list
  for I := 0 to FAlternates.Count - 1 do
  begin
    // Check whether the Alternate can parse the next Token
    if (FAlternates.Items[I] as IAlternate).LookAhead(AParser) then
    begin
      // ... and stop iterating if we find an Alternate that can
      Result := True;
      Break;
    end;
  end;
end;

{ TTokenSetAlternate }

constructor TTokenSetAlternate.Create(ATokenSet: ITokenSet;
  ADestroyTokenSet: Boolean);
begin
  inherited Create;
  // Save TokenSet to use for checking and executing
  FTokenSet := ATokenSet;
  // Should we destroy the TokenSet on destruction?
  FDestroyTokenSet := ADestroyTokenSet;
end;

function TTokenSetAlternate.TryParse(AParser: IParser): TASTNode;
begin
  Result := nil;
  // If we can parse the next Token with the TokenSet
  if AParser.CanParseToken(FTokenSet) then
    // ... parse it and return the resulting Node
    Result := AParser.ParseToken(FTokenSet);
end;

destructor TTokenSetAlternate.Destroy;
begin
  // Should we destroy the TokenSet on destruction?
  if FDestroyTokenSet then
    FTokenSet.Free;
    
  inherited;
end;

function TTokenSetAlternate.GetDisplayText: string;
begin
  // Return the name of the TokenSet as the Alternate's name
  Result := FTokenSet.Name;
end;

function TTokenSetAlternate.LookAhead(AParser: IParser): Boolean;
begin
  // Check whether the TokenSet contains the next Token
  Result := AParser.CanParseToken(FTokenSet);
end;

{ TRuleAlternate }

constructor TRuleAlternate.Create(ARuleType: TRuleType);
begin
  inherited Create;
  // Save Rule to use for checking and executing
  FRuleType := ARuleType;
end;

function TRuleAlternate.TryParse(AParser: IParser): TASTNode;
begin
  Result := nil;
  // If we can parse the next Token with the Rule
  if AParser.CanParseRule(FRuleType) then
    // ... parse it and return the resulting Node
    Result := AParser.ParseRuleInternal(FRuleType);
end;

function TRuleAlternate.GetDisplayText: string;
var
  AType: string;
begin
  // Use RTTI to get the Alternate name from the enum value
  AType := GetEnumName(TypeInfo(TRuleType), Integer(FRuleType));
  Result := Copy(AType, 3, Length(AType) - 2)
end;

function TRuleAlternate.LookAhead(AParser: IParser): Boolean;
begin
  // Check whether the Rule can parse the next Token
  Result := AParser.CanParseRule(FRuleType);
end;

end.
