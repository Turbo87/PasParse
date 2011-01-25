unit UTestRecordType;

interface

uses
  UTest;

type
  TTestRecordType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestRecordType }

class function TTestRecordType.GetName: string;
begin
  Result := 'RecordType';
end;

class procedure TTestRecordType.TestAll;
begin
  OK('record end', TTestParser.ParsesAs('record end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordType));

  OK('record procedure Foo; end', TTestParser.ParsesAs('record procedure Foo; end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: ListNode' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordType));

  OK('record case Integer of 1: (); end', 
    TTestParser.ParsesAs('record case Integer of 1: (); end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  VariantSectionNode: VariantSectionNode' + #13#10 +
    '    CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '    NameNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    TypeNode: Identifier |Integer|' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    VariantGroupListNode: ListNode' + #13#10 +
    '      Items[0]: VariantGroupNode' + #13#10 +
    '        ValueListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |1|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        FieldDeclListNode: ListNode' + #13#10 +
    '        VariantSectionNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '        SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTRecordType));

end;

end.
