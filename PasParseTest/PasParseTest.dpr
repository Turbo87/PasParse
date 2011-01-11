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
  UTestParser in 'UTestParser.pas',
  UTestAddOp in 'UTestAddOp.pas',
  UTestMulOp in 'UTestMulOp.pas',
  UTestPortabilityDirective in 'UTestPortabilityDirective.pas',
  UTestUnaryOperator in 'UTestUnaryOperator.pas',
  UTestExtendedIdent in 'UTestExtendedIdent.pas',
  UTestQualifiedIdent in 'UTestQualifiedIdent.pas',
  UTestIdent in 'UTestIdent.pas',
  UTestFileType in 'UTestFileType.pas',
  UTestIdentList in 'UTestIdentList.pas';

begin
  try
    TTestDictionary.Test;
    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;

    TTestAddOp.Test;
    TTestExtendedIdent.Test;
    TTestFileType.Test;
    TTestIdent.Test;
    TTestIdentList.Test;
    TTestMulOp.Test;
    TTestPortabilityDirective.Test;
    TTestQualifiedIdent.Test;
    TTestRelOp.Test;
    TTestUnaryOperator.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
