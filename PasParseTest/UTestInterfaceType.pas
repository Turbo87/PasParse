unit UTestInterfaceType;

interface

uses
  UTest;

type
  TTestInterfaceType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestInterfaceType }

class function TTestInterfaceType.GetName: string;
begin
  Result := 'InterfaceType';
end;

class procedure TTestInterfaceType.TestAll;
begin
  OK('interface end', TTestParser.ParsesAs('interface end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseInterfaceNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  GuidNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));

  OK('interface(IFoo) end', TTestParser.ParsesAs('interface(IFoo) end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  BaseInterfaceNode: Identifier |IFoo|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  GuidNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));

  OK('interface [''{5781334E-E121-4C2B-B7A4-0396A632F94F}''] end',
    TTestParser.ParsesAs(
    'interface [''{5781334E-E121-4C2B-B7A4-0396A632F94F}''] end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseInterfaceNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  GuidNode: StringLiteral |''{5781334E-E121-4C2B-B7A4-0396A632F94F}''|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));

  OK('interface [MyGuidConst] end',
    TTestParser.ParsesAs('interface [MyGuidConst] end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseInterfaceNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  GuidNode: Identifier |MyGuidConst|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));

  OK('interface procedure Foo; end',
    TTestParser.ParsesAs('interface procedure Foo; end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: InterfaceKeyword |interface|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseInterfaceNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  GuidNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '    Items[0]: MethodHeadingNode' + #13#10 +
    '      ClassKeywordNode: (none)' + #13#10 +
    '      MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '      NameNode: Identifier |Foo|' + #13#10 +
    '      OpenParenthesisNode: (none)' + #13#10 +
    '      ParameterListNode: ListNode' + #13#10 +
    '      CloseParenthesisNode: (none)' + #13#10 +
    '      ColonNode: (none)' + #13#10 +
    '      ReturnTypeNode: (none)' + #13#10 +
    '      DirectiveListNode: ListNode' + #13#10 +
    '      SemicolonNode: Semicolon |;|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));

  OK('dispinterface end', TTestParser.ParsesAs('dispinterface end',
    'InterfaceTypeNode' + #13#10 +
    '  InterfaceKeywordNode: DispInterfaceKeyword |dispinterface|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseInterfaceNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  GuidNode: (none)' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  MethodAndPropertyListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTInterfaceType));
end;

end.
