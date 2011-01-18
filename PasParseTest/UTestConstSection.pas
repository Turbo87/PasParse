unit UTestConstSection;

interface

uses
  UTest;

type
  TTestConstSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestConstSection }

class function TTestConstSection.GetName: string;
begin
  Result := 'ConstSection';
end;

class procedure TTestConstSection.TestAll;
begin
  OK('const Foo = 24; Bar = 42;', TTestParser.ParsesAs('const Foo = 24; Bar = 42;',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |24|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Bar|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));

  OK('resourcestring Foo = ''Bar'';', TTestParser.ParsesAs('resourcestring Foo = ''Bar'';',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ResourceStringKeyword |resourcestring|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTConstSection));

  try
    TTestParser.ParsesAs('const', '', RTConstSection);
    OK(False, 'const exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'const exception');
  else
    OK(False, 'const exception');
  end;
end;

end.
