unit URules;

interface

uses
  URule, UASTNode, UIParser, URuleType, UITokenSet, UAlternator;

type
  TArrayTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAssemblerStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAssemblyAttributeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TAtomRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TBareInheritedRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TBlockRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TCaseSelectorRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TCaseStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassHelperTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassOfTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TClassTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TConstantDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TConstSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TDirectiveRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TEnumeratedTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TEnumeratedTypeElementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExceptionItemRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsItemRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsSpecifierRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExportsStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrAssignmentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrRangeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExpressionOrRangeListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TExtendedIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFactorRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFancyBlockRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFieldDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFieldSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TFileTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TForStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TGoalRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TGotoStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIdentListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TIfStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TImplementationDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TImplementationSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInitSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TInterfaceTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TLabelDeclSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TLabelIdRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodHeadingRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodImplementationRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodOrPropertyRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TMethodReturnTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TOpenArrayRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TPackageRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPackedTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParameterTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParenthesizedExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TParticleRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPointerTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TProcedureTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TProgramRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPropertyRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TPropertyDirectiveRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TQualifiedIdentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TRaiseStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordFieldConstantRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordHelperTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRecordTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRepeatStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TRequiresClauseRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSetLiteralRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSetTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSimpleExpressionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TSimpleStatementRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStatementListRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TStringTypeRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTermRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTryStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeRule = class(TRule)
  private
    FAlternator: TAlternator;

  public
    constructor Create(AParser: IParser; ARuleType: TRuleType); override;
    destructor Destroy; override;

    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypedConstantRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TTypeSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUnitRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUsedUnitRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TUsesClauseRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVarDeclRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVariantGroupRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVariantSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVarSectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVisibilityRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVisibilitySectionRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TVisibilitySectionContentRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;
  
  TWhileStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;

  TWithStatementRule = class(TRule)
  public
    function CanParse: Boolean; override;
    function Evaluate: TASTNode; override;
  end;


implementation

uses
  UTokenType, UToken, UListNode, UGeneratedNodes, UTokenSets, UParseException,
  UDelimitedItemNode, Contnrs;

{ TArrayTypeRule }

function TArrayTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTArrayKeyword);
end;

function TArrayTypeRule.Evaluate: TASTNode;
var
  AArray: TToken;
  AOpenBracket, ACloseBracket: TToken;
  AIndexList: TListNode;
  AOf: TToken;
  AType: TASTNode;
begin
  AArray := FParser.ParseToken(TTArrayKeyword);
  AOpenBracket := nil;
  ACloseBracket := nil;

  if FParser.CanParseToken(TTOpenBracket) then
  begin
    AOpenBracket := FParser.ParseToken(TTOpenBracket);
    AIndexList := FParser.ParseDelimitedList(RTType, TTComma);
    ACloseBracket := FParser.ParseToken(TTCloseBracket);
  end
  else
    AIndexList := FParser.CreateEmptyListNode;

  AOf := FParser.ParseToken(TTOfKeyword);
  AType := FParser.ParseRuleInternal(RTType);

  Result := TArrayTypeNode.Create(AArray, AOpenBracket, AIndexList,
    ACloseBracket, AOf, AType);
end;

{ TAssemblerStatementRule }

function TAssemblerStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTAsmKeyword);
end;

function TAssemblerStatementRule.Evaluate: TASTNode;
var
  AASM, AEnd: TToken;
begin
  AASM := FParser.ParseToken(TTAsmKeyword);
  while not FParser.CanParseToken(TTEndKeyword) do
    try
      FParser.MoveNext;
    except
      AASM.Free;
      raise;
    end;

  AEnd := FParser.ParseToken(TTEndKeyword);
  Result := TAssemblerStatementNode.Create(AASM, AEnd);
end;

{ TAssemblyAttributeRule }

function TAssemblyAttributeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TAssemblyAttributeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TAtomRule }

function TAtomRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTParticle);
end;

function TAtomRule.Evaluate: TASTNode;
var
  ADot: TToken;
  ARight: TASTNode;
  ACaret: TToken;
  AOpenDelimiter, ACloseDelimiter: TToken;
  AParameterList: TListNode;
