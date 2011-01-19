unit UTestUnit;

interface

uses
  UTest;

type
  TTestUnit = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestUnit }

class function TTestUnit.GetName: string;
begin
  Result := 'Unit';
end;

class procedure TTestUnit.TestAll;
begin
  OK('unit Foo; interface implementation end.',
    TTestParser.ParsesAs('unit Foo; interface implementation end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTUnit));

  OK('unit Foo library deprecated; interface implementation end.', 
    TTestParser.ParsesAs('unit Foo library deprecated; interface implementation end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: LibraryKeyword |library|' + #13#10 +
    '    Items[1]: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: (none)' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTUnit));

  OK('unit Foo; interface implementation initialization end.', 
    TTestParser.ParsesAs('unit Foo; interface implementation initialization end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTUnit));

  OK('unit Foo; interface implementation begin end.', 
    TTestParser.ParsesAs('unit Foo; interface implementation begin end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  InitSectionNode: InitSectionNode' + #13#10 +
    '    InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '    InitializationStatementListNode: ListNode' + #13#10 +
    '    FinalizationKeywordNode: (none)' + #13#10 +
    '    FinalizationStatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTUnit));

  OK('unit Foo; interface implementation asm end.', 
    TTestParser.ParsesAs('unit Foo; interface implementation asm end.',
    'UnitNode' + #13#10 +
    '  UnitKeywordNode: UnitKeyword |unit|' + #13#10 +
    '  UnitNameNode: Identifier |Foo|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  InterfaceSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
    '  ImplementationSectionNode: UnitSectionNode' + #13#10 +
    '    HeaderKeywordNode: ImplementationKeyword |implementation|' + #13#10 +
    '    UsesClauseNode: (none)' + #13#10 +
    '    ContentListNode: ListNode' + #13#10 +
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
    '  DotNode: Dot |.|', RTUnit));
end;

end.
