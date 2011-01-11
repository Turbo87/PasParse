program PasParseTest;

{$APPTYPE CONSOLE}

uses
  FastMM4 in '..\FastMM\FastMM4.pas',
  FastMM4Messages in '..\FastMM\FastMM4Messages.pas',
  SysUtils,
  UTestLexScanner in 'UTestLexScanner.pas',
  UTest in 'UTest.pas',
  UTestDictionary in 'UTestDictionary.pas',
  UTestCompilerDefines in 'UTestCompilerDefines.pas',
  UTestASTNode in 'UTestASTNode.pas',
  UTestRelOp in 'UTestRelOp.pas',
  UTestParser in 'UTestParser.pas';

begin
  try
    TTestDictionary.Test;
    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;
    TTestRelOp.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
