unit UTestProgram;

interface

uses
  UTest;

type
  TTestProgram = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestProgram }

class function TTestProgram.GetName: string;
begin
  Result := 'Program';
end;

class procedure TTestProgram.TestAll;
begin
  OK('program Foo; end.', TTestParser.ParsesAs('program Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('library Foo; end.', TTestParser.ParsesAs('library Foo; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: LibraryKeyword |library|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo(Input, Output); end.', 
    TTestParser.ParsesAs('program Foo(Input, Output); end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Input|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Output|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  NoiseCloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; uses SysUtils; end.', 
    TTestParser.ParsesAs('program Foo; uses SysUtils; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: UsesClauseNode' + #13#10 +
    '    UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '    UnitListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: UsedUnitNode' + #13#10 +
    '          NameNode: Identifier |SysUtils|' + #13#10 +
    '          InKeywordNode: (none)' + #13#10 +
    '          FileNameNode: (none)' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; const Foo = 42; end.', 
    TTestParser.ParsesAs('program Foo; const Foo = 42; end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '    Items[0]: ConstSectionNode' + #13#10 +
    '      ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '      ConstListNode: ListNode' + #13#10 +
    '        Items[0]: ConstantDeclNode' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          TypeNode: (none)' + #13#10 +
    '          EqualSignNode: EqualSign |=|' + #13#10 +
    '          ValueNode: Number |42|' + #13#10 +
    '          PortabilityDirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; [assembly: AssemblyVersion(''0.0.0.0'')] end.', 
    TTestParser.ParsesAs('program Foo; [assembly: AssemblyVersion(''0.0.0.0'')] end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '    Items[0]: AttributeNode' + #13#10 +
    '      OpenBracketNode: OpenBracket |[|' + #13#10 +
    '      ScopeNode: AssemblySemikeyword |assembly|' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      ValueNode: ParameterizedNode' + #13#10 +
    '        LeftNode: Identifier |AssemblyVersion|' + #13#10 +
    '        OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '        ParameterListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: StringLiteral |''0.0.0.0''|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        CloseDelimiterNode: CloseParenthesis |)|' + #13#10 +
    '      CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; initialization end.', 
    TTestParser.ParsesAs('program Foo; initialization end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; begin end.', TTestParser.ParsesAs('program Foo; begin end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));

  OK('program Foo; asm end.', TTestParser.ParsesAs('program Foo; asm end.',
    'ProgramNode' + #13#10 +
    '  ProgramKeywordNode: ProgramKeyword |program|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  NoiseOpenParenthesisNode: (none)' + #13#10 +
    '  NoiseContentListNode: ListNode' + #13#10 +
    '  NoiseCloseParenthesisNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  UsesClauseNode: (none)' + #13#10 +
    '  DeclarationListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: AssemblerStatementNode' + #13#10 +
    '          AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '          EndKeywordNode: EndKeyword |end|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: (none)' + #13#10 +
    '  DotNode: Dot |.|', RTProgram));
end;

end.
