unit UTestGoal;

interface

uses
  UTest;

type
  TTestGoal = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestGoal }

class function TTestGoal.GetName: string;
begin
  Result := 'Goal';
end;

class procedure TTestGoal.TestAll;
begin
  OK('package Foo; end.', TTestParser.ParsesAs('package Foo; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTGoal));

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
    '  DotNode: Dot |.|', RTGoal));

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
    '  DotNode: Dot |.|', RTGoal));

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
    '  DotNode: Dot |.|', RTGoal));    
end;

end.
