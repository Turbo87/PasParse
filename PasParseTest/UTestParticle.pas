unit UTestParticle;

interface

uses
  UTest;

type
  TTestParticle = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestParticle }

class function TTestParticle.GetName: string;
begin
  Result := 'Particle';
end;

class procedure TTestParticle.TestAll;
begin
  OK('nil', TTestParser.ParsesAs('nil', 'NilKeyword |nil|', RTParticle));
  OK('''Foo''', TTestParser.ParsesAs('''Foo''',
    'StringLiteral |''Foo''|', RTParticle));
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTParticle));
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTParticle));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTParticle));

  OK('(Foo)', TTestParser.ParsesAs('(Foo)',
    'ParenthesizedExpressionNode' + #13#10 +
    '  OpenParenthesisNode: OpenParenthesis |(|' + #13#10 +
    '  ExpressionNode: Identifier |Foo|' + #13#10 +
    '  CloseParenthesisNode: CloseParenthesis |)|', RTParticle));

  OK('[1, 3..4]', TTestParser.ParsesAs('[1, 3..4]',
    'SetLiteralNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ItemListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Number |1|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: BinaryOperationNode' + #13#10 +
    '        LeftNode: Number |3|' + #13#10 +
    '        OperatorNode: DotDot |..|' + #13#10 +
    '        RightNode: Number |4|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTParticle));

  OK('string', TTestParser.ParsesAs('string', 'StringKeyword |string|', RTParticle));
  OK('file', TTestParser.ParsesAs('file', 'FileKeyword |file|', RTParticle));
end;

end.
