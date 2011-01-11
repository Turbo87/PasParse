unit UTokenRule;

interface

uses
  URule, UASTNode, UIParser, URuleType, UITokenSet;

type
  TTokenRule = class(TRule)
  protected
    FTokenSet: ITokenSet;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType;
      ATokenSet: ITokenSet); reintroduce;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

implementation

{ TTokenRule }

function TTokenRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(FTokenSet);
end;

constructor TTokenRule.Create(AParser: IParser; ARuleType: TRuleType;
  ATokenSet: ITokenSet);
begin
  inherited Create(AParser, ARuleType);
  FTokenSet := ATokenSet;
end;

function TTokenRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseToken(FTokenSet);
end;

end.
