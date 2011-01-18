unit UTestFieldSection;

interface

uses
  UTest;

type
  TTestFieldSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestFieldSection }

class function TTestFieldSection.GetName: string;
begin
  Result := 'FieldSection';
end;

class procedure TTestFieldSection.TestAll;
begin
  OK('Foo: Integer; Bar: Boolean;',
    TTestParser.ParsesAs('Foo: Integer; Bar: Boolean;',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  VarKeywordNode: (none)' + #13#10 +
    '  FieldListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Bar|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Boolean|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTFieldSection));

  OK('var Foo: Integer;', TTestParser.ParsesAs('var Foo: Integer;',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  VarKeywordNode: VarKeyword |var|' + #13#10 +
    '  FieldListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTFieldSection));

  OK('class var Foo: Integer;', TTestParser.ParsesAs('class var Foo: Integer;',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  VarKeywordNode: VarKeyword |var|' + #13#10 +
    '  FieldListNode: ListNode' + #13#10 +
    '    Items[0]: FieldDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTFieldSection));

  OK('var', TTestParser.ParsesAs('var',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  VarKeywordNode: VarKeyword |var|' + #13#10 +
    '  FieldListNode: ListNode', RTFieldSection));

  OK('class var', TTestParser.ParsesAs('class var',
    'FieldSectionNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  VarKeywordNode: VarKeyword |var|' + #13#10 +
    '  FieldListNode: ListNode', RTFieldSection));


  try
    TTestParser.ParsesAs('class', '', RTFieldSection);
    OK(False, 'class exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'class exception');
  else
    OK(False, 'class exception');
  end;
end;

end.