begin
  Result := FParser.ParseRuleInternal(RTParticle);
  while True do
  begin
    if FParser.CanParseToken(TTDot) then
    begin
      ADot := FParser.ParseToken(TTDot);
      ARight := FParser.ParseRuleInternal(RTExtendedIdent);
      Result := TBinaryOperationNode.Create(Result, ADot, ARight);
    end
    else if FParser.CanParseToken(TTCaret) then
    begin
      ACaret := FParser.ParseToken(TTCaret);
      Result := TPointerDereferenceNode.Create(Result, ACaret);
    end
    else if FParser.CanParseToken(TTOpenBracket) then
    begin
      AOpenDelimiter := FParser.ParseToken(TTOpenBracket);
      AParameterList := FParser.ParseRuleInternal(RTExpressionList) as TListNode;
      ACloseDelimiter := FParser.ParseToken(TTCloseBracket);
      Result := TParameterizedNode.Create(Result, AOpenDelimiter,
        AParameterList, ACloseDelimiter);
    end
    else if FParser.CanParseToken(TTOpenParenthesis) then
    begin
      AOpenDelimiter := FParser.ParseToken(TTOpenParenthesis);
      if FParser.CanParseRule(RTExpressionList) then
        AParameterList :=
          FParser.ParseDelimitedList(RTParameterExpression, TTComma)
      else
        AParameterList := FParser.CreateEmptyListNode;

      ACloseDelimiter := FParser.ParseToken(TTCloseParenthesis);
      Result := TParameterizedNode.Create(Result, AOpenDelimiter,
        AParameterList, ACloseDelimiter);
    end
    else
      Break;
  end;
end;

{ TBareInheritedRule }

function TBareInheritedRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTInheritedKeyword) and
    (not TTokenSets.TSExpression.Contains(FParser.Peek(1)));
end;

function TBareInheritedRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseToken(TTInheritedKeyword);
end;

{ TBlockRule }

function TBlockRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSBlock);
end;

function TBlockRule.Evaluate: TASTNode;
var
  ABegin, AEnd: TToken;
  AList: TListNode;
begin
  if FParser.CanParseRule(RTAssemblerStatement) then
    Result := FParser.ParseRuleInternal(RTAssemblerStatement)
  else
  begin
    ABegin := FParser.ParseToken(TTBeginKeyword);
    AList := FParser.ParseOptionalStatementList;
    AEnd := FParser.ParseToken(TTEndKeyword);
    Result := TBlockNode.Create(ABegin, AList, AEnd);
  end;
end;

{ TCaseSelectorRule }

function TCaseSelectorRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTExpressionOrRangeList);
end;

function TCaseSelectorRule.Evaluate: TASTNode;
var
  AValues: TListNode;
  AColon, ASemicolon: TToken;
  AStatement: TASTNode;
begin
  AValues := FParser.ParseDelimitedList(RTExpressionOrRange, TTComma);
  AColon := FParser.ParseToken(TTColon);

  AStatement := nil;
  if FParser.CanParseRule(RTStatement) then
    AStatement := FParser.ParseRuleInternal(RTStatement);

  ASemicolon := nil;
  if FParser.CanParseToken(TTSemicolon) then
    ASemicolon := FParser.ParseToken(TTSemicolon);

  Result := TCaseSelectorNode.Create(AValues, AColon, AStatement, ASemicolon);
end;

{ TCaseStatementRule }

function TCaseStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTCaseKeyword);
end;

function TCaseStatementRule.Evaluate: TASTNode;
var
  ACase, AOf, AElse, AEnd: TToken;
  AExpression: TASTNode;
  ASelectorList, AElseStatements: TListNode;
begin
  ACase := FParser.ParseToken(TTCaseKeyword);
  AExpression := FParser.ParseRuleInternal(RTExpression);
  AOf := FParser.ParseToken(TTOfKeyword);
  ASelectorList := FParser.ParseRequiredRuleList(RTCaseSelector);
  AElse := nil;
  if FParser.CanParseToken(TTElseKeyword) then
  begin
    AElse := FParser.ParseToken(TTElseKeyword);
    AElseStatements := FParser.ParseOptionalStatementList;
  end
  else
    AElseStatements := FParser.CreateEmptyListNode;
  AEnd := FParser.ParseToken(TTEndKeyword);
  Result := TCaseStatementNode.Create(ACase, AExpression, AOf, ASelectorList,
    AElse, AElseStatements, AEnd);
