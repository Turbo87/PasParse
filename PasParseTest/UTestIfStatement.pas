unit UTestIfStatement;

interface

uses
  UTest;

type
  TTestIfStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestIfStatement }

class function TTestIfStatement.GetName: string;
begin
  Result := 'IfStatement';
end;

class procedure TTestIfStatement.TestAll;
begin
  OK('if Foo then', TTestParser.ParsesAs('if Foo then',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: (none)' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementNode: (none)', RTIfStatement));

  OK('if Foo then Bar', TTestParser.ParsesAs('if Foo then Bar',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: Identifier |Bar|' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementNode: (none)', RTIfStatement));

  OK('if Foo then else', TTestParser.ParsesAs('if Foo then else',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: (none)' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementNode: (none)', RTIfStatement));

  OK('if Foo then Bar else Baz', TTestParser.ParsesAs('if Foo then Bar else Baz',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: Identifier |Bar|' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementNode: Identifier |Baz|', RTIfStatement));

  OK('if Foo then if Bar then else',
    TTestParser.ParsesAs('if Foo then if Bar then else',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: IfStatementNode' + #13#10 +
    '    IfKeywordNode: IfKeyword |if|' + #13#10 +
    '    ConditionNode: Identifier |Bar|' + #13#10 +
    '    ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '    ThenStatementNode: (none)' + #13#10 +
    '    ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '    ElseStatementNode: (none)' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementNode: (none)', RTIfStatement));

  OK('if Foo then if Bar then else else',
    TTestParser.ParsesAs('if Foo then if Bar then else else',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: IfStatementNode' + #13#10 +
    '    IfKeywordNode: IfKeyword |if|' + #13#10 +
    '    ConditionNode: Identifier |Bar|' + #13#10 +
    '    ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '    ThenStatementNode: (none)' + #13#10 +
    '    ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '    ElseStatementNode: (none)' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementNode: (none)', RTIfStatement));
end;

end.
