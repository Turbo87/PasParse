unit UTestTypeParamDecl;

interface

uses
  UTest;

type
  TTestTypeParamDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestTypeParamDecl }

class function TTestTypeParamDecl.GetName: string;
begin
  Result := 'TypeParamDecl';
end;

class procedure TTestTypeParamDecl.TestAll;
begin
  OK('TSomething', TTestParser.ParsesAs('TSomething',
    'TypeParamDeclNode' + #13#10 +
    '  TypeParamListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: TypeParamNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameNode: Identifier |TSomething|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ConstraintListNode: (none)', RTTypeParamDecl));

  OK('+TSomething', TTestParser.ParsesAs('+TSomething',
    'TypeParamDeclNode' + #13#10 +
    '  TypeParamListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: TypeParamNode' + #13#10 +
    '        ModifierNode: PlusSign |+|' + #13#10 +
    '        NameNode: Identifier |TSomething|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ConstraintListNode: (none)', RTTypeParamDecl));

  OK('TSomething, TAnother', TTestParser.ParsesAs('TSomething, TAnother',
    'TypeParamDeclNode' + #13#10 +
    '  TypeParamListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: TypeParamNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameNode: Identifier |TSomething|' + #13#10 +
    '      DelimiterNode: Comma |,|' + #13#10 +
    '    Items[1]: DelimitedItemNode' + #13#10 +
    '      ItemNode: TypeParamNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameNode: Identifier |TAnother|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: (none)' + #13#10 +
    '  ConstraintListNode: (none)', RTTypeParamDecl));

  OK('TSomething: TAnother', TTestParser.ParsesAs('TSomething: TAnother',
    'TypeParamDeclNode' + #13#10 +
    '  TypeParamListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: TypeParamNode' + #13#10 +
    '        ModifierNode: (none)' + #13#10 +
    '        NameNode: Identifier |TSomething|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ConstraintListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |TAnother|' + #13#10 +
    '      DelimiterNode: (none)', RTTypeParamDecl));

  try
    TTestParser.ParsesAs('*TSomething', '', RTTypeParamDecl);
    OK(False, '* exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '* exception');
  else
    OK(False, '* exception');
  end;

  try
    TTestParser.ParsesAs(':TSomething', '', RTTypeParamDecl);
    OK(False, ': exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, ': exception');
  else
    OK(False, ': exception');
  end;
end;

end.

