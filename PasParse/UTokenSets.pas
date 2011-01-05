unit UTokenSets;

interface

uses
  UTokenSet, UTokenType;

type
  TTokenSets = class
  protected
    class procedure Prepare;
    class procedure CleanUp; 
    
  public
    class var TSAddOp: TTokenSet;
    class var TSBlock: TTokenSet;
    class var TSClassDisposition: TTokenSet;
    class var TSConstHeader: TTokenSet;
    class var TSDirective: TTokenSet;
    class var TSExportsSpecifier: TTokenSet;
    class var TSExpression: TTokenSet;
    class var TSExtendedIdent: TTokenSet;
    class var TSForDirection: TTokenSet;
    class var TSForwardableType: TTokenSet;
    class var TSIdent: TTokenSet;
    class var TSInitSection: TTokenSet;
    class var TSInterfaceType: TTokenSet;
    class var TSKeyword: TTokenSet;
    class var TSLabelId: TTokenSet;
    class var TSMethodType: TTokenSet;
    class var TSMulOp: TTokenSet;
    class var TSParameter: TTokenSet;
    class var TSParameterizedPropertyDirective: TTokenSet;
    class var TSParameterlessPropertyDirective: TTokenSet;
    class var TSParameterModifier: TTokenSet;
    class var TSParticle: TTokenSet;
    class var TSPortabilityDirective: TTokenSet;
    class var TSProgram: TTokenSet;
    class var TSRelOp: TTokenSet;
    class var TSSemikeyword: TTokenSet;
    class var TSSimpleParameterType: TTokenSet;
    class var TSUnaryOperator: TTokenSet;
    class var TSUses: TTokenSet;
    class var TSVarHeader: TTokenSet;
    class var TSVisibility: TTokenSet;
    class var TSVisibilitySingleWord: TTokenSet;
  end;

implementation

{ TTokenSets }

class procedure TTokenSets.CleanUp;
begin
  TSAddOp.Free;
  TSBlock.Free;
  TSClassDisposition.Free;
  TSConstHeader.Free;
  TSDirective.Free;
  TSExportsSpecifier.Free;
  TSForDirection.Free;
  TSForwardableType.Free;
  TSInitSection.Free;
  TSInterfaceType.Free;
  TSKeyword.Free;
  TSMethodType.Free;
  TSMulOp.Free;
  TSParameterizedPropertyDirective.Free;
  TSParameterlessPropertyDirective.Free;
  TSParameterModifier.Free;
  TSPortabilityDirective.Free;
  TSProgram.Free;
  TSRelOp.Free;
  TSSemikeyword.Free;
  TSUnaryOperator.Free;
  TSUses.Free;
  TSVarHeader.Free;
  TSVisibilitySingleWord.Free;
  TSIdent.Free;
  TSParticle.Free;
  TSExpression.Free;
  TSExtendedIdent.Free;
  TSLabelId.Free;
  TSParameter.Free;
  TSSimpleParameterType.Free;
  TSVisibility.Free;
end;

