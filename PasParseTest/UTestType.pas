unit UTestType;

interface

uses
  UTest;

type
  TTestType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestType }

class function TTestType.GetName: string;
begin
  Result := 'Type';
end;

class procedure TTestType.TestAll;
begin
  OK('(fooBar)', TTestParser.ParsesAs('(fooBar)',
    'EnumeratedTypeNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: EnumeratedTypeElementNode' + #13#10 +
    '        NameNode: Identifier |fooBar|' + #13#10 +
    '        EqualSignNode: (none)' + #13#10 +
    '        ValueNode: (none)' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTType));

  OK('System.Integer', TTestParser.ParsesAs('System.Integer',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |System|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Integer|', RTType));

  OK('24..42', TTestParser.ParsesAs('24..42',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |24|' + #13#10 +
    '  OperatorNode: DotDot |..|' + #13#10 +
    '  RightNode: Number |42|', RTType));

  OK('array of Integer', TTestParser.ParsesAs('array of Integer',
    'ArrayTypeNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OpenBracketNode: (none)' + #13#10 +
    '  IndexListNode: ListNode' + #13#10 +
    '  CloseBracketNode: (none)' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Integer|', RTType));

  OK('set of Byte', TTestParser.ParsesAs('set of Byte',
    'SetOfNode' + #13#10 +
    '  SetKeywordNode: SetKeyword |set|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Byte|', RTType));

  OK('file', TTestParser.ParsesAs('file',
    'FileTypeNode' + #13#10 +
    '  FileKeywordNode: FileKeyword |file|' + #13#10 +
    '  OfKeywordNode: (none)' + #13#10 +
    '  TypeNode: (none)', RTType));
  {
  OK('record helper for TPoint end',
    TTestParser.ParsesAs('record helper for TPoint end',
    'TypeHelperNode' + #13#10 +
    '  TypeKeywordNode: RecordKeyword |record|' + #13#10 +
    '  HelperSemikeywordNode: HelperSemikeyword |helper|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  BaseHelperTypeNode: (none)' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ForKeywordNode: ForKeyword |for|' + #13#10 +
    '  TypeNode: Identifier |TPoint|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTType));

  OK('record end', TTestParser.ParsesAs('record end',
    'RecordTypeNode' + #13#10 +
    '  RecordKeywordNode: RecordKeyword |record|' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  VariantSectionNode: (none)' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTType));

  OK('^TFoo', TTestParser.ParsesAs('^TFoo',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTType));
  }
  OK('string[42]', TTestParser.ParsesAs('string[42]',
    'StringOfLengthNode' + #13#10 +
    '  StringKeywordNode: StringKeyword |string|' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  LengthNode: Number |42|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTType));

  OK('procedure of object', TTestParser.ParsesAs('procedure of object',
    'ProcedureTypeNode' + #13#10 +
    '  MethodTypeNode: ProcedureKeyword |procedure|' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  ParameterListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ReturnTypeNode: (none)' + #13#10 +
    '  FirstDirectiveListNode: ListNode' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  ObjectKeywordNode: ObjectKeyword |object|' + #13#10 +
    '  SecondDirectiveListNode: ListNode', RTType));
  {
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
    '  EndKeywordNode: EndKeyword |end|', RTType));

  OK('class of TObject', TTestParser.ParsesAs('class of TObject',
    'ClassOfNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TObject|', RTType));

  OK('class end', TTestParser.ParsesAs('class end',
    'ClassTypeNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  DispositionNode: (none)' + #13#10 +
    '  OpenParenthesisNode: (none)' + #13#10 +
    '  InheritanceListNode: ListNode' + #13#10 +
    '  CloseParenthesisNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTType));
  }
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
    '  EndKeywordNode: EndKeyword |end|', RTType));
  {
  OK('packed array of Byte', TTestParser.ParsesAs('packed array of Byte',
    'PackedTypeNode' + #13#10 +
    '  PackedKeywordNode: PackedKeyword |packed|' + #13#10 +
    '  TypeNode: ArrayTypeNode' + #13#10 +
    '    ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '    OpenBracketNode: (none)' + #13#10 +
    '    IndexListNode: ListNode' + #13#10 +
    '    CloseBracketNode: (none)' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    TypeNode: Identifier |Byte|', RTType));
  }
end;

end.