end;

{ TClassHelperTypeRule }

function TClassHelperTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TClassHelperTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TClassOfTypeRule }

function TClassOfTypeRule.CanParse: Boolean;
begin
  Result := (FParser.Peek(0) = TTClassKeyword) and
    (FParser.Peek(1) = TTOfKeyword);
end;

function TClassOfTypeRule.Evaluate: TASTNode;
var
  AClass, AOf: TToken;
  AType: TASTNode;
begin
  AClass := FParser.ParseToken(TTClassKeyword);
  AOf := FParser.ParseToken(TTOfKeyword);
  AType := FParser.ParseRuleInternal(RTQualifiedIdent);
  Result := TClassOfNode.Create(AClass, AOf, AType);
end;

{ TClassTypeRule }

function TClassTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TClassTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TConstantDeclRule }

function TConstantDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TConstantDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TConstSectionRule }

function TConstSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TConstSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TDirectiveRule }

function TDirectiveRule.CanParse: Boolean;
begin
  Result := False;
end;

function TDirectiveRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TEnumeratedTypeRule }

function TEnumeratedTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TEnumeratedTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TEnumeratedTypeElementRule }

function TEnumeratedTypeElementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TEnumeratedTypeElementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExceptionItemRule }

function TExceptionItemRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOnSemikeyword);
end;

function TExceptionItemRule.Evaluate: TASTNode;
var
  AOn, AName, AColon, ADo, ASemicolon: TToken;
  AType, AStatement: TASTNode;
begin
  AOn := FParser.ParseToken(TTOnSemikeyword);

  AName := nil;
  AColon := nil;
  if FParser.Peek(1) = TTColon then
  begin
    AName := FParser.ParseRuleInternal(RTIdent) as TToken;
    AColon := FParser.ParseToken(TTColon);
  end;

  AType := FParser.ParseRuleInternal(RTQualifiedIdent);
  ADo := FParser.ParseToken(TTDoKeyword);

  AStatement := nil;
  if FParser.CanParseRule(RTStatement) then
    AStatement := FParser.ParseRuleInternal(RTStatement);

  ASemicolon := nil;
  if FParser.CanParseToken(TTSemicolon) then
    ASemicolon := FParser.ParseToken(TTSemicolon);

  Result := TExceptionItemNode.Create(AOn, AName, AColon, AType, ADo,
    AStatement, ASemicolon);
end;

{ TExportsItemRule }

function TExportsItemRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExportsItemRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExportsSpecifierRule }

function TExportsSpecifierRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExportsSpecifierRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExportsStatementRule }

function TExportsStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExportsStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExpressionRule }

function TExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTSimpleExpression);
  while FParser.CanParseRule(RTRelOp) do
  begin
    AOperator := FParser.ParseRuleInternal(RTRelOp) as TToken;
    ARight := FParser.ParseRuleInternal(RTSimpleExpression);
    Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
  end;
end;

{ TExpressionListRule }

function TExpressionListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionListRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseDelimitedList(RTExpression, TTComma);
end;

{ TExpressionOrAssignmentRule }

function TExpressionOrAssignmentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrAssignmentRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTExpression);
  if FParser.CanParseToken(TTColonEquals) then
  begin
    AOperator := FParser.ParseToken(TTColonEquals);
    ARight := FParser.ParseRuleInternal(RTExpression);
    Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
  end;
end;

{ TExpressionOrRangeRule }

function TExpressionOrRangeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrRangeRule.Evaluate: TASTNode;
var
  ADotDot: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTSimpleExpression);
  if FParser.CanParseToken(TTDotDot) then
  begin
    ADotDot := FParser.ParseToken(TTDotDot);
    ARight := FParser.ParseRuleInternal(RTSimpleExpression);
    Result := TBinaryOperationNode.Create(Result, ADotDot, ARight);
  end;
end;

{ TExpressionOrRangeListRule }

function TExpressionOrRangeListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TExpressionOrRangeListRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseDelimitedList(RTExpressionOrRange, TTComma);
end;

{ TExtendedIdentRule }

function TExtendedIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExtendedIdent);
end;

function TExtendedIdentRule.Evaluate: TASTNode;
var
  AToken: TToken;
begin
  AToken := FParser.ParseToken(TTokenSets.TSExtendedIdent);
  Result := AToken.WithTokenType(TTIdentifier);
  AToken.Free;
