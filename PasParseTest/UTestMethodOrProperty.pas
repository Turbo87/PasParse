unit UTestMethodOrProperty;

interface

uses
  UTest;

type
  TTestMethodOrProperty = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestMethodOrProperty }

class function TTestMethodOrProperty.GetName: string;
begin
  Result := 'MethodOrProperty';
end;

class procedure TTestMethodOrProperty.TestAll;
begin
  OK('procedure Foo;', TTestParser.ParsesAs('procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodOrProperty));

  OK('class procedure Foo;', TTestParser.ParsesAs('class procedure Foo;',
    'MethodHeadingNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodOrProperty));

  OK('property Foo: Integer read FFoo;',
    TTestParser.ParsesAs('property Foo: Integer read FFoo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: (none)' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodOrProperty));

  OK('class property Foo: Integer read FFoo;',
    TTestParser.ParsesAs('class property Foo: Integer read FFoo;',
    'PropertyNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  PropertyKeywordNode: PropertyKeyword |property|' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  DirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: DirectiveNode' + #13#10 +
    '      SemicolonNode: (none)' + #13#10 +
    '      KeywordNode: ReadSemikeyword |read|' + #13#10 +
    '      ValueNode: Identifier |FFoo|' + #13#10 +
    '      DataNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTMethodOrProperty));
end;

end.
