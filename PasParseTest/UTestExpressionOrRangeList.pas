unit UTestExpressionOrRangeList;

interface

uses
  UTest;

type
  TTestExpressionOrRangeList = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExpressionOrRangeList }

class function TTestExpressionOrRangeList.GetName: string;
begin
  Result := 'ExpressionOrRangeList';
end;

class procedure TTestExpressionOrRangeList.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Number |42|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('6 * 9', TTestParser.ParsesAs('6 * 9',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: BinaryOperationNode' + #13#10 +
    '      LeftNode: Number |6|' + #13#10 +
    '      OperatorNode: TimesSign |*|' + #13#10 +
    '      RightNode: Number |9|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('24..42', TTestParser.ParsesAs('24..42',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: BinaryOperationNode' + #13#10 +
    '      LeftNode: Number |24|' + #13#10 +
    '      OperatorNode: DotDot |..|' + #13#10 +
    '      RightNode: Number |42|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('24, 42', TTestParser.ParsesAs('24, 42',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Number |24|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Number |42|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('''4'', ''2''', TTestParser.ParsesAs('''4'', ''2''',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: StringLiteral |''4''|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: StringLiteral |''2''|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('Foo, Bar', TTestParser.ParsesAs('Foo, Bar',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Bar|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('Absolute, Index', TTestParser.ParsesAs('Absolute, Index',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Absolute|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Index|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));

  OK('(24), (42)', TTestParser.ParsesAs('(24), (42)',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: ParenthesizedExpressionNode' + #13#10 +
    '      OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '      ExpressionNode: Number |24|' + #13#10 +
    '      CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: ParenthesizedExpressionNode' + #13#10 +
    '      OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '      ExpressionNode: Number |42|' + #13#10 +
    '      CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionOrRangeList));
end;

end.