end;

{ TFactorRule }

function TFactorRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TFactorRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  AOperand: TASTNode;
begin
  if FParser.CanParseRule(RTUnaryOperator) then
  begin
    AOperator := FParser.ParseRuleInternal(RTUnaryOperator) as TToken;
    try
      AOperand := FParser.ParseRuleInternal(RTFactor);
    except
      on EParseException do
      begin
        AOperator.Free;
        raise;
      end;
    end;
    Result := TUnaryOperationNode.Create(AOperator, AOperand);
  end
  else
    Result := FParser.ParseRuleInternal(RTAtom);
end;

{ TFancyBlockRule }

function TFancyBlockRule.CanParse: Boolean;
begin
  Result := False;
end;

function TFancyBlockRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TFieldDeclRule }

function TFieldDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TFieldDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TFieldSectionRule }

function TFieldSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TFieldSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TFileTypeRule }

function TFileTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTFileKeyword);
end;

function TFileTypeRule.Evaluate: TASTNode;
var
  AFile: TToken;
  AOf: TToken;
  AType: TASTNode;
begin
  AFile := FParser.ParseToken(TTFileKeyword);
  AOf := nil;
  AType := nil;
  if FParser.CanParseToken(TTOfKeyword) then
  begin
    AOf := FParser.ParseToken(TTOfKeyword);
    AType := FParser.ParseRuleInternal(RTQualifiedIdent);
  end;
  Result := TFileTypeNode.Create(AFile, AOf, AType);
end;

{ TForStatementRule }

function TForStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TForStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TGoalRule }

function TGoalRule.CanParse: Boolean;
begin
  Result := False;
end;

function TGoalRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TGotoStatementRule }

function TGotoStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTGotoKeyword);
end;

function TGotoStatementRule.Evaluate: TASTNode;
var
  AGoTo: TToken;
  ALabelId: TToken;
begin
  AGoTo := FParser.ParseToken(TTGotoKeyword);
  ALabelId := FParser.ParseRuleInternal(RTLabelId) as TToken;
  Result := TGotoStatementNode.Create(AGoTo, ALabelId);
end;

{ TIdentRule }

function TIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TIdentRule.Evaluate: TASTNode;
var
  AToken: TToken;
begin
  AToken := FParser.ParseToken(TTokenSets.TSIdent);
  Result := AToken.WithTokenType(TTIdentifier);
  AToken.Free;
end;

{ TIdentListRule }

function TIdentListRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TIdentListRule.Evaluate: TASTNode;
begin
  Result := FParser.ParseDelimitedList(RTIdent, TTComma);
end;

{ TIfStatementRule }

function TIfStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTIfKeyword);
end;

function TIfStatementRule.Evaluate: TASTNode;
var
  AIf, AThen, AElse: TToken;
  ACondition, AThenStatement, AElseStatement: TASTNode;
begin
  AIf := FParser.ParseToken(TTIfKeyword);
  ACondition := FParser.ParseRuleInternal(RTExpression);
  AThen := FParser.ParseToken(TTThenKeyword);
  AThenStatement := nil;
  if FParser.CanParseRule(RTStatement) then
    AThenStatement := FParser.ParseRuleInternal(RTStatement);

  AElse := nil;
  AElseStatement := nil;

  if FParser.CanParseToken(TTElseKeyword) then
  begin
    AElse := FParser.ParseToken(TTElseKeyword);
    if FParser.CanParseRule(RTStatement) then
      AElseStatement := FParser.ParseRuleInternal(RTStatement);
  end;

  Result := TIfStatementNode.Create(AIf, ACondition, AThen, AThenStatement,
    AElse, AElseStatement);
end;

{ TImplementationDeclRule }

function TImplementationDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TImplementationDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TImplementationSectionRule }

function TImplementationSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TImplementationSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TInitSectionRule }

function TInitSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TInitSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TInterfaceDeclRule }

function TInterfaceDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TInterfaceDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TInterfaceSectionRule }

function TInterfaceSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TInterfaceSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TInterfaceTypeRule }

function TInterfaceTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TInterfaceTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TLabelDeclSectionRule }

function TLabelDeclSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TLabelDeclSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TLabelIdRule }

function TLabelIdRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TLabelIdRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddToken(TTNumber);
  FAlternator.AddRule(RTIdent);
end;

destructor TLabelIdRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TLabelIdRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TMethodHeadingRule }

function TMethodHeadingRule.CanParse: Boolean;
begin
  Result := False;
end;

function TMethodHeadingRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TMethodImplementationRule }

function TMethodImplementationRule.CanParse: Boolean;
begin
  Result := False;
end;

function TMethodImplementationRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TMethodOrPropertyRule }

function TMethodOrPropertyRule.CanParse: Boolean;
begin
  Result := False;
end;

function TMethodOrPropertyRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TMethodReturnTypeRule }

function TMethodReturnTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TMethodReturnTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TOpenArrayRule }

function TOpenArrayRule.CanParse: Boolean;
begin
  Result := False;
end;

function TOpenArrayRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TPackageRule }

function TPackageRule.CanParse: Boolean;
begin
  Result := False;
end;

function TPackageRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TPackedTypeRule }

function TPackedTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TPackedTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TParameterRule }

function TParameterRule.CanParse: Boolean;
begin
  Result := False;
end;

function TParameterRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TParameterExpressionRule }

function TParameterExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTExpression);
end;

function TParameterExpressionRule.Evaluate: TASTNode;
var
  ASizeColon, APrecisionColon: TToken;
  ASize, APrecision: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTExpression);
  if FParser.CanParseToken(TTColon) then
  begin
    ASizeColon := FParser.ParseToken(TTColon);
    ASize := FParser.ParseRuleInternal(RTExpression);

    APrecisionColon := nil;
    APrecision := nil;

    if FParser.CanParseToken(TTColon) then
    begin
      APrecisionColon := FParser.ParseToken(TTColon);
      APrecision := FParser.ParseRuleInternal(RTExpression);
    end;

    Result := TNumberFormatNode.Create(Result, ASizeColon, ASize,
      APrecisionColon, APrecision);
  end;
end;

{ TParameterTypeRule }

function TParameterTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TParameterTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TParenthesizedExpressionRule }

function TParenthesizedExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenParenthesis);
end;

function TParenthesizedExpressionRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AExpression: TASTNode;
begin
  AOpen := FParser.ParseToken(TTOpenParenthesis);
  AExpression := FParser.ParseRuleInternal(RTExpression);
  AClose := FParser.ParseToken(TTCloseParenthesis);
  Result := TParenthesizedExpressionNode.Create(AOpen, AExpression, AClose);
end;

{ TParticleRule }

function TParticleRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TParticleRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddToken(TTFileKeyword);
  FAlternator.AddToken(TTNilKeyword);
  FAlternator.AddToken(TTNumber);
  FAlternator.AddToken(TTStringKeyword);
  FAlternator.AddToken(TTStringLiteral);
  FAlternator.AddRule(RTIdent);
  FAlternator.AddRule(RTParenthesizedExpression);
  FAlternator.AddRule(RTSetLiteral);
end;

destructor TParticleRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TParticleRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TPointerTypeRule }

function TPointerTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TPointerTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TProcedureTypeRule }

function TProcedureTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TProcedureTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TProgramRule }

function TProgramRule.CanParse: Boolean;
begin
  Result := False;
end;

function TProgramRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TPropertyRule }

function TPropertyRule.CanParse: Boolean;
begin
  Result := False;
end;

function TPropertyRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TPropertyDirectiveRule }

function TPropertyDirectiveRule.CanParse: Boolean;
begin
  Result := False;
end;

function TPropertyDirectiveRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TQualifiedIdentRule }

function TQualifiedIdentRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TQualifiedIdentRule.Evaluate: TASTNode;
var
  ADot: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTIdent);
  while FParser.CanParseToken(TTDot) do
  begin
    ADot := FParser.ParseToken(TTDot);
    ARight := FParser.ParseRuleInternal(RTExtendedIdent);
    Result := TBinaryOperationNode.Create(Result, ADot, ARight);
  end;
end;

{ TRaiseStatementRule }

function TRaiseStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRaiseKeyword);
end;

function TRaiseStatementRule.Evaluate: TASTNode;
var
  ARaise, AAt: TToken;
  AException, AAddress: TASTNode;
