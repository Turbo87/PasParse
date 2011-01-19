unit UTestPackage;

interface

uses
  UTest;

type
  TTestPackage = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestPackage }

class function TTestPackage.GetName: string;
begin
  Result := 'Package';
end;

class procedure TTestPackage.TestAll;
begin
  OK('package Foo; end.', TTestParser.ParsesAs('package Foo; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTPackage));

  OK('package Foo.Bar; end.', TTestParser.ParsesAs('package Foo.Bar; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTPackage));

  OK('package Foo; requires Bar; contains Baz; end.', 
    TTestParser.ParsesAs('package Foo; requires Bar; contains Baz; end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: RequiresClauseNode' + #13#10 +
    '    RequiresSemikeywordNode: RequiresSemikeyword |requires|' + #13#10 +
    '    PackageListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Identifier |Bar|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  ContainsClauseNode: UsesClauseNode' + #13#10 +
    '    UsesKeywordNode: ContainsSemikeyword |contains|' + #13#10 +
    '    UnitListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: UsedUnitNode' + #13#10 +
    '          NameNode: Identifier |Baz|' + #13#10 +
    '          InKeywordNode: (none)' + #13#10 +
    '          FileNameNode: (none)' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    SemicolonNode: Semicolon |;|' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTPackage));

  OK('package Foo; [assembly: AssemblyVersion(''0.0.0.0'')] end.', 
    TTestParser.ParsesAs('package Foo; [assembly: AssemblyVersion(''0.0.0.0'')] end.',
    'PackageNode' + #13#10 +
    '  PackageKeywordNode: PackageSemikeyword |package|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  RequiresClauseNode: (none)' + #13#10 +
    '  ContainsClauseNode: (none)' + #13#10 +
    '  AttributeListNode: ListNode' + #13#10 +
    '    Items[0]: AttributeNode' + #13#10 +
    '      OpenBracketNode: OpenBracket |[|' + #13#10 +
    '      ScopeNode: AssemblySemikeyword |assembly|' + #13#10 +
    '      ColonNode: Colon |:|' + #13#10 +
    '      ValueNode: ParameterizedNode' + #13#10 +
    '        LeftNode: Identifier |AssemblyVersion|' + #13#10 +
    '        OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '        ParameterListNode: ListNode' + #13#10 +
    '          Items[0]: DelimitedItemNode' + #13#10 +
    '            ItemNode: StringLiteral |''0.0.0.0''|' + #13#10 +
    '            DelimiterNode: (none)' + #13#10 +
    '        CloseDelimiterNode: CloseParenthesis |)|' + #13#10 +
    '      CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|' + #13#10 +
    '  DotNode: Dot |.|', RTPackage));
end;

end.
