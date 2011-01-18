unit UTestVariantSection;

interface

uses
  UTest;

type
  TTestVariantSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestVariantSection }

class function TTestVariantSection.GetName: string;
begin
  Result := 'VariantSection';
end;

class procedure TTestVariantSection.TestAll;
begin
  OK('case Integer of 1: ()', 
    TTestParser.ParsesAs('case Integer of 1: ()',
    'VariantSectionNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  NameNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  VariantGroupListNode: ListNode' + #13#10 +
    '    Items[0]: VariantGroupNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '      FieldDeclListNode: ListNode' + #13#10 +
    '      VariantSectionNode: (none)' + #13#10 +
    '      CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      SemicolonNode: (none)', RTVariantSection));

  OK('case Foo: Integer of 1: ()', 
    TTestParser.ParsesAs('case Foo: Integer of 1: ()',
    'VariantSectionNode' + #13#10 +
    '  CaseKeywordNode: CaseKeyword |case|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  VariantGroupListNode: ListNode' + #13#10 +
    '    Items[0]: VariantGroupNode' + #13#10 +
    '      ValueListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Number |1|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '      FieldDeclListNode: ListNode' + #13#10 +
    '      VariantSectionNode: (none)' + #13#10 +
    '      CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      SemicolonNode: (none)', RTVariantSection));
                
  try
    TTestParser.ParsesAs('case Foo: Integer of', '', RTVariantSection);
    OK(False, 'case Foo: Integer of exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'case Foo: Integer of exception');
  else
    OK(False, 'case Foo: Integer of exception');
  end;
end;

end.
