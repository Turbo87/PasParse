unit UTestSetLiteral;

interface

uses
  UTest;

type
  TTestSetLiteral = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestSetLiteral }

class function TTestSetLiteral.GetName: string;
begin
  Result := 'SetLiteral';
end;

class procedure TTestSetLiteral.TestAll;
begin
  OK('[]', TTestParser.ParsesAs('[]',
    'SetLiteralNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTSetLiteral));

  OK('[42]', TTestParser.ParsesAs('[42]',
    'SetLiteralNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTSetLiteral));

  OK('[1..2, 4..5]', TTestParser.ParsesAs('[1..2, 4..5]',
    'SetLiteralNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |1|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |2|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |4|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |5|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTSetLiteral));
end;

end.
