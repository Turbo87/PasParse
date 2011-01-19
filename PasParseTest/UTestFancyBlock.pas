unit UTestFancyBlock;

interface

uses
  UTest;

type
  TTestFancyBlock = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestFancyBlock }

class function TTestFancyBlock.GetName: string;
begin
  Result := 'FancyBlock';
end;

class procedure TTestFancyBlock.TestAll;
begin
  OK('begin end', TTestParser.ParsesAs('begin end',
    'FancyBlockNode' + #13#10 +
    '  DeclListNode: ListNode' + #13#10 +
    '  BlockNode: BlockNode' + #13#10 +
    '    BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '    StatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));

  OK('var Foo: Integer; begin end', TTestParser.ParsesAs('var Foo: Integer; begin end',
    'FancyBlockNode' + #13#10 +
    '  DeclListNode: ListNode' + #13#10 +
    '    Items[0]: VarSectionNode' + #13#10 +
    '      VarKeywordNode: VarKeyword |var|' + #13#10 +
    '      VarListNode: ListNode' + #13#10 +
    '        Items[0]: VarDeclNode' + #13#10 +
    '          NameListNode: ListNode' + #13#10 +
    '            Items[0]: DelimitedItemNode' + #13#10 +
    '              ItemNode: Identifier |Foo|' + #13#10 +
    '              DelimiterNode: (none)' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          TypeNode: Identifier |Integer|' + #13#10 +
    '          FirstPortabilityDirectiveListNode: ListNode' + #13#10 +
    '          AbsoluteSemikeywordNode: (none)' + #13#10 +
    '          AbsoluteAddressNode: (none)' + #13#10 +
    '          EqualSignNode: (none)' + #13#10 +
    '          ValueNode: (none)' + #13#10 +
    '          SecondPortabilityDirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  BlockNode: BlockNode' + #13#10 +
    '    BeginKeywordNode: BeginKeyword |begin|' + #13#10 +
    '    StatementListNode: ListNode' + #13#10 +
    '    EndKeywordNode: EndKeyword |end|', RTFancyBlock));
end;

end.
