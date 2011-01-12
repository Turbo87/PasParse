unit UTestStatementList;

interface

uses
  UTest;

type
  TTestStatementList = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestStatementList }

class function TTestStatementList.GetName: string;
begin
  Result := 'StatementList';
end;

class procedure TTestStatementList.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: (none)', RTStatementList));

  OK('Foo;', TTestParser.ParsesAs('Foo;',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Semicolon |;|', RTStatementList));

  OK(';', TTestParser.ParsesAs(';',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: (none)' + #13#10 +
    '    DelimiterNode: Semicolon |;|', RTStatementList));

  OK('Foo; Bar', TTestParser.ParsesAs('Foo; Bar',
    'ListNode' + #13#10 +
    '  Items[0]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Foo|' + #13#10 +
    '    DelimiterNode: Semicolon |;|' + #13#10 +
    '  Items[1]: DelimitedItemNode' + #13#10 +
    '    ItemNode: Identifier |Bar|' + #13#10 +
    '    DelimiterNode: (none)', RTStatementList));
end;

end.
