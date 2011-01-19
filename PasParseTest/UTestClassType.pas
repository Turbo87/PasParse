unit UTestClassType;

interface

uses
  UTest;

type
  TTestClassType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParser, UCompilerDefines, UASTNode, UTokenType;

{ TTestClassType }

class function TTestClassType.GetName: string;
begin
  Result := 'ClassType';
end;

class procedure TTestClassType.TestAll;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  OK('class end', TTestParser.ParsesAs('class end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  OK('class procedure Foo; end',
    TTestParser.ParsesAs('class procedure Foo; end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
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
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  OK('class abstract end', TTestParser.ParsesAs('class abstract end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  OK('class sealed end', TTestParser.ParsesAs('class sealed end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: SealedSemikeyword |sealed|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  OK('class(TComponent) end', TTestParser.ParsesAs('class(TComponent) end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TComponent|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  OK('class(TInterfacedObject, IInterface) end', 
    TTestParser.ParsesAs('class(TInterfacedObject, IInterface) end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TInterfacedObject|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |IInterface|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTClassType));

  // Create temporary CompilerDefines and Parser
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText('class(Exception);', '',
    ACompilerDefines, nil);
  // Parse ClassType rule
  ANode := AParser.ParseRule(RTClassType);
  // Parse trailing semicolon and throw away directly afterwards
  AParser.ParseToken(TTSemicolon).Free;
  // Check if whole input consumed
  OK('class(Exception); -> EOF', AParser.IsEOF);
  // Check if ClassType rule worked correctly
  OK('class(Exception);', ANode.Inspect =
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Exception|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: (none)');
  // Memory cleanup
  ANode.Free;
  AParser.Free;
  ACompilerDefines.Free;
end;

end.
