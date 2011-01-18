unit UTestVarSection;

interface

uses
  UTest;

type
  TTestVarSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestVarSection }

class function TTestVarSection.GetName: string;
begin
  Result := 'VarSection';
end;

class procedure TTestVarSection.TestAll;
begin
  OK('var Foo: Integer;', TTestParser.ParsesAs('var Foo: Integer;',
    'VarSectionNode' + #13#10 +
    '  VarKeywordNode: VarKeyword |var|' + #13#10 +
    '  VarListNode: ListNode' + #13#10 +
    '    Items[0]: VarDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '      AbsoluteSemikeywordNode: (none)' + #13#10 +
    '      AbsoluteAddressNode: (none)' + #13#10 +
    '      EqualSignNode: (none)' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVarSection));

  OK('threadvar Foo: Integer;', TTestParser.ParsesAs('threadvar Foo: Integer;',
    'VarSectionNode' + #13#10 +
    '  VarKeywordNode: ThreadVarKeyword |threadvar|' + #13#10 +
    '  VarListNode: ListNode' + #13#10 +
    '    Items[0]: VarDeclNode' + #13#10 +
    '      NameListNode: ListNode' + #13#10 +
    '        Items[0]: DelimitedItemNode' + #13#10 +
    '          ItemNode: Identifier |Foo|' + #13#10 +
    '          DelimiterNode: (none)' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '      AbsoluteSemikeywordNode: (none)' + #13#10 +
    '      AbsoluteAddressNode: (none)' + #13#10 +
    '      EqualSignNode: (none)' + #13#10 +
    '      ValueNode: (none)' + #13#10 +
    '      SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTVarSection));

  try
    TTestParser.ParsesAs('var', '', RTVarSection);
    OK(False, 'var exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'var exception');
  else
    OK(False, 'var exception');
  end;
end;

end.
