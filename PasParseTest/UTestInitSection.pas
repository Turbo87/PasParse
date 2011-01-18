unit UTestInitSection;

interface

uses
  UTest;

type
  TTestInitSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestInitSection }

class function TTestInitSection.GetName: string;
begin
  Result := 'InitSection';
end;

class procedure TTestInitSection.TestAll;
begin
  OK('end', TTestParser.ParsesAs('end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization end', TTestParser.ParsesAs('initialization end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization finalization end', 
    TTestParser.ParsesAs('initialization finalization end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization Foo; Bar; end', 
    TTestParser.ParsesAs('initialization Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('initialization Foo; Bar; finalization Baz; Quux; end', 
    TTestParser.ParsesAs('initialization Foo; Bar; finalization Baz; Quux; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: InitializationKeyword |initialization|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: FinalizationKeyword |finalization|' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Baz|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Quux|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('begin end', TTestParser.ParsesAs('begin end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));

  OK('begin Foo; Bar; end', TTestParser.ParsesAs('begin Foo; Bar; end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: BeginKeyword |begin|' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInitSection));
  
  OK('asm end', TTestParser.ParsesAs('asm end',
    'InitSectionNode' + #13#10 +
    '  InitializationKeywordNode: (none)' + #13#10 +
    '  InitializationStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: AssemblerStatementNode' + #13#10 +
    '        AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '        EndKeywordNode: EndKeyword |end|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  FinalizationKeywordNode: (none)' + #13#10 +
    '  FinalizationStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: (none)', RTInitSection));
end;

end.
