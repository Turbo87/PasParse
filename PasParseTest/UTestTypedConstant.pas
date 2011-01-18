unit UTestTypedConstant;

interface

uses
  UTest;

type
  TTestTypedConstant = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestTypedConstant }

class function TTestTypedConstant.GetName: string;
begin
  Result := 'TypedConstant';
end;

class procedure TTestTypedConstant.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTTypedConstant));

  OK('(6 * 9)', TTestParser.ParsesAs('(6 * 9)',
    'ParenthesizedExpressionNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ExpressionNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |6|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |9|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  
  OK('(6, 9)', TTestParser.ParsesAs('(6, 9)',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |6|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |9|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  {
  OK('(Foo: 24; Bar.Baz: 42)', TTestParser.ParsesAs('(Foo: 24; Bar.Baz: 42)',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: RecordFieldConstantNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        ValueNode: Number |24|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: RecordFieldConstantNode' + #13#10 +
    '        NameNode: BinaryOperationNode' + #13#10 +
    '          LeftNode: Identifier |Bar|' + #13#10 +
    '          OperatorNode: Dot |.|' + #13#10 +
    '          RightNode: Identifier |Baz|' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        ValueNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  }
  OK('((6), (9))', TTestParser.ParsesAs('((6), (9))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParenthesizedExpressionNode' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        ExpressionNode: Number |6|' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ParenthesizedExpressionNode' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        ExpressionNode: Number |9|' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));

  OK('((6, 9))', TTestParser.ParsesAs('((6, 9))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ConstantListNode' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        ItemListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |6|' + #13#10 +
    '            DelimiterNode: Comma |,|' + #13#10 +
    '          Items[1]: DelimitedItemNode' + #13#10 +
    '            ItemNode: Number |9|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  {
  OK('((Foo: 42))', TTestParser.ParsesAs('((Foo: 42))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: ConstantListNode' + #13#10 +
    '        OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '        ItemListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: RecordFieldConstantNode' + #13#10 +
    '              NameNode: Identifier |Foo|' + #13#10 +
    '              ColonNode: Colon |:|' + #13#10 +
    '              ValueNode: Number |42|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));

  OK('(Foo: (42))', TTestParser.ParsesAs('(Foo: (42))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: RecordFieldConstantNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        ValueNode: ParenthesizedExpressionNode' + #13#10 +
    '          OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '          ExpressionNode: Number |42|' + #13#10 +
    '          CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));

  OK('(Foo: (6, 9))', TTestParser.ParsesAs('(Foo: (6, 9))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: RecordFieldConstantNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        ValueNode: ConstantListNode' + #13#10 +
    '          OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '          ItemListNode: ListNode' + #13#10 +
    '            Items[0]: DelimitedItemNode' + #13#10 +
    '              ItemNode: Number |6|' + #13#10 +
    '              DelimiterNode: Comma |,|' + #13#10 +
    '            Items[1]: DelimitedItemNode' + #13#10 +
    '              ItemNode: Number |9|' + #13#10 +
    '              DelimiterNode: (none)' + #13#10 +
    '          CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));

  OK('(Foo: (Bar: 42))', TTestParser.ParsesAs('(Foo: (Bar: 42))',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: RecordFieldConstantNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        ColonNode: Colon |:|' + #13#10 +
    '        ValueNode: ConstantListNode' + #13#10 +
    '          OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '          ItemListNode: ListNode' + #13#10 +
    '            Items[0]: DelimitedItemNode' + #13#10 +
    '              ItemNode: RecordFieldConstantNode' + #13#10 +
    '                NameNode: Identifier |Bar|' + #13#10 +
    '                ColonNode: Colon |:|' + #13#10 +
    '                ValueNode: Number |42|' + #13#10 +
    '              DelimiterNode: (none)' + #13#10 +
    '          CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  }
  OK('()', TTestParser.ParsesAs('()',
    'ConstantListNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTTypedConstant));
  
end;

end.
