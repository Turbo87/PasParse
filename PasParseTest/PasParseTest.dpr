program PasParseTest;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas',
  UTest in 'UTest.pas',
  UTestDictionary in 'UTestDictionary.pas',
  UTestCompilerDefines in 'UTestCompilerDefines.pas',
  UTestASTNode in 'UTestASTNode.pas';

begin
  try
    TTestDictionary.Test;
    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
