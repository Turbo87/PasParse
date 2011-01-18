unit UTestVarDecl;

interface

uses
  UTest;

type
  TTestVarDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestVarDecl }

class function TTestVarDecl.GetName: string;
begin
  Result := 'VarDecl';
end;

class procedure TTestVarDecl.TestAll;
begin
  OK('Foo: Integer;', TTestParser.ParsesAs('Foo: Integer;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer absolute Bar;', TTestParser.ParsesAs('Foo: Integer absolute Bar;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: AbsoluteSemikeyword |absolute|' + #13#10 +
    '  AbsoluteAddressNode: Identifier |Bar|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer = 42;', TTestParser.ParsesAs('Foo: Integer = 42;', 
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: TPoint = (X: 0; Y: 0);', TTestParser.ParsesAs('Foo: TPoint = (X: 0; Y: 0);',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: ConstantListNode' + #13#10 +
    '    OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '    ItemListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |X|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: Semicolon |;|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: RecordFieldConstantNode' + #13#10 +
    '          NameNode: Identifier |Y|' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          ValueNode: Number |0|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer deprecated library;', 
    TTestParser.ParsesAs('Foo: Integer deprecated library;', 
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '    Items[1]: LibraryKeyword |library|' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));

  OK('Foo: Integer deprecated = 42 platform;', 
    TTestParser.ParsesAs('Foo: Integer deprecated = 42 platform;',
    'VarDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '  AbsoluteSemikeywordNode: (none)' + #13#10 +
    '  AbsoluteAddressNode: (none)' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: PlatformSemikeyword |platform|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTVarDecl));    
end;

end.
