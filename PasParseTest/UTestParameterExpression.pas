unit UTestParameterExpression;

interface

uses
  UTest;

type
  TTestParameterExpression = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestParameterExpression }

class function TTestParameterExpression.GetName: string;
begin
  Result := 'ParameterExpression';
end;

class procedure TTestParameterExpression.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTParameterExpression));
  OK('''Foo''', TTestParser.ParsesAs('''Foo''',
    'StringLiteral |''Foo''|', RTParameterExpression));

  OK('42 = 42', TTestParser.ParsesAs('42 = 42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |42|' + #13#10 +
    '  OperatorNode: EqualSign |=|' + #13#10 +
    '  RightNode: Number |42|', RTParameterExpression));
    
  OK('42:4', TTestParser.ParsesAs('42:4',
    'NumberFormatNode' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SizeColonNode: Colon |:|' + #13#10 +
    '  SizeNode: Number |4|' + #13#10 +
    '  PrecisionColonNode: (none)' + #13#10 +
    '  PrecisionNode: (none)', RTParameterExpression));
    
  OK('42.0:4:2', TTestParser.ParsesAs('42.0:4:2',
    'NumberFormatNode' + #13#10 +
    '  ValueNode: Number |42.0|' + #13#10 +
    '  SizeColonNode: Colon |:|' + #13#10 +
    '  SizeNode: Number |4|' + #13#10 +
    '  PrecisionColonNode: Colon |:|' + #13#10 +
    '  PrecisionNode: Number |2|', RTParameterExpression));
end;

end.
