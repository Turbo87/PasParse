unit UTestTypeParams;

interface

uses
  UTest;

type
  TTestTypeParams = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestTypeParams }

class function TTestTypeParams.GetName: string;
begin
  Result := 'TTestTypeParams';
end;

class procedure TTestTypeParams.TestAll;
begin
  OK('<TSomething>', TTestParser.ParsesAs('<TSomething>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ConstraintListNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  OK('<TSomething, TAnother>', TTestParser.ParsesAs('<TSomething, TAnother>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: Comma |,|' + #13#10 +
    '      Items[1]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TAnother|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: (none)' + #13#10 +
    '    ConstraintListNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  OK('<TSomething: TAnother>', TTestParser.ParsesAs('<TSomething: TAnother>',
    'TypeParamsNode' + #13#10 +
    '  OpenBracketNode: LessThan |<|' + #13#10 +
    '  TypeParamDeclNode: TypeParamDeclNode' + #13#10 +
    '    TypeParamListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: TypeParamNode' + #13#10 +
    '          ModifierNode: (none)' + #13#10 +
    '          NameNode: Identifier |TSomething|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    ColonNode: Colon |:|' + #13#10 +
    '    ConstraintListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: Identifier |TAnother|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '  CloseBracketNode: GreaterThan |>|', RTTypeParams));

  try
    TTestParser.ParsesAs('TSomething', '', RTTypeParams);
    OK(False, 'no < exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'no < exception');
  else
    OK(False, 'no < exception');
  end;
end;

end.

