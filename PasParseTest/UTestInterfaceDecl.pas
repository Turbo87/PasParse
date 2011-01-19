unit UTestInterfaceDecl;

interface

uses
  UTest;

type
  TTestInterfaceDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestInterfaceDecl }

class function TTestInterfaceDecl.GetName: string;
begin
  Result := 'InterfaceDecl';
end;

class procedure TTestInterfaceDecl.TestAll;
begin
  OK('const Foo = 42;', TTestParser.ParsesAs('const Foo = 42;',
    'ConstSectionNode' + #13#10 +
    '  ConstKeywordNode: ConstKeyword |const|' + #13#10 +
    '  ConstListNode: ListNode' + #13#10 +
    '    Items[0]: ConstantDeclNode' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: (none)' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTInterfaceDecl));

  OK('type TFoo = Integer;', TTestParser.ParsesAs('type TFoo = Integer;',
    'TypeSectionNode' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeListNode: ListNode' + #13#10 +
    '    Items[0]: TypeDeclNode' + #13#10 +
    '      NameNode: Identifier |TFoo|' + #13#10 +
    '      EqualSignNode: EqualSign |=|' + #13#10 +
    '      TypeKeywordNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Integer|' + #13#10 +
    '      PortabilityDirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|', RTInterfaceDecl));

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
    '      SemicolonNode: Semicolon |;|', RTInterfaceDecl));

  OK('procedure Foo;', TTestParser.ParsesAs('procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTInterfaceDecl));
end;

end.
