unit UTestExpression;

interface

uses
  UTest;

type
  TTestExpression = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExpression }

class function TTestExpression.GetName: string;
begin
  Result := 'Expression';
end;

class procedure TTestExpression.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTExpression));

  OK('40 + 2', TTestParser.ParsesAs('40 + 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |40|' + #13#10 +
    '  OperatorNode: PlusSign |+|' + #13#10 +
    '  RightNode: Number |2|', RTExpression));

  OK('A = B', TTestParser.ParsesAs('A = B',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |A|' + #13#10 +
    '  OperatorNode: EqualSign |=|' + #13#10 +
    '  RightNode: Identifier |B|', RTExpression));

  OK('A = B = C', TTestParser.ParsesAs('A = B = C',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |A|' + #13#10 +
    '    OperatorNode: EqualSign |=|' + #13#10 +
    '    RightNode: Identifier |B|' + #13#10 +
    '  OperatorNode: EqualSign |=|' + #13#10 +
    '  RightNode: Identifier |C|', RTExpression));
end;

end.
