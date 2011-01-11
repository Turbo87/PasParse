unit UTestAssemblerStatement;

interface

uses
  UTest;

type
  TTestAssemblerStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestAssemblerStatement }

class function TTestAssemblerStatement.GetName: string;
begin
  Result := 'AssemblerStatement';
end;

class procedure TTestAssemblerStatement.TestAll;
begin
  OK('asm end', TTestParser.ParsesAs('asm end',
    'AssemblerStatementNode' + #13#10 +
    '  AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTAssemblerStatement));

  OK('asm INT 3 end', TTestParser.ParsesAs('asm INT 3 end',
    'AssemblerStatementNode' + #13#10 +
    '  AsmKeywordNode: AsmKeyword |asm|' + #13#10 +
    '  EndKeywordNode: EndKeyword |end|', RTAssemblerStatement));

  try
    TTestParser.ParsesAs('asm', 'AssemblerStatementNode', RTAssemblerStatement);
    OK(False, 'asm exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'asm exception');
  else
    OK(False, 'asm exception');
  end;
end;

end.
