unit UParser;

interface

uses
  UCompilerDefines, UToken, UIFrame, UITokenSet, UTokenType, UListNode,
  UParseException, UIParser, URule, URuleType, UASTNode, Contnrs;

type
  TFileLoader = class

  end;

  TRuleClass = class of TRule;

  TParser = class(IParser)
  private
    FNextFrame: IFrame;
    FRules: array of TRule;

    class function FrameFromTokens(ATokens: TObjectList): IFrame;
    function GetIsEOF: Boolean;

    procedure AddTokenRule(ARuleType: TRuleType; ATokenSet: ITokenSet);
    procedure AddRule(ARuleType: TRuleType; ARuleClass: TRuleClass);

  protected
    function ParseTokenList(ATokenSet: ITokenSet): TListNode; override;
    function TryParseToken(ATokenType: TTokenType): TToken; override;

    function Peek(AOffset: Integer): TTokenType; override;

    procedure MoveNext; override;

  public
    constructor CreateFromText(AText, AFileName: string;
      ACompilerDefines: TCompilerDefines; AFileLoader: TFileLoader);
    constructor CreateFromFrame(AFrame: IFrame);
    constructor CreateFromTokens(ATokens: TObjectList);
    destructor Destroy; override;

    property IsEOF: Boolean read GetIsEOF;

    function ParseToken(ATokenSet: ITokenSet): TToken; overload; override;
    function ParseToken(ATokenType: TTokenType): TToken; overload; override;
    function CanParseToken(ATokenSet: ITokenSet): Boolean; overload; override;
    function CanParseToken(ATokenType: TTokenType): Boolean; overload; override;
    function ParseDelimitedList(AItemRule: TRuleType; ADelimiterType: TTokenType): TListNode; override;
    function ParseRule(ARuleType: TRuleType): TASTNode;
    function CanParseRule(ARuleType: TRuleType): Boolean; override;
    function ParseRuleInternal(ARuleType: TRuleType): TASTNode; override;

    function CreateEmptyListNode: TListNode; override;

    function Failure(AExpected: string): EParseException; override;
  end;

implementation

uses
  ULexScanner, UEOFFrame, ULocation, UFrame, USingleTokenTokenSet, UTokenRule,
  UTokenSets, URules, UDelimitedItemNode;

{ TParser }

function TParser.CanParseRule(ARuleType: TRuleType): Boolean;
begin
  Result := FRules[Integer(ARuleType)].CanParse;
end;

function TParser.CanParseToken(ATokenType: TTokenType): Boolean;
begin
  Result := (Peek(0) = ATokenType);
end;

procedure TParser.AddRule(ARuleType: TRuleType; ARuleClass: TRuleClass);
begin
  FRules[Integer(ARuleType)] := ARuleClass.Create(Self, ARuleType);
end;

procedure TParser.AddTokenRule(ARuleType: TRuleType; ATokenSet: ITokenSet);
begin
  FRules[Integer(ARuleType)] := TTokenRule.Create(Self, ARuleType, ATokenSet);
end;

function TParser.CanParseToken(ATokenSet: ITokenSet): Boolean;
begin
  Result := ATokenSet.Contains(Peek(0));
end;

function TParser.CreateEmptyListNode: TListNode;
begin
  Result := TListNode.Create(TObjectList.Create(False));
end;

