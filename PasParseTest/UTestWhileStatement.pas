unit UTestWhileStatement;

interface

uses
  UTest;

type
  TTestWhileStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestWhileStatement }

class function TTestWhileStatement.GetName: string;
begin
  Result := 'WhileStatement';
end;

class procedure TTestWhileStatement.TestAll;
begin
  OK('while Foo do', TTestParser.ParsesAs('while Foo do',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTWhileStatement));

  OK('while Foo do Bar', TTestParser.ParsesAs('while Foo do Bar',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTWhileStatement));
end;

end.
