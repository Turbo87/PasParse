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
  UTestSetLiteral in 'UTestSetLiteral.pas',
  UTestIfStatement in 'UTestIfStatement.pas',
  UTestStatement in 'UTestStatement.pas',
  UTestWhileStatement in 'UTestWhileStatement.pas',
  UTestWithStatement in 'UTestWithStatement.pas',
  UTestBlock in 'UTestBlock.pas',
  UTestStatementList in 'UTestStatementList.pas',
  UTestCaseSelector in 'UTestCaseSelector.pas',
  UTestCaseStatement in 'UTestCaseStatement.pas',
  UTestExceptionItem in 'UTestExceptionItem.pas',
  UTestRaiseStatement in 'UTestRaiseStatement.pas',
  UTestParameterExpression in 'UTestParameterExpression.pas',
  UTestRepeatStatement in 'UTestRepeatStatement.pas',
  UTestForStatement in 'UTestForStatement.pas',
  UTestTryStatement in 'UTestTryStatement.pas',
  UTestSimpleStatement in 'UTestSimpleStatement.pas',
  UTestOpenArray in 'UTestOpenArray.pas',
  UTestParameterType in 'UTestParameterType.pas',
  UTestParameter in 'UTestParameter.pas',
  UTestEnumeratedTypeElement in 'UTestEnumeratedTypeElement.pas',
  UTestEnumeratedType in 'UTestEnumeratedType.pas';

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
    TTestBlock.Test;
    TTestCaseSelector.Test;
    TTestCaseStatement.Test;
    TTestClassOf.Test;
    TTestEnumeratedType.Test;
    TTestEnumeratedTypeElement.Test;
    TTestExceptionItem.Test;
    TTestExpression.Test;
    TTestExpressionList.Test;
    TTestExpressionOrAssignment.Test;
    TTestExpressionOrRange.Test;
    TTestExpressionOrRangeList.Test;
    TTestExtendedIdent.Test;
    TTestFactor.Test;
    TTestFileType.Test;
    TTestForStatement.Test;
    TTestGotoStatement.Test;
    TTestIdent.Test;
    TTestIdentList.Test;
    TTestIfStatement.Test;
    TTestLabelId.Test;
    TTestMulOp.Test;
    TTestOpenArray.Test;
    TTestParameterExpression.Test;
    TTestParameter.Test;
    TTestParameterType.Test;
    TTestParenthesizedExpression.Test;
    TTestParticle.Test;
    TTestPortabilityDirective.Test;
    TTestQualifiedIdent.Test;
    TTestRaiseStatement.Test;
    TTestRelOp.Test;
    TTestRepeatStatement.Test;
    TTestSetLiteral.Test;
    TTestSetType.Test;
    TTestSimpleExpression.Test;
    TTestSimpleStatement.Test;
    TTestStatement.Test;
    TTestStatementList.Test;
    TTestTerm.Test;
    TTestTryStatement.Test;
    TTestUnaryOperator.Test;
    TTestUsedUnit.Test;
    TTestUsesClause.Test;
    TTestVisibility.Test;
    TTestWhileStatement.Test;
    TTestWithStatement.Test;
  except
    on E:Exception do
    begin
      Writeln(E.Classname, ': ', E.Message);
      Readln;
    end;
  end;
end.