constructor TParser.CreateFromFrame(AFrame: IFrame);
begin
  inherited Create;
  FNextFrame := AFrame;
  SetLength(FRules, Integer(High(TRuleType)) + 1);

  AddRule(RTArrayType, TArrayTypeRule);
  AddRule(RTAssemblerStatement, TAssemblerStatementRule);
  AddRule(RTAssemblyAttribute, TAssemblyAttributeRule);
  AddRule(RTAtom, TAtomRule);
  AddRule(RTBareInherited, TBareInheritedRule);
  AddRule(RTBlock, TBlockRule);
  AddRule(RTCaseSelector, TCaseSelectorRule);
  AddRule(RTCaseStatement, TCaseStatementRule);
  AddRule(RTClassHelperType, TClassHelperTypeRule);
  AddRule(RTClassOfType, TClassOfTypeRule);
  AddRule(RTClassType, TClassTypeRule);
  AddRule(RTConstantDecl, TConstantDeclRule);
  AddRule(RTConstSection, TConstSectionRule);
  AddRule(RTDirective, TDirectiveRule);
  AddRule(RTEnumeratedType, TEnumeratedTypeRule);
  AddRule(RTEnumeratedTypeElement, TEnumeratedTypeElementRule);
  AddRule(RTExceptionItem, TExceptionItemRule);
  AddRule(RTExportsItem, TExportsItemRule);
  AddRule(RTExportsSpecifier, TExportsSpecifierRule);
  AddRule(RTExportsStatement, TExportsStatementRule);
  AddRule(RTExpression, TExpressionRule);
  AddRule(RTExpressionList, TExpressionListRule);
  AddRule(RTExpressionOrAssignment, TExpressionOrAssignmentRule);
  AddRule(RTExpressionOrRange, TExpressionOrRangeRule);
  AddRule(RTExpressionOrRangeList, TExpressionOrRangeListRule);
  AddRule(RTExtendedIdent, TExtendedIdentRule);
  AddRule(RTFactor, TFactorRule);
  AddRule(RTFancyBlock, TFancyBlockRule);
  AddRule(RTFieldDecl, TFieldDeclRule);
  AddRule(RTFieldSection, TFieldSectionRule);
  AddRule(RTFileType, TFileTypeRule);
  AddRule(RTForStatement, TForStatementRule);
  AddRule(RTGoal, TGoalRule);
  AddRule(RTGotoStatement, TGotoStatementRule);
  AddRule(RTIdent, TIdentRule);
  AddRule(RTIdentList, TIdentListRule);
  AddRule(RTIfStatement, TIfStatementRule);
  AddRule(RTImplementationDecl, TImplementationDeclRule);
  AddRule(RTImplementationSection, TImplementationSectionRule);
  AddRule(RTInitSection, TInitSectionRule);
  AddRule(RTInterfaceDecl, TInterfaceDeclRule);
  AddRule(RTInterfaceSection, TInterfaceSectionRule);
  AddRule(RTInterfaceType, TInterfaceTypeRule);
  AddRule(RTLabelDeclSection, TLabelDeclSectionRule);
  AddRule(RTLabelId, TLabelIdRule);
  AddRule(RTMethodHeading, TMethodHeadingRule);
  AddRule(RTMethodImplementation, TMethodImplementationRule);
  AddRule(RTMethodOrProperty, TMethodOrPropertyRule);
  AddRule(RTMethodReturnType, TMethodReturnTypeRule);
  AddRule(RTOpenArray, TOpenArrayRule);
  AddRule(RTPackage, TPackageRule);
  AddRule(RTPackedType, TPackedTypeRule);
  AddRule(RTParameter, TParameterRule);
  AddRule(RTParameterExpression, TParameterExpressionRule);
  AddRule(RTParameterType, TParameterTypeRule);
  AddRule(RTParenthesizedExpression, TParenthesizedExpressionRule);
  AddRule(RTParticle, TParticleRule);
  AddRule(RTPointerType, TPointerTypeRule);
  AddRule(RTProcedureType, TProcedureTypeRule);
  AddRule(RTProgram, TProgramRule);
  AddRule(RTProperty, TPropertyRule);
  AddRule(RTPropertyDirective, TPropertyDirectiveRule);
  AddRule(RTQualifiedIdent, TQualifiedIdentRule);
  AddRule(RTRaiseStatement, TRaiseStatementRule);
  AddRule(RTRecordFieldConstant, TRecordFieldConstantRule);
  AddRule(RTRecordHelperType, TRecordHelperTypeRule);
  AddRule(RTRecordType, TRecordTypeRule);
  AddRule(RTRepeatStatement, TRepeatStatementRule);
  AddRule(RTRequiresClause, TRequiresClauseRule);
  AddRule(RTSetLiteral, TSetLiteralRule);
  AddRule(RTSetType, TSetTypeRule);
  AddRule(RTSimpleExpression, TSimpleExpressionRule);
  AddRule(RTSimpleStatement, TSimpleStatementRule);
  AddRule(RTStatement, TStatementRule);
  AddRule(RTStatementList, TStatementListRule);
  AddRule(RTStringType, TStringTypeRule);
  AddRule(RTTerm, TTermRule);
  AddRule(RTTryStatement, TTryStatementRule);
  AddRule(RTType, TTypeRule);
  AddRule(RTTypedConstant, TTypedConstantRule);
  AddRule(RTTypeDecl, TTypeDeclRule);
  AddRule(RTTypeSection, TTypeSectionRule);
  AddRule(RTUnit, TUnitRule);
  AddRule(RTUsedUnit, TUsedUnitRule);
  AddRule(RTUsesClause, TUsesClauseRule);
  AddRule(RTVarDecl, TVarDeclRule);
  AddRule(RTVariantGroup, TVariantGroupRule);
  AddRule(RTVariantSection, TVariantSectionRule);
  AddRule(RTVarSection, TVarSectionRule);
  AddRule(RTVisibility, TVisibilityRule);
  AddRule(RTVisibilitySection, TVisibilitySectionRule);
  AddRule(RTVisibilitySectionContent, TVisibilitySectionContentRule);
  AddRule(RTWhileStatement, TWhileStatementRule);
  AddRule(RTWithStatement, TWithStatementRule);

  AddTokenRule(RTAddOp, TTokenSets.TSAddOp);
  AddTokenRule(RTMulOp, TTokenSets.TSMulOp);
  AddTokenRule(RTPortabilityDirective, TTokenSets.TSPortabilityDirective);
  AddTokenRule(RTRelOp, TTokenSets.TSRelOp);
  AddTokenRule(RTUnaryOperator, TTokenSets.TSUnaryOperator);
