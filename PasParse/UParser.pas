unit UParser;

interface

uses
  UCompilerDefines, UToken, UIFrame, UITokenSet, UTokenType, UListNode,
  UParseException, UIParser, Contnrs;

type
  TFileLoader = class

  end;
  TRule = class

  end;

  TParser = class(IParser)
  protected
    FNextFrame: IFrame;
    FRules: array of TRule;

    class function FrameFromTokens(ATokens: TObjectList): IFrame;
    function GetIsEOF: Boolean;

    function ParseToken(ATokenType: TTokenType): TToken; overload; override;
    function ParseTokenList(ATokenSet: ITokenSet): TListNode; override;
    function TryParseToken(ATokenType: TTokenType): TToken; override;
    function CanParseToken(ATokenType: TTokenType): Boolean; overload; override;

    function Peek(AOffset: Integer): TTokenType; override;

    function CreateEmptyListNode: TListNode; override;

    procedure MoveNext; override;

  public
    constructor CreateFromText(AText, AFileName: string;
      ACompilerDefines: TCompilerDefines; AFileLoader: TFileLoader);
    constructor CreateFromFrame(AFrame: IFrame);
    constructor CreateFromTokens(ATokens: TObjectList);
    destructor Destroy; override;

    property IsEOF: Boolean read GetIsEOF;

    function ParseToken(ATokenSet: ITokenSet): TToken; overload; override;
    function CanParseToken(ATokenSet: ITokenSet): Boolean; overload; override;

    function Failure(AExpected: string): EParseException; override;
  end;

implementation

uses
  ULexScanner, URuleType, UEOFFrame, ULocation, UFrame, USingleTokenTokenSet;

{ TParser }

function TParser.CanParseToken(ATokenType: TTokenType): Boolean;
begin
  Result := (Peek(0) = ATokenType);
end;

function TParser.CanParseToken(ATokenSet: ITokenSet): Boolean;
begin
  Result := ATokenSet.Contains(Peek(0));
end;

function TParser.CreateEmptyListNode: TListNode;
begin
  Result := TListNode.Create(TObjectList.Create(False));
end;

constructor TParser.CreateFromFrame(AFrame: IFrame);
begin
  inherited Create;
  FNextFrame := AFrame;
  SetLength(FRules, Integer(High(TRuleType)) + 1);
  // TODO AddRule calls
end;

constructor TParser.CreateFromText(AText, AFileName: string;
  ACompilerDefines: TCompilerDefines; AFileLoader: TFileLoader);
var
  ALexScanner: TLexScanner;
begin
  ALexScanner := TLexScanner.Create(AText, AFileName);
  // TODO TokenFilter
  CreateFromTokens(ALexScanner.Tokens);
  ALexScanner.Free;
end;

constructor TParser.CreateFromTokens(ATokens: TObjectList);
begin
  CreateFromFrame(FrameFromTokens(ATokens));
end;

destructor TParser.Destroy;
begin
  SetLength(FRules, 0);
  inherited;
end;

function TParser.Failure(AExpected: string): EParseException;
begin
  Result := EParseException.Create('Expected ' + AExpected + ' but was ' +
    FNextFrame.DisplayName, FNextFrame.Location);
end;

class function TParser.FrameFromTokens(ATokens: TObjectList): IFrame;
var
  AFirstFrame: IFrame;
  APrevFrame: IFrame;
  AFrame: IFrame;
  I: Integer;
begin
  AFirstFrame := TEOFFrame.Create(TLocation.Create('', '', 0));
  APrevFrame := nil;
  for I := 0 to ATokens.Count - 1 do
  begin
    AFrame := TFrame.Create(ATokens[I] as TToken);
    if APrevFrame <> nil then
      APrevFrame.Next := AFrame
    else
    begin
      AFirstFrame.Free;
      AFirstFrame := AFrame;
    end;

    APrevFrame := AFrame;
  end;

  Result := AFirstFrame;
end;

function TParser.GetIsEOF: Boolean;
begin
  Result := FNextFrame.IsEOF;
end;

procedure TParser.MoveNext;
begin
  FNextFrame := FNextFrame.Next;
end;

function TParser.ParseToken(ATokenType: TTokenType): TToken;
var
  ASingleTokenTokenSet: TSingleTokenTokenSet;
begin
  ASingleTokenTokenSet := TSingleTokenTokenSet.Create(ATokenType);
  Result := ParseToken(ASingleTokenTokenSet);
  ASingleTokenTokenSet.Free;
end;

function TParser.ParseToken(ATokenSet: ITokenSet): TToken;
begin
  Result := FNextFrame.ParseToken(ATokenSet);
  MoveNext;
end;

function TParser.ParseTokenList(ATokenSet: ITokenSet): TListNode;
var
  AList: TObjectList;
begin
  AList := TObjectList.Create(False);
  
  while CanParseToken(ATokenSet) do
    AList.Add(ParseToken(ATokenSet));

  Result := TListNode.Create(AList);
end;

function TParser.Peek(AOffset: Integer): TTokenType;
var
  AFrame: IFrame;
begin
  AFrame := FNextFrame;
  while AOffset > 0 do
  begin
    AFrame := AFrame.Next;
    Dec(AOffset);
  end;
  Result := AFrame.TokenType;
end;

function TParser.TryParseToken(ATokenType: TTokenType): TToken;
begin
  if CanParseToken(ATokenType) then
    Result := ParseToken(ATokenType)
  else
    Result := nil;
end;

end.
