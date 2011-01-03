program PasParseTest;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas',
  UTest in 'UTest.pas';

begin
  try
    TTestLexScanner.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
