unit UTestAtom;

interface

uses
  UTest;

type
  TTestAtom = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestAtom }

class function TTestAtom.GetName: string;
begin
  Result := 'Atom';
end;

class procedure TTestAtom.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTAtom));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTAtom));

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Bar|', RTAtom));

  OK('Foo.Bar.Baz', TTestParser.ParsesAs('Foo.Bar.Baz',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Baz|', RTAtom));

  OK('Should.Not', TTestParser.ParsesAs('Should.Not',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Should|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Not|', RTAtom));

  OK('Foo^', TTestParser.ParsesAs('Foo^',
    'PointerDereferenceNode' + #13#10 +
    '  OperandNode: Identifier |Foo|' + #13#10 +
    '  CaretNode: Caret |^|', RTAtom));

  OK('Foo^^', TTestParser.ParsesAs('Foo^^',
    'PointerDereferenceNode' + #13#10 +
    '  OperandNode: PointerDereferenceNode' + #13#10 +
    '    OperandNode: Identifier |Foo|' + #13#10 +
    '    CaretNode: Caret |^|' + #13#10 +
    '  CaretNode: Caret |^|', RTAtom));

  try
    TTestParser.ParsesAs('Foo[]', '', RTAtom);
    OK(False, 'Foo[] exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'Foo[] exception');
  else
    OK(False, 'Foo[] exception');
  end;

  OK('Foo[42]', TTestParser.ParsesAs('Foo[42]',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OpenDelimiterNode: OpenBracket |[|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseBracket |]|', RTAtom));

  OK('Foo[24, 42]', TTestParser.ParsesAs('Foo[24, 42]',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OpenDelimiterNode: OpenBracket |[|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |24|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseBracket |]|', RTAtom));

  OK('Foo()', TTestParser.ParsesAs('Foo()',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));

  OK('Foo(42)', TTestParser.ParsesAs('Foo(42)',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));

  OK('Foo(24, 42)', TTestParser.ParsesAs('Foo(24, 42)',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |24|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |42|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));

  OK('string(''0'')', TTestParser.ParsesAs('string(''0'')',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: StringKeyword |string|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: StringLiteral |''0''|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));

  OK('file(AUntypedVarParameter)', 
    TTestParser.ParsesAs('file(AUntypedVarParameter)',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: FileKeyword |file|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |AUntypedVarParameter|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));

  OK('Str(X:0, S)', TTestParser.ParsesAs('Str(X:0, S)',
    'ParameterizedNode' + #13#10 +
    '  LeftNode: Identifier |Str|' + #13#10 +
    '  OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: NumberFormatNode' + #13#10 +
    '        ValueNode: Identifier |X|' + #13#10 +
    '        SizeColonNode: Colon |:|' + #13#10 +
    '        SizeNode: Number |0|' + #13#10 +
    '        PrecisionColonNode: (none)' + #13#10 +
    '        PrecisionNode: (none)' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |S|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseDelimiterNode: CloseParenthesis |)|', RTAtom));
end;

end.
