unit URule;

interface

uses
  UASTNode, UIParser, URuleType;

type
  TRule = class
  protected
    FParser: IParser;
    FRuleType: TRuleType;

    function CanParse: Boolean; virtual; abstract;
    function Evaluate: TASTNode; virtual; abstract;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType);

    function Execute: TASTNode;
  end;

implementation

uses
  TypInfo;

{ TRule }

constructor TRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create;
  FParser := AParser;
  FRuleType := ARuleType;
end;

function TRule.Execute: TASTNode;
begin
  if not CanParse then
    raise FParser.Failure(Copy(GetEnumName(TypeInfo(TRuleType),
      Integer(FRuleType)), 3));
  Result := Evaluate;
end;

end.
