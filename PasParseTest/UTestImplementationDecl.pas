unit UTestImplementationDecl;

interface

uses
  UTest;

type
  TTestImplementationDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestImplementationDecl }

class function TTestImplementationDecl.GetName: string;
begin
  Result := 'ImplementationDecl';
end;

class procedure TTestImplementationDecl.TestAll;
begin
  OK('label 42;', TTestParser.ParsesAs('label 42;',
    'LabelDeclSectionNode' + #13#10 +
    '  LabelKeywordNode: LabelKeyword |label|' + #13#10 +
    '  LabelListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTImplementationDecl));

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
    '      SemicolonNode: Semicolon |;|', RTImplementationDecl));

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
    '      SemicolonNode: Semicolon |;|', RTImplementationDecl));

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
    '      SemicolonNode: Semicolon |;|', RTImplementationDecl));
  
  OK('procedure Foo; begin end;', TTestParser.ParsesAs('procedure Foo; begin end;',
    'MethodImplementationNode' + #13#10 +
    '  MethodHeadingNode: MethodHeadingNode' + #13#10 +
    '    ClassKeywordNode: (none)' + #13#10 +
    '    MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '    NameNode: Identifier |Foo|' + #13#10 +
    '    OpenParenthesisNode: (none)' + #13#10 +
    '    ParameterListNode: ListNode' + #13#10 +
    '    CloseParenthesisNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ReturnTypeNode: (none)' + #13#10 +
    '    DirectiveListNode: ListNode' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  FancyBlockNode: FancyBlockNode' + #13#10 +
    '    DeclListNode: ListNode' + #13#10 +
    '    BlockNode: BlockNode' + #13#10 +
    '      BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '      StatementListNode: ListNode' + #13#10 +
    '      EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTImplementationDecl));

  OK('exports Foo;', TTestParser.ParsesAs('exports Foo;',
    'ExportsStatementNode' + #13#10 +
    '  ExportsKeywordNode: ExportsKeyword |exports|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ExportsItemNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        SpecifierListNode: ListNode' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTImplementationDecl));

  OK('[assembly: AssemblyVersion(''0.0.0.0'')]',
    TTestParser.ParsesAs('[assembly: AssemblyVersion(''0.0.0.0'')]',
    'AttributeNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ScopeNode: AssemblySemikeyword |assembly|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ValueNode: ParameterizedNode' + #13#10 +
    '    LeftNode: Identifier |AssemblyVersion|' + #13#10 +
    '    OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '    ParameterListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: StringLiteral |''0.0.0.0''|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseDelimiterNode: CloseParenthesis |)|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTImplementationDecl));
end;

end.
