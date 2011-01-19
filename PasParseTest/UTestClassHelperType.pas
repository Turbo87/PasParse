unit UTestClassHelperType;

interface

uses
  UTest;

type
  TTestClassHelperType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestClassHelperType }

class function TTestClassHelperType.GetName: string;
begin
  Result := 'ClassHelperType';
end;

class procedure TTestClassHelperType.TestAll;
begin
  OK('class helper for TObject end', 
    TTestParser.ParsesAs('class helper for TObject end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: ClassKeyword |class|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TObject|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassHelperType));

  OK('class helper (TFooHelper) for TObject end', 
    TTestParser.ParsesAs('class helper (TFooHelper) for TObject end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: ClassKeyword |class|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  BaseHelperTypeNode: Identifier |TFooHelper|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TObject|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassHelperType));

  OK('class helper for TObject procedure Foo; end', 
    TTestParser.ParsesAs('class helper for TObject procedure Foo; end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: ClassKeyword |class|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TObject|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: VisibilitySectionNode' + #13#10 +
    '      VisibilityNode: (none)' + #13#10 +
    '      ContentListNode: ListNode' + #13#10 +
    '        Items[0]: MethodHeadingNode' + #13#10 +
    '          ClassKeywordNode: (none)' + #13#10 +
    '          MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '          NameNode: Identifier |Foo|' + #13#10 +
    '          OpenParenthesisNode: (none)' + #13#10 +
    '          ParameterListNode: ListNode' + #13#10 +
    '          CloseParenthesisNode: (none)' + #13#10 +
    '          ColonNode: (none)' + #13#10 +
    '          ReturnTypeNode: (none)' + #13#10 +
    '          DirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassHelperType));
end;

end.
