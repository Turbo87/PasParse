unit UTestTryStatement;

interface

uses
  UTest;

type
  TTestTryStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestTryStatement }

class function TTestTryStatement.GetName: string;
begin
  Result := 'TryStatement';
end;

class procedure TTestTryStatement.TestAll;
begin
  OK('try finally end', TTestParser.ParsesAs('try finally end',
    'TryFinallyNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  FinallyKeywordNode: FinallyKeyword |finally|' + #13#10 +
    '  FinallyStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try Foo; Bar; finally Baz; Quux; end',
    TTestParser.ParsesAs('try Foo; Bar; finally Baz; Quux; end',
    'TryFinallyNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  FinallyKeywordNode: FinallyKeyword |finally|' + #13#10 +
    '  FinallyStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Baz|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Quux|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try except end', TTestParser.ParsesAs('try except end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try Foo; Bar; except Baz; Quux; end',
    TTestParser.ParsesAs('try Foo; Bar; except Baz; Quux; end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Baz|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Quux|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try except on Exception do; on EInvalidOp do; end',
    TTestParser.ParsesAs('try except on Exception do; on EInvalidOp do; end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '    Items[0]: ExceptionItemNode' + #13#10 +
    '      OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '      NameNode: (none)' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: Identifier |Exception|' + #13#10 +
    '      DoKeywordNode: DoKeyword |do|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '    Items[1]: ExceptionItemNode' + #13#10 +
    '      OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '      NameNode: (none)' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: Identifier |EInvalidOp|' + #13#10 +
    '      DoKeywordNode: DoKeyword |do|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  ElseKeywordNode: (none)' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try except on EInvalidOp do; else Foo; Bar; end',
    TTestParser.ParsesAs('try except on EInvalidOp do; else Foo; Bar; end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '    Items[0]: ExceptionItemNode' + #13#10 +
    '      OnSemikeywordNode: OnSemikeyword |on|' + #13#10 +
    '      NameNode: (none)' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      TypeNode: Identifier |EInvalidOp|' + #13#10 +
    '      DoKeywordNode: DoKeyword |do|' + #13#10 +
    '      StatementNode: (none)' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));

  OK('try except else Foo; Bar; end',
    TTestParser.ParsesAs('try except else Foo; Bar; end',
    'TryExceptNode' + #13#10 +
    '  TryKeywordNode: TryKeyword |try|' + #13#10 +
    '  TryStatementListNode: ListNode' + #13#10 +
    '  ExceptKeywordNode: ExceptKeyword |except|' + #13#10 +
    '  ExceptionItemListNode: ListNode' + #13#10 +
    '  ElseKeywordNode: ElseKeyword |else|' + #13#10 +
    '  ElseStatementListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTTryStatement));
end;

end.