begin
  ARaise := FParser.ParseToken(TTRaiseKeyword);
  AException := nil;
  AAt := nil;
  AAddress := nil;
  if FParser.CanParseRule(RTExpression) then
  begin
    AException := FParser.ParseRuleInternal(RTExpression);
    if FParser.CanParseToken(TTAtSemikeyword) then
    begin
      AAt := FParser.ParseToken(TTAtSemikeyword);
      AAddress := FParser.ParseRuleInternal(RTExpression);
    end;
  end;

  Result := TRaiseStatementNode.Create(ARaise, AException, AAt, AAddress);
end;

{ TRecordFieldConstantRule }

function TRecordFieldConstantRule.CanParse: Boolean;
begin
  Result := False;
end;

function TRecordFieldConstantRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TRecordHelperTypeRule }

function TRecordHelperTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TRecordHelperTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TRecordTypeRule }

function TRecordTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TRecordTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TRepeatStatementRule }

function TRepeatStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTRepeatKeyword);
end;

function TRepeatStatementRule.Evaluate: TASTNode;
var
  ARepeat, AUntil: TToken;
  AList: TListNode;
  ACondition: TASTNode;
begin
  ARepeat := FParser.ParseToken(TTRepeatKeyword);
  AList := FParser.ParseOptionalStatementList;
  AUntil := FParser.ParseToken(TTUntilKeyword);
  ACondition := FParser.ParseRuleInternal(RTExpression);
  Result := TRepeatStatementNode.Create(ARepeat, AList, AUntil, ACondition);
end;

{ TRequiresClauseRule }

function TRequiresClauseRule.CanParse: Boolean;
begin
  Result := False;
end;

function TRequiresClauseRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TSetLiteralRule }

function TSetLiteralRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTOpenBracket);
end;

function TSetLiteralRule.Evaluate: TASTNode;
var
  AOpen, AClose: TToken;
  AList: TListNode;
begin
  AOpen := FParser.ParseToken(TTOpenBracket);
  
  if FParser.CanParseRule(RTExpressionOrRangeList) then
    AList := FParser.ParseRuleInternal(RTExpressionOrRangeList) as TListNode
  else
    AList := FParser.CreateEmptyListNode;
    
  AClose := FParser.ParseToken(TTCloseBracket);
  Result := TSetLiteralNode.Create(AOpen, AList, AClose);
end;

{ TSetTypeRule }

function TSetTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTSetKeyword);
end;

function TSetTypeRule.Evaluate: TASTNode;
var
  ASet, AOf: TToken;
  AType: TASTNode;
begin
  ASet := FParser.ParseToken(TTSetKeyword);
  AOf := FParser.ParseToken(TTOfKeyword);
  AType := FParser.ParseRuleInternal(RTType);
  Result := TSetOfNode.Create(ASet, AOf, AType);
end;

{ TSimpleExpressionRule }

function TSimpleExpressionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TSimpleExpressionRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTTerm);
  while FParser.CanParseRule(RTAddOp) do
  begin
    AOperator := FParser.ParseRuleInternal(RTAddOp) as TToken;
    ARight := FParser.ParseRuleInternal(RTTerm);
    Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
  end;
end;

{ TSimpleStatementRule }

function TSimpleStatementRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TSimpleStatementRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTBareInherited);
  FAlternator.AddRule(RTBlock);
  FAlternator.AddRule(RTCaseStatement);
  FAlternator.AddRule(RTExpressionOrAssignment);
  FAlternator.AddRule(RTForStatement);
  FAlternator.AddRule(RTGotoStatement);
  FAlternator.AddRule(RTIfStatement);
  FAlternator.AddRule(RTRaiseStatement);
  FAlternator.AddRule(RTRepeatStatement);
  FAlternator.AddRule(RTTryStatement);
  FAlternator.AddRule(RTWhileStatement);
  FAlternator.AddRule(RTWithStatement);
end;

destructor TSimpleStatementRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TSimpleStatementRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TStatementRule }

function TStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseRule(RTSimpleStatement);
end;

function TStatementRule.Evaluate: TASTNode;
var
  ALabel, AColon: TToken;
  AStatement: TASTNode;
