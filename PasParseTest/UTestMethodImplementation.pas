unit UTestMethodImplementation;

interface

uses
  UTest;

type
  TTestMethodImplementation = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestMethodImplementation }

class function TTestMethodImplementation.GetName: string;
begin
  Result := 'MethodImplementation';
end;

class procedure TTestMethodImplementation.TestAll;
begin
  OK('procedure Foo; begin end;', TTestParser.ParsesAs('procedure Foo; begin end;',
    'MethodImplementationNode' + #13#10 +
    '  MethodHeadingNode: MethodHeadingNode' + #13#10 +
    '    ClassKeywordNode: (none)' + #13#10 +
    '    MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '    NameNode: Identifier |Foo|' + #13#10 +
    '    OpenParenthesisNode: (none)' + #13#10 +
    '    ParameterListNode: ListNode' + #13#10 +
    '    CloseParenthesisNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ReturnTypeNode: (none)' + #13#10 +
    '    DirectiveListNode: ListNode' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  FancyBlockNode: FancyBlockNode' + #13#10 +
    '    DeclListNode: ListNode' + #13#10 +
    '    BlockNode: BlockNode' + #13#10 +
    '      BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '      StatementListNode: ListNode' + #13#10 +
    '      EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodImplementation));
  {
  OK('procedure Foo; forward;', TTestParser.ParsesAs('procedure Foo; forward;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: ForwardSemikeyword |forward|' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodImplementation));

  OK('procedure Foo; external ''Foo'';', 
    TTestParser.ParsesAs('procedure Foo; external ''Foo'';',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '      KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '      ValueNode: StringLiteral |''Foo''|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodImplementation));
  }
end;

end.
