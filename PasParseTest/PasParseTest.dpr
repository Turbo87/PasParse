program PasParseTest;

{$APPTYPE CONSOLE}

uses
  SysUtils,
{$IFNDEF FPC}
  FastMM4 in '..\FastMM\FastMM4.pas',
  FastMM4Messages in '..\FastMM\FastMM4Messages.pas',
{$ENDIF}
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
  UTestEnumeratedType in 'UTestEnumeratedType.pas',
  UTestMethodReturnType in 'UTestMethodReturnType.pas',
  UTestMethodHeading in 'UTestMethodHeading.pas',
  UTestExportsSpecifier in 'UTestExportsSpecifier.pas',
  UTestDirective in 'UTestDirective.pas',
  UTestPropertyDirective in 'UTestPropertyDirective.pas',
  UTestProperty in 'UTestProperty.pas',
  UTestMethodOrProperty in 'UTestMethodOrProperty.pas',
  UTestInterfaceType in 'UTestInterfaceType.pas',
  UTestAssemblyAttribute in 'UTestAssemblyAttribute.pas',
  UTestExportsItem in 'UTestExportsItem.pas',
  UTestExportsStatement in 'UTestExportsStatement.pas',
  UTestInitSection in 'UTestInitSection.pas',
  UTestLabelDeclSection in 'UTestLabelDeclSection.pas',
  UTestProcedureType in 'UTestProcedureType.pas',
  UTestRecordHelperType in 'UTestRecordHelperType.pas',
  UTestType in 'UTestType.pas',
  UTestPackedType in 'UTestPackedType.pas',
  UTestPointerType in 'UTestPointerType.pas',
  UTestTypedConstant in 'UTestTypedConstant.pas',
  UTestRecordFieldConstant in 'UTestRecordFieldConstant.pas',
  UTestVarDecl in 'UTestVarDecl.pas',
  UTestConstantDecl in 'UTestConstantDecl.pas',
  UTestVarSection in 'UTestVarSection.pas',
  UTestConstSection in 'UTestConstSection.pas',
  UTestFieldDecl in 'UTestFieldDecl.pas',
  UTestFieldSection in 'UTestFieldSection.pas',
  UTestTypeDecl in 'UTestTypeDecl.pas',
  UTestTypeSection in 'UTestTypeSection.pas',
  UTestVisibilitySectionContent in 'UTestVisibilitySectionContent.pas',
  UTestVisibilitySection in 'UTestVisibilitySection.pas',
  UTestVariantGroup in 'UTestVariantGroup.pas',
  UTestVariantSection in 'UTestVariantSection.pas',
  UTestRecordType in 'UTestRecordType.pas',
  UTestClassHelperType in 'UTestClassHelperType.pas',
  UTestStringType in 'UTestStringType.pas',
  UTestClassType in 'UTestClassType.pas',
  UTestInterfaceDecl in 'UTestInterfaceDecl.pas',
  UTestInterfaceSection in 'UTestInterfaceSection.pas',
  UTestImplementationDecl in 'UTestImplementationDecl.pas',
  UTestFancyBlock in 'UTestFancyBlock.pas',
  UTestMethodImplementation in 'UTestMethodImplementation.pas',
  UTestImplementationSection in 'UTestImplementationSection.pas',
  UTestUnit in 'UTestUnit.pas',
  UTestRequiresClause in 'UTestRequiresClause.pas',
  UTestProgram in 'UTestProgram.pas',
  UTestPackage in 'UTestPackage.pas',
  UTestTokenFilter in 'UTestTokenFilter.pas',
  UTestMemoryFileLoader in 'UTestMemoryFileLoader.pas',
  UTestFileLoader in 'UTestFileLoader.pas';

begin
  try
    TTestDictionary.Test;

    TTestASTNode.Test;
    TTestLexScanner.Test;
    TTestCompilerDefines.Test;
    TTestTokenFilter.Test;
    TTestAlternator.Test;
    TTestMemoryFileLoader.Test;
    TTestFileLoader.Test;

    TTestAddOp.Test;
    TTestArrayType.Test;
    TTestAssemblerStatement.Test;
    TTestAssemblyAttribute.Test;
    TTestAtom.Test;
    TTestBareInherited.Test;
    TTestBlock.Test;
    TTestCaseSelector.Test;
    TTestCaseStatement.Test;
    TTestClassType.Test;
    TTestClassHelperType.Test;
    TTestClassOf.Test;
    TTestConstantDecl.Test;
    TTestConstSection.Test;
    TTestDirective.Test;
    TTestEnumeratedType.Test;
    TTestEnumeratedTypeElement.Test;
    TTestExceptionItem.Test;
    TTestExportsItem.Test;
    TTestExportsSpecifier.Test;
    TTestExportsStatement.Test;
    TTestExpression.Test;
    TTestExpressionList.Test;
    TTestExpressionOrAssignment.Test;
    TTestExpressionOrRange.Test;
    TTestExpressionOrRangeList.Test;
    TTestExtendedIdent.Test;
    TTestFactor.Test;
    TTestFancyBlock.Test;
    TTestFieldDecl.Test;
    TTestFieldSection.Test;
    TTestFileType.Test;
    TTestForStatement.Test;
    TTestGotoStatement.Test;
    TTestIdent.Test;
    TTestIdentList.Test;
    TTestIfStatement.Test;
    TTestImplementationDecl.Test;
    TTestImplementationSection.Test;
    TTestInitSection.Test;
    TTestInterfaceDecl.Test;
    TTestInterfaceSection.Test;
    TTestInterfaceType.Test;
    TTestLabelDeclSection.Test;
    TTestLabelId.Test;
    TTestMethodHeading.Test;
    TTestMethodImplementation.Test;
    TTestMethodOrProperty.Test;
    TTestMethodReturnType.Test;
    TTestMulOp.Test;
    TTestOpenArray.Test;
    TTestPackage.Test;
    TTestPackedType.Test;
    TTestParameterExpression.Test;
    TTestParameter.Test;
    TTestParameterType.Test;
    TTestParenthesizedExpression.Test;
    TTestParticle.Test;
    TTestPointerType.Test;
    TTestPortabilityDirective.Test;
    TTestProcedureType.Test;
    TTestProgram.Test;
    TTestProperty.Test;
    TTestPropertyDirective.Test;
    TTestQualifiedIdent.Test;
    TTestRaiseStatement.Test;
    TTestRecordFieldConstant.Test;
    TTestRecordHelperType.Test;
    TTestRecordType.Test;
    TTestRelOp.Test;
    TTestRepeatStatement.Test;
    TTestRequiresClause.Test;
    TTestSetLiteral.Test;
    TTestSetType.Test;
    TTestSimpleExpression.Test;
    TTestSimpleStatement.Test;
    TTestStatement.Test;
    TTestStatementList.Test;
    TTestStringType.Test;
    TTestTerm.Test;
    TTestTryStatement.Test;
    TTestType.Test;
    TTestTypedConstant.Test;
    TTestTypeDecl.Test;
    TTestTypeSection.Test;
    TTestUnaryOperator.Test;
    TTestUnit.Test;
    TTestUsedUnit.Test;
    TTestUsesClause.Test;
    TTestVarDecl.Test;
    TTestVariantGroup.Test;
    TTestVariantSection.Test;
    TTestVarSection.Test;
    TTestVisibility.Test;
    TTestVisibilitySection.Test;
    TTestVisibilitySectionContent.Test;
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