class procedure TTokenSets.Prepare;
begin
  TSAddOp := TTokenSet.Create('addition operator');
  TSAddOp.Add(TTPlusSign);
  TSAddOp.Add(TTMinusSign);
  TSAddOp.Add(TTOrKeyword);
  TSAddOp.Add(TTXorKeyword);

  TSBlock := TTokenSet.Create('block');
  TSBlock.Add(TTBeginKeyword);
  TSBlock.Add(TTAsmKeyword);

  TSClassDisposition := TTokenSet.Create('class disposition');
  TSClassDisposition.Add(TTAbstractSemikeyword);
  TSClassDisposition.Add(TTSealedSemikeyword);

  TSConstHeader := TTokenSet.Create('const section');
  TSConstHeader.Add(TTConstKeyword);
  TSConstHeader.Add(TTResourceStringKeyword);

  TSDirective := TTokenSet.Create('directive');
  TSDirective.Add(TTAbstractSemikeyword);
  TSDirective.Add(TTAssemblerSemikeyword);
  TSDirective.Add(TTCdeclSemikeyword);
  TSDirective.Add(TTDispIdSemikeyword);
  TSDirective.Add(TTDynamicSemikeyword);
  TSDirective.Add(TTExportSemikeyword);
  TSDirective.Add(TTExternalSemikeyword);
  TSDirective.Add(TTFarSemikeyword);
  TSDirective.Add(TTFinalSemikeyword);
  TSDirective.Add(TTForwardSemikeyword);
  TSDirective.Add(TTInlineKeyword);
  TSDirective.Add(TTLocalSemikeyword);
  TSDirective.Add(TTMessageSemikeyword);
  TSDirective.Add(TTNearSemikeyword);
  TSDirective.Add(TTOverloadSemikeyword);
  TSDirective.Add(TTOverrideSemikeyword);
  TSDirective.Add(TTPascalSemikeyword);
  TSDirective.Add(TTRegisterSemikeyword);
  TSDirective.Add(TTReintroduceSemikeyword);
  TSDirective.Add(TTSafecallSemikeyword);
  TSDirective.Add(TTStaticSemikeyword);
  TSDirective.Add(TTStdcallSemikeyword);
  TSDirective.Add(TTVarArgsSemikeyword);
  TSDirective.Add(TTVirtualSemikeyword);
  // also includes PortabilityDirective, see below

  TSExportsSpecifier := TTokenSet.Create('''index'' or ''name''');
  TSExportsSpecifier.Add(TTIndexSemikeyword);
  TSExportsSpecifier.Add(TTNameSemikeyword);

  TSForDirection := TTokenSet.Create('''to'' or ''downto''');
  TSForDirection.Add(TTToKeyword);
  TSForDirection.Add(TTDownToKeyword);

  TSForwardableType := TTokenSet.Create('forwardable type');
  TSForwardableType.Add(TTClassKeyword);
  TSForwardableType.Add(TTDispInterfaceKeyword);
  TSForwardableType.Add(TTInterfaceKeyword);

  TSInitSection := TTokenSet.Create('initialization section');
  TSInitSection.Add(TTAsmKeyword);
  TSInitSection.Add(TTBeginKeyword);
  TSInitSection.Add(TTInitializationKeyword);
  TSInitSection.Add(TTEndKeyword);

  TSInterfaceType := TTokenSet.Create('interface type');
  TSInterfaceType.Add(TTInterfaceKeyword);
  TSInterfaceType.Add(TTDispInterfaceKeyword);

  TSKeyword := TTokenSet.Create('keyword');
  TSKeyword.Add(TTAndKeyword);
  TSKeyword.Add(TTArrayKeyword);
  TSKeyword.Add(TTAsKeyword);
  TSKeyword.Add(TTAsmKeyword);
  TSKeyword.Add(TTBeginKeyword);
  TSKeyword.Add(TTCaseKeyword);
  TSKeyword.Add(TTClassKeyword);
  TSKeyword.Add(TTConstKeyword);
  TSKeyword.Add(TTConstructorKeyword);
  TSKeyword.Add(TTDestructorKeyword);
  TSKeyword.Add(TTDispInterfaceKeyword);
  TSKeyword.Add(TTDivKeyword);
  TSKeyword.Add(TTDoKeyword);
  TSKeyword.Add(TTDownToKeyword);
  TSKeyword.Add(TTElseKeyword);
  TSKeyword.Add(TTEndKeyword);
  TSKeyword.Add(TTExceptKeyword);
  TSKeyword.Add(TTExportsKeyword);
  TSKeyword.Add(TTFileKeyword);
  TSKeyword.Add(TTFinalizationKeyword);
  TSKeyword.Add(TTFinallyKeyword);
  TSKeyword.Add(TTForKeyword);
  TSKeyword.Add(TTFunctionKeyword);
  TSKeyword.Add(TTGotoKeyword);
  TSKeyword.Add(TTIfKeyword);
  TSKeyword.Add(TTImplementationKeyword);
  TSKeyword.Add(TTInKeyword);
  TSKeyword.Add(TTInheritedKeyword);
  TSKeyword.Add(TTInitializationKeyword);
  TSKeyword.Add(TTInlineKeyword);
  TSKeyword.Add(TTInterfaceKeyword);
  TSKeyword.Add(TTIsKeyword);
  TSKeyword.Add(TTLabelKeyword);
  TSKeyword.Add(TTLibraryKeyword);
  TSKeyword.Add(TTModKeyword);
  TSKeyword.Add(TTNilKeyword);
  TSKeyword.Add(TTNotKeyword);
  TSKeyword.Add(TTObjectKeyword);
  TSKeyword.Add(TTOfKeyword);
  TSKeyword.Add(TTOrKeyword);
  TSKeyword.Add(TTPackedKeyword);
  TSKeyword.Add(TTProcedureKeyword);
  TSKeyword.Add(TTProgramKeyword);
  TSKeyword.Add(TTPropertyKeyword);
  TSKeyword.Add(TTRaiseKeyword);
  TSKeyword.Add(TTRecordKeyword);
  TSKeyword.Add(TTRepeatKeyword);
  TSKeyword.Add(TTResourceStringKeyword);
  TSKeyword.Add(TTSetKeyword);
  TSKeyword.Add(TTShlKeyword);
  TSKeyword.Add(TTShrKeyword);
  TSKeyword.Add(TTStringKeyword);
  TSKeyword.Add(TTThenKeyword);
  TSKeyword.Add(TTThreadVarKeyword);
  TSKeyword.Add(TTToKeyword);
  TSKeyword.Add(TTTryKeyword);
  TSKeyword.Add(TTTypeKeyword);
  TSKeyword.Add(TTUnitKeyword);
  TSKeyword.Add(TTUntilKeyword);
  TSKeyword.Add(TTUsesKeyword);
  TSKeyword.Add(TTVarKeyword);
  TSKeyword.Add(TTWhileKeyword);
  TSKeyword.Add(TTWithKeyword);
  TSKeyword.Add(TTXorKeyword);

  TSMethodType := TTokenSet.Create('method heading');
  TSMethodType.Add(TTConstructorKeyword);
  TSMethodType.Add(TTDestructorKeyword);
  TSMethodType.Add(TTFunctionKeyword);
  TSMethodType.Add(TTProcedureKeyword);
  TSMethodType.Add(TTOperatorSemikeyword);

  TSMulOp := TTokenSet.Create('multiplication operator');
  TSMulOp.Add(TTTimesSign);
  TSMulOp.Add(TTDivideBySign);
  TSMulOp.Add(TTDivKeyword);
  TSMulOp.Add(TTAndKeyword);
  TSMulOp.Add(TTModKeyword);
  TSMulOp.Add(TTShlKeyword);
  TSMulOp.Add(TTShrKeyword);

  TSParameterizedPropertyDirective := TTokenSet.Create('property directive');
  TSParameterizedPropertyDirective.Add(TTDefaultSemikeyword);
  TSParameterizedPropertyDirective.Add(TTDispIdSemikeyword);
  TSParameterizedPropertyDirective.Add(TTImplementsSemikeyword);
  TSParameterizedPropertyDirective.Add(TTIndexSemikeyword);
  TSParameterizedPropertyDirective.Add(TTReadSemikeyword);
  TSParameterizedPropertyDirective.Add(TTStoredSemikeyword);
  TSParameterizedPropertyDirective.Add(TTWriteSemikeyword);

  TSParameterlessPropertyDirective := TTokenSet.Create('property directive');
  TSParameterlessPropertyDirective.Add(TTNoDefaultSemikeyword);
  TSParameterlessPropertyDirective.Add(TTReadOnlySemikeyword);
  TSParameterlessPropertyDirective.Add(TTWriteOnlySemikeyword);

  TSParameterModifier := TTokenSet.Create('parameter modifier');
  TSParameterModifier.Add(TTConstKeyword);
  TSParameterModifier.Add(TTOutSemikeyword);
  TSParameterModifier.Add(TTVarKeyword);

  TSPortabilityDirective := TTokenSet.Create('portability directive');
  TSPortabilityDirective.Add(TTPlatformSemikeyword);
  TSPortabilityDirective.Add(TTDeprecatedSemikeyword);
  TSPortabilityDirective.Add(TTLibraryKeyword);
  TSPortabilityDirective.Add(TTExperimentalSemikeyword);

  TSProgram := TTokenSet.Create('program');
  TSProgram.Add(TTProgramKeyword);
  TSProgram.Add(TTLibraryKeyword);

  TSRelOp := TTokenSet.Create('relational operator');
  TSRelOp.Add(TTEqualSign);
  TSRelOp.Add(TTGreaterThan);
  TSRelOp.Add(TTLessThan);
  TSRelOp.Add(TTLessOrEqual);
  TSRelOp.Add(TTGreaterOrEqual);
  TSRelOp.Add(TTNotEqual);
  TSRelOp.Add(TTInKeyword);
  TSRelOp.Add(TTIsKeyword);
  TSRelOp.Add(TTAsKeyword);

  TSSemikeyword := TTokenSet.Create('semikeyword');
  TSSemikeyword.Add(TTAbsoluteSemikeyword);
  TSSemikeyword.Add(TTAbstractSemikeyword);
  TSSemikeyword.Add(TTAssemblerSemikeyword);
  TSSemikeyword.Add(TTAssemblySemikeyword);
  TSSemikeyword.Add(TTAtSemikeyword);
  TSSemikeyword.Add(TTAutomatedSemikeyword);
  TSSemikeyword.Add(TTCdeclSemikeyword);
  TSSemikeyword.Add(TTContainsSemikeyword);
  TSSemikeyword.Add(TTDefaultSemikeyword);
  TSSemikeyword.Add(TTDeprecatedSemikeyword);
  TSSemikeyword.Add(TTDispIdSemikeyword);
  TSSemikeyword.Add(TTDynamicSemikeyword);
  TSSemikeyword.Add(TTExperimentalSemikeyword);
  TSSemikeyword.Add(TTExportSemikeyword);
  TSSemikeyword.Add(TTExternalSemikeyword);
  TSSemikeyword.Add(TTFarSemikeyword);
  TSSemikeyword.Add(TTFinalSemikeyword);
  TSSemikeyword.Add(TTForwardSemikeyword);
  TSSemikeyword.Add(TTHelperSemikeyword);
  TSSemikeyword.Add(TTImplementsSemikeyword);
  TSSemikeyword.Add(TTIndexSemikeyword);
  TSSemikeyword.Add(TTLocalSemikeyword);
  TSSemikeyword.Add(TTMessageSemikeyword);
  TSSemikeyword.Add(TTNameSemikeyword);
  TSSemikeyword.Add(TTNearSemikeyword);
  TSSemikeyword.Add(TTNoDefaultSemikeyword);
  TSSemikeyword.Add(TTOnSemikeyword);
  TSSemikeyword.Add(TTOperatorSemikeyword);
  TSSemikeyword.Add(TTOutSemikeyword);
  TSSemikeyword.Add(TTOverloadSemikeyword);
  TSSemikeyword.Add(TTOverrideSemikeyword);
  TSSemikeyword.Add(TTPackageSemikeyword);
  TSSemikeyword.Add(TTPascalSemikeyword);
  TSSemikeyword.Add(TTPlatformSemikeyword);
  TSSemikeyword.Add(TTPrivateSemikeyword);
  TSSemikeyword.Add(TTProtectedSemikeyword);
  TSSemikeyword.Add(TTPublicSemikeyword);
  TSSemikeyword.Add(TTPublishedSemikeyword);
  TSSemikeyword.Add(TTReadSemikeyword);
  TSSemikeyword.Add(TTReadOnlySemikeyword);
  TSSemikeyword.Add(TTRegisterSemikeyword);
  TSSemikeyword.Add(TTReintroduceSemikeyword);
  TSSemikeyword.Add(TTRequiresSemikeyword);
  TSSemikeyword.Add(TTResidentSemikeyword);
  TSSemikeyword.Add(TTSafecallSemikeyword);
  TSSemikeyword.Add(TTSealedSemikeyword);
  TSSemikeyword.Add(TTStaticSemikeyword);
  TSSemikeyword.Add(TTStdcallSemikeyword);
  TSSemikeyword.Add(TTStoredSemikeyword);
  TSSemikeyword.Add(TTStrictSemikeyword);
  TSSemikeyword.Add(TTUnsafeSemikeyword);
  TSSemikeyword.Add(TTVarArgsSemikeyword);
  TSSemikeyword.Add(TTVirtualSemikeyword);
  TSSemikeyword.Add(TTWriteSemikeyword);
  TSSemikeyword.Add(TTWriteOnlySemikeyword);

  TSUnaryOperator := TTokenSet.Create('unary operator');
  TSUnaryOperator.Add(TTAtSign);
  TSUnaryOperator.Add(TTInheritedKeyword);
  TSUnaryOperator.Add(TTMinusSign);
  TSUnaryOperator.Add(TTNotKeyword);
  TSUnaryOperator.Add(TTPlusSign);

  TSUses := TTokenSet.Create('uses clause');
  TSUses.Add(TTUsesKeyword);
  TSUses.Add(TTContainsSemikeyword);

  TSVarHeader := TTokenSet.Create('var section');
  TSVarHeader.Add(TTVarKeyword);
  TSVarHeader.Add(TTThreadVarKeyword);

  TSVisibilitySingleWord := TTokenSet.Create(
    '''private'', ''protected'', ''public'', or ''published''');
  TSVisibilitySingleWord.Add(TTPrivateSemikeyword);
  TSVisibilitySingleWord.Add(TTProtectedSemikeyword);
  TSVisibilitySingleWord.Add(TTPublicSemikeyword);
  TSVisibilitySingleWord.Add(TTPublishedSemikeyword);

  TSIdent := TTokenSet.Create('identifier');
  TSIdent.Add(TTIdentifier);
  TSIdent.AddRange(TSSemikeyword);

  TSDirective.AddRange(TSPortabilityDirective);
  TSParticle := TTokenSet.Create('expression');
  TSParticle.Add(TTFileKeyword);
  TSParticle.Add(TTNilKeyword);
  TSParticle.Add(TTNumber);
  TSParticle.Add(TTOpenBracket);
  TSParticle.Add(TTOpenParenthesis);
  TSParticle.Add(TTStringKeyword);
  TSParticle.Add(TTStringLiteral);
  TSParticle.AddRange(TSIdent);
  TSExpression := TTokenSet.Create('expression');
  TSExpression.AddRange(TSParticle);
  TSExpression.AddRange(TSUnaryOperator);
  TSExtendedIdent := TTokenSet.Create('identifier (including keyword)');
  TSExtendedIdent.AddRange(TSIdent);
  TSExtendedIdent.AddRange(TSKeyword);
  TSLabelId := TTokenSet.Create('label');
  TSLabelId.Add(TTNumber);
  TSLabelId.AddRange(TSIdent);
  TSParameter := TTokenSet.Create('parameter');
  TSParameter.AddRange(TSIdent);
  TSParameter.AddRange(TSParameterModifier);
  TSSimpleParameterType := TTokenSet.Create('parameter type');
  TSSimpleParameterType.Add(TTFileKeyword);
  TSSimpleParameterType.Add(TTStringKeyword);
  TSSimpleParameterType.AddRange(TSIdent);
  TSVisibility := TTokenSet.Create('visibility specifier');
  TSVisibility.Add(TTStrictSemikeyword);
  TSVisibility.AddRange(TSVisibilitySingleWord);
end;

initialization
  TTokenSets.Prepare;

finalization
  TTokenSets.CleanUp;

end.
