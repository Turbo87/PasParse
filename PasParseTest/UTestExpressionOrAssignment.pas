unit UTestExpressionOrAssignment;

interface

uses
  UTest;

type
  TTestExpressionOrAssignment = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExpressionOrAssignment }

class function TTestExpressionOrAssignment.GetName: string;
begin
  Result := 'ExpressionOrAssignment';
end;

class procedure TTestExpressionOrAssignment.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'Identifier |Foo|', RTExpressionOrAssignment));

  OK('Foo := 42', TTestParser.ParsesAs('Foo := 42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: ColonEquals |:=|' + #13#10 +
    '  RightNode: Number |42|', RTExpressionOrAssignment));
end;

end.
