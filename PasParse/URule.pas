unit URule;

interface

uses
  UASTNode, UIParser, URuleType;

type
  TRule = class
  protected
    FParser: IParser;
    FRuleType: TRuleType;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); virtual; 

    function CanParse: Boolean; virtual; abstract;
    function Evaluate: TASTNode; virtual; abstract;

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
var
   AType: string;
begin
  if not CanParse then
  begin
    AType := GetEnumName(TypeInfo(TRuleType), Integer(FRuleType));
    raise FParser.Failure(Copy(AType, 3, Length(AType) - 2));
  end;
  Result := Evaluate;
end;

end.
