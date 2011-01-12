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
  UTestArrayType in 'UTestArrayType.pas',
  UTestAddOp in 'UTestAddOp.pas',
  UTestMulOp in 'UTestMulOp.pas',
  UTestPortabilityDirective in 'UTestPortabilityDirective.pas',
  UTestUnaryOperator in 'UTestUnaryOperator.pas',
  UTestExtendedIdent in 'UTestExtendedIdent.pas',
  UTestQualifiedIdent in 'UTestQualifiedIdent.pas',
  UTestIdent in 'UTestIdent.pas',
  UTestFileType in 'UTestFileType.pas',
  UTestIdentList in 'UTestIdentList.pas',
  UTestFactor in 'UTestFactor.pas',
  UTestUsedUnit in 'UTestUsedUnit.pas',
  UTestUsesClause in 'UTestUsesClause.pas',
  UTestClassOf in 'UTestClassOf.pas',
  UTestBareInherited in 'UTestBareInherited.pas',
  UTestAssemblerStatement in 'UTestAssemblerStatement.pas',
  UTestAlternator in 'UTestAlternator.pas',
  UTestLabelId in 'UTestLabelId.pas',
  UTestVisibility in 'UTestVisibility.pas',
  UTestGotoStatement in 'UTestGotoStatement.pas',
  UTestParticle in 'UTestParticle.pas',
  UTestAtom in 'UTestAtom.pas',
  UTestTerm in 'UTestTerm.pas',
  UTestSimpleExpression in 'UTestSimpleExpression.pas',
  UTestExpression in 'UTestExpression.pas',
  UTestParenthesizedExpression in 'UTestParenthesizedExpression.pas',
  UTestExpressionList in 'UTestExpressionList.pas',
  UTestExpressionOrAssignment in 'UTestExpressionOrAssignment.pas',
  UTestExpressionOrRange in 'UTestExpressionOrRange.pas',
  UTestExpressionOrRangeList in 'UTestExpressionOrRangeList.pas',
  UTestSetType in 'UTestSetType.pas',
  UTestSetLiteral in 'UTestSetLiteral.pas';

begin
  try
    TTestDictionary.Test;

    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;
    TTestAlternator.Test;

    TTestAddOp.Test;
    TTestArrayType.Test;
    TTestAssemblerStatement.Test;
    TTestAtom.Test;
    TTestBareInherited.Test;
    TTestClassOf.Test;
    TTestExpression.Test;
    TTestExpressionList.Test;
    TTestExpressionOrAssignment.Test;
    TTestExpressionOrRange.Test;
    TTestExpressionOrRangeList.Test;
    TTestExtendedIdent.Test;
    TTestFactor.Test;
    TTestFileType.Test;
    TTestGotoStatement.Test;
    TTestIdent.Test;
    TTestIdentList.Test;
    TTestLabelId.Test;
    TTestMulOp.Test;
    TTestParenthesizedExpression.Test;
    TTestParticle.Test;
    TTestPortabilityDirective.Test;
    TTestQualifiedIdent.Test;
    TTestRelOp.Test;
    TTestSetLiteral.Test;
    TTestSetType.Test;
    TTestSimpleExpression.Test;
    TTestTerm.Test;
    TTestUnaryOperator.Test;
    TTestUsedUnit.Test;
    TTestUsesClause.Test;
    TTestVisibility.Test;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
