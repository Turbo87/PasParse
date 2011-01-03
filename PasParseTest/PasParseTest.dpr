program PasParseTest;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas',
  UTest in 'UTest.pas',
  UTestDictionary in 'UTestDictionary.pas';

begin
  try
    TTestDictionary.Test;
    TTestLexScanner.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
