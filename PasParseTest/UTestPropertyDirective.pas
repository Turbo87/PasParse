unit UTestPropertyDirective;

interface

uses
  UTest;

type
  TTestPropertyDirective = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestPropertyDirective }

class function TTestPropertyDirective.GetName: string;
begin
  Result := 'PropertyDirective';
end;

class procedure TTestPropertyDirective.TestAll;
begin
  OK('; default', TTestParser.ParsesAs('; default',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: DefaultSemikeyword |default|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('default 42', TTestParser.ParsesAs('default 42',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DefaultSemikeyword |default|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('dispid 42', TTestParser.ParsesAs('dispid 42',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DispIdSemikeyword |dispid|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('implements IFoo.Bar, IBaz',
    TTestParser.ParsesAs('implements IFoo.Bar, IBaz',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ImplementsSemikeyword |implements|' + #13#10 +
    '  ValueNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Identifier |IFoo|' + #13#10 +
    '        OperatorNode: Dot |.|' + #13#10 +
    '        RightNode: Identifier |Bar|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |IBaz|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('index 42', TTestParser.ParsesAs('index 42',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('nodefault', TTestParser.ParsesAs('nodefault',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: NoDefaultSemikeyword |nodefault|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('read FFoo', TTestParser.ParsesAs('read FFoo',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '  ValueNode: Identifier |FFoo|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('readonly', TTestParser.ParsesAs('readonly',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ReadOnlySemikeyword |readonly|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('stored GetStored', TTestParser.ParsesAs('stored GetStored',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: StoredSemikeyword |stored|' + #13#10 +
    '  ValueNode: Identifier |GetStored|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('write FFoo', TTestParser.ParsesAs('write FFoo',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: WriteSemikeyword |write|' + #13#10 +
    '  ValueNode: Identifier |FFoo|' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));

  OK('writeonly', TTestParser.ParsesAs('writeonly',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: WriteOnlySemikeyword |writeonly|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTPropertyDirective));
end;

end.
