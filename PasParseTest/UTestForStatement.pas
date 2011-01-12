unit UTestForStatement;

interface

uses
  UTest;

type
  TTestForStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestForStatement }

class function TTestForStatement.GetName: string;
begin
  Result := 'ForStatement';
end;

class procedure TTestForStatement.TestAll;
begin
  OK('for I := 1 to 42 do', TTestParser.ParsesAs('for I := 1 to 42 do',
    'ForStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |I|' + #13#10 +
    '  ColonEqualsNode: ColonEquals |:=|' + #13#10 +
    '  StartingValueNode: Number |1|' + #13#10 +
    '  DirectionNode: ToKeyword |to|' + #13#10 +
    '  EndingValueNode: Number |42|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTForStatement));

  OK('for I := 42 downto 1 do', TTestParser.ParsesAs('for I := 42 downto 1 do',
    'ForStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |I|' + #13#10 +
    '  ColonEqualsNode: ColonEquals |:=|' + #13#10 +
    '  StartingValueNode: Number |42|' + #13#10 +
    '  DirectionNode: DownToKeyword |downto|' + #13#10 +
    '  EndingValueNode: Number |1|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTForStatement));

  OK('for I := 1 to 42 do Foo', TTestParser.ParsesAs('for I := 1 to 42 do Foo',
    'ForStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |I|' + #13#10 +
    '  ColonEqualsNode: ColonEquals |:=|' + #13#10 +
    '  StartingValueNode: Number |1|' + #13#10 +
    '  DirectionNode: ToKeyword |to|' + #13#10 +
    '  EndingValueNode: Number |42|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Foo|', RTForStatement));

  OK('for Obj in List do', TTestParser.ParsesAs('for Obj in List do',
    'ForInStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |Obj|' + #13#10 +
    '  InKeywordNode: InKeyword |in|' + #13#10 +
    '  ExpressionNode: Identifier |List|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTForStatement));

  OK('for Obj in List do Foo', TTestParser.ParsesAs('for Obj in List do Foo',
    'ForInStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |Obj|' + #13#10 +
    '  InKeywordNode: InKeyword |in|' + #13#10 +
    '  ExpressionNode: Identifier |List|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Foo|', RTForStatement));
end;

end.