end;

constructor TParser.CreateFromText(AText, AFileName: string;
  ACompilerDefines: TCompilerDefines; AFileLoader: TFileLoader);
var
  ALexScanner: TLexScanner;
  ATokens: TObjectList;
begin
  ALexScanner := TLexScanner.Create(AText, AFileName);
  ATokens := ALexScanner.Tokens;
  // TODO TokenFilter
  CreateFromTokens(ATokens);
  ATokens.Free;
  ALexScanner.Free;
end;

constructor TParser.CreateFromTokens(ATokens: TObjectList);
begin
  CreateFromFrame(FrameFromTokens(ATokens));
end;

destructor TParser.Destroy;
var
  I: Integer;
begin
  for I := 0 to High(FRules) do
    FRules[I].Free;

  SetLength(FRules, 0);

  while not FNextFrame.IsEOF do
    MoveNext;

  FNextFrame.Free;
  inherited;
end;

function TParser.Failure(AExpected: string): EParseException;
begin
  Result := EParseException.Create('Expected ' + AExpected + ' but was ' +
    FNextFrame.DisplayName, FNextFrame.Location.Clone);
end;

class function TParser.FrameFromTokens(ATokens: TObjectList): IFrame;
var
  AFirstFrame: IFrame;
  APrevFrame: IFrame;
  AFrame: IFrame;
  I: Integer;
begin
  AFirstFrame := TEOFFrame.Create(TLocation.Create('', '', 0));
  APrevFrame := nil;
  for I := 0 to ATokens.Count - 1 do
  begin
    AFrame := TFrame.Create(ATokens[I] as TToken);
    if APrevFrame <> nil then
      APrevFrame.Next := AFrame
    else
    begin
      AFirstFrame.Free;
      AFirstFrame := AFrame;
    end;

    APrevFrame := AFrame;
  end;

  Result := AFirstFrame;
end;

function TParser.GetIsEOF: Boolean;
begin
  Result := FNextFrame.IsEOF;
end;

procedure TParser.MoveNext;
var
  ALastFrame: IFrame;
begin
  ALastFrame := FNextFrame;
  FNextFrame := FNextFrame.Next;
  ALastFrame.Free;
end;

function TParser.ParseToken(ATokenType: TTokenType): TToken;
var
  ASingleTokenTokenSet: TSingleTokenTokenSet;
begin
  ASingleTokenTokenSet := TSingleTokenTokenSet.Create(ATokenType);
  Result := ParseToken(ASingleTokenTokenSet);
  ASingleTokenTokenSet.Free;
end;

function TParser.ParseDelimitedList(AItemRule: TRuleType;
  ADelimiterType: TTokenType): TListNode;
var
  AItems: TObjectList;
  AItem: TASTNode;
  ADelimiter: TToken;
begin
  AItems := TObjectList.Create(False);

  repeat
    AItem := ParseRuleInternal(AItemRule);
    ADelimiter := nil;
    if CanParseToken(ADelimiterType) then
      ADelimiter := ParseToken(ADelimiterType);
      
    AItems.Add(TDelimitedItemNode.Create(AItem, ADelimiter));
  until (not CanParseRule(AItemRule));

  Result := TListNode.Create(AItems);
end;

function TParser.ParseRule(ARuleType: TRuleType): TASTNode;
begin
  Result := ParseRuleInternal(ARuleType);
  Result.BuildParentReferences(nil);
end;

function TParser.ParseRuleInternal(ARuleType: TRuleType): TASTNode;
begin
  Result := FRules[Integer(ARuleType)].Execute;
end;

function TParser.ParseToken(ATokenSet: ITokenSet): TToken;
begin
  Result := FNextFrame.ParseToken(ATokenSet);
  MoveNext;
end;

function TParser.ParseTokenList(ATokenSet: ITokenSet): TListNode;
var
  AList: TObjectList;
begin
  AList := TObjectList.Create(False);
  
  while CanParseToken(ATokenSet) do
    AList.Add(ParseToken(ATokenSet));

  Result := TListNode.Create(AList);
end;

function TParser.Peek(AOffset: Integer): TTokenType;
var
  AFrame: IFrame;
begin
  AFrame := FNextFrame;
  while AOffset > 0 do
  begin
    AFrame := AFrame.Next;
    Dec(AOffset);
  end;
  Result := AFrame.TokenType;
end;

function TParser.TryParseToken(ATokenType: TTokenType): TToken;
begin
  if CanParseToken(ATokenType) then
    Result := ParseToken(ATokenType)
  else
    Result := nil;
end;

end.
