unit UTestSimpleStatement;

interface

uses
  UTest;

type
  TTestSimpleStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestSimpleStatement }

class function TTestSimpleStatement.GetName: string;
begin
  Result := 'SimpleStatement';
end;

class procedure TTestSimpleStatement.TestAll;
begin
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTSimpleStatement));

  OK('inherited Foo', TTestParser.ParsesAs('inherited Foo',
    'UnaryOperationNode' + #13#10 +
    '  OperatorNode: InheritedKeyword |inherited|' + #13#10 +
    '  OperandNode: Identifier |Foo|', RTSimpleStatement));

  OK('Foo := 42', TTestParser.ParsesAs('Foo := 42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: ColonEquals |:=|' + #13#10 +
    '  RightNode: Number |42|', RTSimpleStatement));

  OK('goto 42', TTestParser.ParsesAs('goto 42',
    'GotoStatementNode' + #13#10 +
    '  GotoKeywordNode: GotoKeyword |goto|' + #13#10 +
    '  LabelIdNode: Number |42|', RTSimpleStatement));

  OK('begin end', TTestParser.ParsesAs('begin end',
    'BlockNode' + #13#10 +
    '  BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTSimpleStatement));

  OK('if Foo then Bar', TTestParser.ParsesAs('if Foo then Bar',
    'IfStatementNode' + #13#10 +
    '  IfKeywordNode: IfKeyword |if|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  ThenKeywordNode: ThenKeyword |then|' + #13#10 +
    '  ThenStatementNode: Identifier |Bar|' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementNode: (none)', RTSimpleStatement));

  OK('case Foo of 1: end', TTestParser.ParsesAs('case Foo of 1: end',
    'CaseStatementNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  SelectorListNode: ListNode' + #13#10 +
    '    Items[0]: CaseSelectorNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTSimpleStatement));

  OK('repeat until Doomsday', TTestParser.ParsesAs('repeat until Doomsday',
    'RepeatStatementNode' + #13#10 +
    '  RepeatKeywordNode: RepeatKeyword |repeat|' + #13#10 +
    '  StatementListNode: ListNode' + #13#10 +
    '  UntilKeywordNode: UntilKeyword |until|' + #13#10 +
    '  ConditionNode: Identifier |Doomsday|', RTSimpleStatement));

  OK('while Foo do Bar', TTestParser.ParsesAs('while Foo do Bar',
    'WhileStatementNode' + #13#10 +
    '  WhileKeywordNode: WhileKeyword |while|' + #13#10 +
    '  ConditionNode: Identifier |Foo|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTSimpleStatement));

  OK('for I := 1 to 42 do', TTestParser.ParsesAs('for I := 1 to 42 do',
    'ForStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |I|' + #13#10 +
    '  ColonEqualsNode: ColonEquals |:=|' + #13#10 +
    '  StartingValueNode: Number |1|' + #13#10 +
    '  DirectionNode: ToKeyword |to|' + #13#10 +
    '  EndingValueNode: Number |42|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTSimpleStatement));

  OK('with Foo do', TTestParser.ParsesAs('with Foo do',
    'WithStatementNode' + #13#10 +
    '  WithKeywordNode: WithKeyword |with|' + #13#10 +
    '  ExpressionListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTSimpleStatement));

  OK('for Obj in List do', TTestParser.ParsesAs('for Obj in List do',
    'ForInStatementNode' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  LoopVariableNode: Identifier |Obj|' + #13#10 +
    '  InKeywordNode: InKeyword |in|' + #13#10 +
    '  ExpressionNode: Identifier |List|' + #13#10 +
    '  DoKeywordNode: DoKeyword |do|' + #13#10 +
    '  StatementNode: (none)', RTSimpleStatement));

  OK('try except end', TTestParser.ParsesAs('try except end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTSimpleStatement));

  OK('try finally end', TTestParser.ParsesAs('try finally end',
    'TryFinallyNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  FinallyKeywordNode: FinallyKeyword |finally|' + #13#10 +
    '  FinallyStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTSimpleStatement));

  OK('raise E', TTestParser.ParsesAs('raise E',
    'RaiseStatementNode' + #13#10 +
    '  RaiseKeywordNode: RaiseKeyword |raise|' + #13#10 +
    '  ExceptionNode: Identifier |E|' + #13#10 +
    '  AtSemikeywordNode: (none)' + #13#10 +
    '  AddressNode: (none)', RTSimpleStatement));
end;

end.
