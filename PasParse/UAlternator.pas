unit UAlternator;

interface

uses
  URuleType, UITokenSet, UTokenType, UASTNode, UIParser, Contnrs;

type
  IAlternate = class
  protected
    function GetDisplayText: string; virtual; abstract;

  public
    property DisplayText: string read GetDisplayText;

    function TryParse(AParser: IParser): TASTNode; virtual; abstract;
    function LookAhead(AParser: IParser): Boolean; virtual; abstract;
  end;

  TTokenSetAlternate = class(IAlternate)
  private
    FTokenSet: ITokenSet;
    FDestroyTokenSet: Boolean;

  protected
    function GetDisplayText: string; override;

  public
    constructor Create(ATokenSet: ITokenSet; ADestroyTokenSet: Boolean = False);
    destructor Destroy; override;

    function TryParse(AParser: IParser): TASTNode; override;
    function LookAhead(AParser: IParser): Boolean; override;
  end;

  TRuleAlternate = class(IAlternate)
  private
    FRuleType: TRuleType;

  protected
    function GetDisplayText: string; override;

  public
    constructor Create(ARuleType: TRuleType);

    function TryParse(AParser: IParser): TASTNode; override;
    function LookAhead(AParser: IParser): Boolean; override;
  end;

  TAlternator = class
  private
    FAlternates: TObjectList;

    function GetDisplayText: string;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddRule(ARuleType: TRuleType);
    procedure AddToken(ATokenSet: ITokenSet); overload;
    procedure AddToken(ATokenType: TTokenType); overload;

    property DisplayText: string read GetDisplayText;

    function Execute(AParser: IParser): TASTNode;
    function LookAhead(AParser: IParser): Boolean;
  end;

implementation

uses
  USingleTokenTokenSet, TypInfo, UInvalidOperationException;

{ TAlternator }

procedure TAlternator.AddRule(ARuleType: TRuleType);
begin
  FAlternates.Add(TRuleAlternate.Create(ARuleType));
end;

procedure TAlternator.AddToken(ATokenSet: ITokenSet);
begin
  FAlternates.Add(TTokenSetAlternate.Create(ATokenSet));
end;

procedure TAlternator.AddToken(ATokenType: TTokenType);
begin
  FAlternates.Add(TTokenSetAlternate.Create(
    TSingleTokenTokenSet.Create(ATokenType), True));
end;

constructor TAlternator.Create;
begin
  inherited;
  FAlternates := TObjectList.Create;
end;

destructor TAlternator.Destroy;
begin
  FAlternates.Free;
  inherited;
end;

function TAlternator.Execute(AParser: IParser): TASTNode;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to FAlternates.Count - 1 do
  begin
    Result := (FAlternates.Items[I] as IAlternate).TryParse(AParser);
    if Result <> nil then
      Break;
  end;

  if Result = nil then
    AParser.Failure(DisplayText);
end;

function TAlternator.GetDisplayText: string;
var
  I: Integer;
begin
  if FAlternates.Count = 0 then
    raise EInvalidOperationException.Create(
      'Alternation requires at least one alternative');

  Result := '';
  for I := 0 to FAlternates.Count - 1 do
  begin
    if I > 0 then
    begin
      if I = FAlternates.Count - 1 then
        Result := Result + ' or '
      else
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

  for I := 0 to FAlternates.Count - 1 do
  begin
    if (FAlternates.Items[I] as IAlternate).LookAhead(AParser) then
    begin
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
  FTokenSet := ATokenSet;
  FDestroyTokenSet := ADestroyTokenSet;
end;

function TTokenSetAlternate.TryParse(AParser: IParser): TASTNode;
begin
  Result := nil;
  if AParser.CanParseToken(FTokenSet) then
    Result := AParser.ParseToken(FTokenSet);
end;

destructor TTokenSetAlternate.Destroy;
begin
  if FDestroyTokenSet then
    FTokenSet.Free;
    
  inherited;
end;

function TTokenSetAlternate.GetDisplayText: string;
begin
  Result := FTokenSet.Name;
end;

function TTokenSetAlternate.LookAhead(AParser: IParser): Boolean;
begin
  Result := AParser.CanParseToken(FTokenSet);
end;

{ TRuleAlternate }

constructor TRuleAlternate.Create(ARuleType: TRuleType);
begin
  inherited Create;
  FRuleType := ARuleType;
end;

function TRuleAlternate.TryParse(AParser: IParser): TASTNode;
begin
  Result := nil;
  if AParser.CanParseRule(FRuleType) then
    Result := AParser.ParseRuleInternal(FRuleType);
end;

function TRuleAlternate.GetDisplayText: string;
begin
  Result := Copy(GetEnumName(TypeInfo(TRuleType), Integer(FRuleType)), 3)
end;

function TRuleAlternate.LookAhead(AParser: IParser): Boolean;
begin
  Result := AParser.CanParseRule(FRuleType);
end;

end.
