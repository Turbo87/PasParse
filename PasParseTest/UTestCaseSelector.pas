unit UTestCaseSelector;

interface

uses
  UTest;

type
  TTestCaseSelector = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestCaseSelector }

class function TTestCaseSelector.GetName: string;
begin
  Result := 'CaseSelector';
end;

class procedure TTestCaseSelector.TestAll;
begin
  OK('1:', TTestParser.ParsesAs('1:',
    'CaseSelectorNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTCaseSelector));

  OK('1..2:', TTestParser.ParsesAs('1..2:',
    'CaseSelectorNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |1|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |2|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTCaseSelector));

  OK('1, 2:', TTestParser.ParsesAs('1, 2:',
    'CaseSelectorNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |2|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)' + #13#10 +
    '  SemicolonNode: (none)', RTCaseSelector));

  OK('1: Foo', TTestParser.ParsesAs('1: Foo',
    'CaseSelectorNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: (none)', RTCaseSelector));

  OK('1: Foo;', TTestParser.ParsesAs('1: Foo;',
    'CaseSelectorNode' + #13#10 +
    '  ValueListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTCaseSelector));
end;

end.
