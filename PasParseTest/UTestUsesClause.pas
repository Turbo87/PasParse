unit UTestUsesClause;

interface

uses
  UTest;

type
  TTestUsesClause = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestUsesClause }

class function TTestUsesClause.GetName: string;
begin
  Result := 'UsesClause';
end;

class procedure TTestUsesClause.TestAll;
begin
  OK('uses Foo;', TTestParser.ParsesAs('uses Foo;',
    'UsesClauseNode' + #13#10 +
    '  UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '  UnitListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        InKeywordNode: (none)' + #13#10 +
    '        FileNameNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTUsesClause));

  OK('uses Foo in ''Foo.pas'';',
    TTestParser.ParsesAs('uses Foo in ''Foo.pas'';',
    'UsesClauseNode' + #13#10 +
    '  UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '  UnitListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        InKeywordNode: InKeyword |in|' + #13#10 +
    '        FileNameNode: StringLiteral |''Foo.pas''|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTUsesClause));

  OK('uses Foo, Bar;', TTestParser.ParsesAs('uses Foo, Bar;',
    'UsesClauseNode' + #13#10 +
    '  UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '  UnitListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        InKeywordNode: (none)' + #13#10 +
    '        FileNameNode: (none)' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: Identifier |Bar|' + #13#10 +
    '        InKeywordNode: (none)' + #13#10 +
    '        FileNameNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTUsesClause));

  OK('uses Foo.Bar;', TTestParser.ParsesAs('uses Foo.Bar;',
    'UsesClauseNode' + #13#10 +
    '  UsesKeywordNode: UsesKeyword |uses|' + #13#10 +
    '  UnitListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: BinaryOperationNode' + #13#10 +
    '          LeftNode: Identifier |Foo|' + #13#10 +
    '          OperatorNode: Dot |.|' + #13#10 +
    '          RightNode: Identifier |Bar|' + #13#10 +
    '        InKeywordNode: (none)' + #13#10 +
    '        FileNameNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTUsesClause));

  OK('contains Foo;', TTestParser.ParsesAs('contains Foo;',
    'UsesClauseNode' + #13#10 +
    '  UsesKeywordNode: ContainsSemikeyword |contains|' + #13#10 +
    '  UnitListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: UsedUnitNode' + #13#10 +
    '        NameNode: Identifier |Foo|' + #13#10 +
    '        InKeywordNode: (none)' + #13#10 +
    '        FileNameNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTUsesClause));
end;

end.
