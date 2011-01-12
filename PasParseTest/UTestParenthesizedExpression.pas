unit UTestParenthesizedExpression;

interface

uses
  UTest;

type
  TTestParenthesizedExpression = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestParenthesizedExpression }

class function TTestParenthesizedExpression.GetName: string;
begin
  Result := 'ParenthesizedExpression';
end;

class procedure TTestParenthesizedExpression.TestAll;
begin
  OK('(nil)', TTestParser.ParsesAs('(nil)',
    'ParenthesizedExpressionNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ExpressionNode: NilKeyword |nil|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTParenthesizedExpression));

  OK('(6 * 9)', TTestParser.ParsesAs('(6 * 9)',
    'ParenthesizedExpressionNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ExpressionNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |6|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |9|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTParenthesizedExpression));
end;

end.