begin
  if (TTokenSets.TSLabelId.Contains(FParser.Peek(0))) and
    (FParser.Peek(1) = TTColon) then
  begin
    ALabel := FParser.ParseRuleInternal(RTLabelId) as TToken;
    AColon := FParser.ParseToken(TTColon);
    AStatement := nil;
    if FParser.CanParseRule(RTSimpleStatement) then
      AStatement := FParser.ParseRuleInternal(RTSimpleStatement);

    Result := TLabeledStatementNode.Create(ALabel, AColon, AStatement);
  end
  else
    Result := FParser.ParseRuleInternal(RTSimpleStatement);
end;

{ TStatementListRule }

function TStatementListRule.CanParse: Boolean;
begin
  Result := (FParser.CanParseRule(RTStatement)) or
    (FParser.CanParseToken(TTSemicolon));
end;

function TStatementListRule.Evaluate: TASTNode;
var
  AItems: TObjectList;
  AItem: TASTNode;
  ADelimiter: TToken;
begin
  AItems := TObjectList.Create(False);
  while (FParser.CanParseRule(RTStatement)) or
    (FParser.CanParseToken(TTSemicolon)) do
  begin
    AItem := nil;
    if FParser.CanParseRule(RTStatement) then
      AItem := FParser.ParseRuleInternal(RTStatement);

    ADelimiter := nil;
    if FParser.CanParseToken(TTSemicolon) then
      ADelimiter := FParser.ParseToken(TTSemicolon);

    AItems.Add(TDelimitedItemNode.Create(AItem, ADelimiter));
  end;
  Result := TListNode.Create(AItems);
  AItems.Free;
end;

{ TStringTypeRule }

function TStringTypeRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTStringKeyword);
end;

function TStringTypeRule.Evaluate: TASTNode;
var
  AOpenBracket, ACloseBracket: TToken;
  ALength: TASTNode;
begin
  Result := FParser.ParseToken(TTStringKeyword);
  if FParser.CanParseToken(TTOpenBracket) then
  begin
    AOpenBracket := FParser.ParseToken(TTOpenBracket);
    ALength := FParser.ParseRuleInternal(RTExpression);
    ACloseBracket := FParser.ParseToken(TTCloseBracket);
    Result := TStringOfLengthNode.Create(Result as TToken,
      AOpenBracket, ALength, ACloseBracket);
  end;
end;

{ TTermRule }

function TTermRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSExpression);
end;

function TTermRule.Evaluate: TASTNode;
var
  AOperator: TToken;
  ARight: TASTNode;
begin
  Result := FParser.ParseRuleInternal(RTFactor);
  while FParser.CanParseRule(RTMulOp) do
  begin
    AOperator := FParser.ParseRuleInternal(RTMulOp) as TToken;
    ARight := FParser.ParseRuleInternal(RTFactor);
    Result := TBinaryOperationNode.Create(Result, AOperator, ARight);
  end;
end;

{ TTryStatementRule }

function TTryStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TTryStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TTypeRule }

function TTypeRule.CanParse: Boolean;
begin
  Result := FAlternator.LookAhead(FParser);
end;

constructor TTypeRule.Create(AParser: IParser; ARuleType: TRuleType);
begin
  inherited Create(AParser, ARuleType);
  FAlternator := TAlternator.Create;
  FAlternator.AddRule(RTFileType);
  FAlternator.AddRule(RTStringType);
  FAlternator.AddRule(RTArrayType);
  FAlternator.AddRule(RTClassHelperType);
  FAlternator.AddRule(RTClassOfType);
  FAlternator.AddRule(RTClassType);
  FAlternator.AddRule(RTEnumeratedType);
  FAlternator.AddRule(RTExpressionOrRange);
  FAlternator.AddRule(RTInterfaceType);
  FAlternator.AddRule(RTPackedType);
  FAlternator.AddRule(RTPointerType);
  FAlternator.AddRule(RTProcedureType);
  FAlternator.AddRule(RTRecordHelperType);
  FAlternator.AddRule(RTRecordType);
  FAlternator.AddRule(RTSetType);
end;

destructor TTypeRule.Destroy;
begin
  FAlternator.Free;
  inherited;
end;

function TTypeRule.Evaluate: TASTNode;
begin
  Result := FAlternator.Execute(FParser);
end;

{ TTypedConstantRule }

function TTypedConstantRule.CanParse: Boolean;
begin
  Result := False;
end;

function TTypedConstantRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TTypeDeclRule }

function TTypeDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TTypeDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TTypeSectionRule }

function TTypeSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TTypeSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TUnitRule }

