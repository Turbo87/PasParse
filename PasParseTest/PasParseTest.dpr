program PasParseTest;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas';

begin
  try
    if not TTestLexScanner.Test then
      raise Exception.Create('TestLexScanner failed!');
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
