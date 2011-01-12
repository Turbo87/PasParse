unit UTestExpressionOrRange;

interface

uses
  UTest;

type
  TTestExpressionOrRange = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExpressionOrRange }

class function TTestExpressionOrRange.GetName: string;
begin
  Result := 'ExpressionOrRange';
end;

class procedure TTestExpressionOrRange.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42',
    'Number |42|', RTExpressionOrRange));

  OK('0..42', TTestParser.ParsesAs('0..42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |0|' + #13#10 +
    '  OperatorNode: DotDot |..|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrRange));
end;

end.