function TUnitRule.CanParse: Boolean;
begin
  Result := False;
end;

function TUnitRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TUsedUnitRule }

function TUsedUnitRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSIdent);
end;

function TUsedUnitRule.Evaluate: TASTNode;
var
  AName: TASTNode;
  AIn, AFileName: TToken;
begin
  AName := FParser.ParseRuleInternal(RTQualifiedIdent);
  AIn := nil;
  AFileName := nil;
  if FParser.CanParseToken(TTInKeyword) then
  begin
    AIn := FParser.ParseToken(TTInKeyword);
    AFileName := FParser.ParseToken(TTStringLiteral);
  end;
  Result := TUsedUnitNode.Create(AName, AIn, AFileName);
end;

{ TUsesClauseRule }

function TUsesClauseRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSUses);
end;

function TUsesClauseRule.Evaluate: TASTNode;
var
  AUses: TToken;
  AUnitList: TListNode;
  ASemicolon: TToken;
begin
  AUses := FParser.ParseToken(TTokenSets.TSUses);
  AUnitList := FParser.ParseDelimitedList(RTUsedUnit, TTComma);
  ASemicolon := FParser.ParseToken(TTSemicolon);
  Result := TUsesClauseNode.Create(AUses, AUnitList, ASemicolon);
end;

{ TVarDeclRule }

function TVarDeclRule.CanParse: Boolean;
begin
  Result := False;
end;

function TVarDeclRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TVariantGroupRule }

function TVariantGroupRule.CanParse: Boolean;
begin
  Result := False;
end;

function TVariantGroupRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TVariantSectionRule }

function TVariantSectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TVariantSectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TVarSectionRule }

function TVarSectionRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSVarHeader);
end;

function TVarSectionRule.Evaluate: TASTNode;
var
  AVar: TToken;
  AVarList: TListNode;
begin
  AVar := FParser.ParseToken(TTokenSets.TSVarHeader);
  AVarList := FParser.ParseRequiredRuleList(RTVarDecl);
  Result := TVarSectionNode.Create(AVar, AVarList);
end;

{ TVisibilityRule }

function TVisibilityRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTokenSets.TSVisibility);
end;

function TVisibilityRule.Evaluate: TASTNode;
var
  AStrict, AVisibility: TToken;
begin
  AStrict := nil;
  if FParser.CanParseToken(TTStrictSemikeyword) then
    AStrict := FParser.ParseToken(TTStrictSemikeyword);

  AVisibility := FParser.ParseToken(TTokenSets.TSVisibilitySingleWord);
  Result := TVisibilityNode.Create(AStrict, AVisibility);
end;

{ TVisibilitySectionRule }

function TVisibilitySectionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TVisibilitySectionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TVisibilitySectionContentRule }

function TVisibilitySectionContentRule.CanParse: Boolean;
begin
  Result := False;
end;

function TVisibilitySectionContentRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TWhileStatementRule }

function TWhileStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTWhileKeyword);
end;

function TWhileStatementRule.Evaluate: TASTNode;
var
  AWhile, ADo: TToken;
  ACondition, AStatement: TASTNode;
begin
  AWhile := FParser.ParseToken(TTWhileKeyword);
  ACondition := FParser.ParseRuleInternal(RTExpression);
  ADo := FParser.ParseToken(TTDoKeyword);
  AStatement := nil;
  if FParser.CanParseRule(RTStatement) then
    AStatement := FParser.ParseRuleInternal(RTStatement);

  Result := TWhileStatementNode.Create(AWhile, ACondition, ADo, AStatement);
end;

{ TWithStatementRule }

function TWithStatementRule.CanParse: Boolean;
begin
  Result := FParser.CanParseToken(TTWithKeyword);
end;

function TWithStatementRule.Evaluate: TASTNode;
var
  AWith, ADo: TToken;
  AList: TListNode;
  AStatement: TASTNode;
begin
  AWith := FParser.ParseToken(TTWithKeyword);
  AList := FParser.ParseDelimitedList(RTExpression, TTComma);
  ADo := FParser.ParseToken(TTDoKeyword);
  AStatement := nil;
  if FParser.CanParseRule(RTStatement) then
    AStatement := FParser.ParseRuleInternal(RTStatement);

  Result := TWithStatementNode.Create(AWith, AList, ADo, AStatement);
end;

end.
