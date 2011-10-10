unit UTestTypeParam;

interface

uses
  UTest;

type
  TTestTypeParam = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestFactor }

class function TTestTypeParam.GetName: string;
begin
  Result := 'TypeParam';
end;

class procedure TTestTypeParam.TestAll;
begin
  OK('TSomething', TTestParser.ParsesAs('TSomething',
    'TypeParamNode' + #13#10 +
    '  ModifierNode: (none)' + #13#10 +
    '  NameNode: Identifier |TSomething|', RTTypeParam));

  OK('+TSomething', TTestParser.ParsesAs('+TSomething',
    'TypeParamNode' + #13#10 +
    '  ModifierNode: PlusSign |+|' + #13#10 +
    '  NameNode: Identifier |TSomething|', RTTypeParam));

  OK('-TSomething', TTestParser.ParsesAs('-TSomething',
    'TypeParamNode' + #13#10 +
    '  ModifierNode: MinusSign |-|' + #13#10 +
    '  NameNode: Identifier |TSomething|', RTTypeParam));

  try
    TTestParser.ParsesAs('*TSomething', '', RTTypeParam);
    OK(False, '* exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, '* exception');
  else
    OK(False, '* exception');
  end;
end;

end.
