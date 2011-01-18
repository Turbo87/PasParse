unit UTestTypeSection;

interface

uses
  UTest;

type
  TTestTypeSection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestTypeSection }

class function TTestTypeSection.GetName: string;
begin
  Result := 'TypeSection';
end;

class procedure TTestTypeSection.TestAll;
begin
  OK('type TFoo = Integer; TBar = Byte;', 
    TTestParser.ParsesAs('type TFoo = Integer; TBar = Byte;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TFoo|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TBar|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Byte|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  OK('type TFoo = class;', TTestParser.ParsesAs('type TFoo = class;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeForwardDeclarationNode' + #13#10 +
    '      NameNode: Identifier |TFoo|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeNode: ClassKeyword |class|' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTTypeSection));

  try
    TTestParser.ParsesAs('type', '', RTTypeSection);
    OK(False, 'typeexception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'type exception');
  else
    OK(False, 'type exception');
  end;
end;

end.
