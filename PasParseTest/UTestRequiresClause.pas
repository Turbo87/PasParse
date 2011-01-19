unit UTestRequiresClause;

interface

uses
  UTest;

type
  TTestRequiresClause = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestRequiresClause }

class function TTestRequiresClause.GetName: string;
begin
  Result := 'RequiresClause';
end;

class procedure TTestRequiresClause.TestAll;
begin
  OK('requires Foo;', TTestParser.ParsesAs('requires Foo;',
    'RequiresClauseNode' + #13#10 +  
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo, Bar;', TTestParser.ParsesAs('requires Foo, Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));

  OK('requires Foo.Bar;', TTestParser.ParsesAs('requires Foo.Bar;',
    'RequiresClauseNode' + #13#10 +
    '  RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '  PackageListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Identifier |Foo|' + #13#10 +
    '        OperatorNode: Dot |.|' + #13#10 +
    '        RightNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTRequiresClause));
end;

end.
