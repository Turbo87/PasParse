unit UTestExpressionList;

interface

uses
  UTest;

type
  TTestExpressionList = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExpressionList }

class function TTestExpressionList.GetName: string;
begin
  Result := 'ExpressionList';
end;

class procedure TTestExpressionList.TestAll;
begin
  OK('24, 42', TTestParser.ParsesAs('24, 42',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Number |24|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Number |42|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));

  OK('''foo'', ''bar''', TTestParser.ParsesAs('''foo'', ''bar''',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: StringLiteral |''foo''|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: StringLiteral |''bar''|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));

  OK('Foo, Bar', TTestParser.ParsesAs('Foo, Bar',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Bar|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));

  OK('Absolute, Index', TTestParser.ParsesAs('Absolute, Index',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Absolute|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Index|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));

  OK('nil, nil', TTestParser.ParsesAs('nil, nil',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: NilKeyword |nil|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: NilKeyword |nil|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));

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
    '    DelimiterNode: (none)', RTExpressionList));

  OK('[], []', TTestParser.ParsesAs('[], []',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: SetLiteralNode' + #13#10 +
    '      OpenBracketNode: OpenBracket |[|' + #13#10 +
    '      ItemListNode: ListNode' + #13#10 +
    '      CloseBracketNode: CloseBracket |]|' + #13#10 +
    '    DelimiterNode: Comma |,|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: SetLiteralNode' + #13#10 +
    '      OpenBracketNode: OpenBracket |[|' + #13#10 +
    '      ItemListNode: ListNode' + #13#10 +
    '      CloseBracketNode: CloseBracket |]|' + #13#10 +
    '    DelimiterNode: (none)', RTExpressionList));
end;

end.
