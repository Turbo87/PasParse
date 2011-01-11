unit URules;

interface

uses
  URule, UASTNode, UIParser, URuleType, UITokenSet;

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
  public
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
  public
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
  public
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
  public
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
  UTokenType, UToken, UListNode, UGeneratedNodes, UTokenSets;

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
  Result := False;
end;

function TAssemblerStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TAtomRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TBareInheritedRule }

function TBareInheritedRule.CanParse: Boolean;
begin
  Result := False;
end;

function TBareInheritedRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TBlockRule }

function TBlockRule.CanParse: Boolean;
begin
  Result := False;
end;

function TBlockRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TCaseSelectorRule }

function TCaseSelectorRule.CanParse: Boolean;
begin
  Result := False;
end;

function TCaseSelectorRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TCaseStatementRule }

function TCaseStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TCaseStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TClassOfTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TExceptionItemRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TExpressionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExpressionListRule }

function TExpressionListRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExpressionListRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExpressionOrAssignmentRule }

function TExpressionOrAssignmentRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExpressionOrAssignmentRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExpressionOrRangeRule }

function TExpressionOrRangeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExpressionOrRangeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TExpressionOrRangeListRule }

function TExpressionOrRangeListRule.CanParse: Boolean;
begin
  Result := False;
end;

function TExpressionOrRangeListRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TFactorRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TGotoStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TIfStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TLabelIdRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TParameterExpressionRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TParenthesizedExpressionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TParticleRule }

function TParticleRule.CanParse: Boolean;
begin
  Result := False;
end;

function TParticleRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TRaiseStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TRepeatStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TSetLiteralRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TSetTypeRule }

function TSetTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TSetTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TSimpleExpressionRule }

function TSimpleExpressionRule.CanParse: Boolean;
begin
  Result := False;
end;

function TSimpleExpressionRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TSimpleStatementRule }

function TSimpleStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TSimpleStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TStatementRule }

function TStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TStatementListRule }

function TStatementListRule.CanParse: Boolean;
begin
  Result := False;
end;

function TStatementListRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TStringTypeRule }

function TStringTypeRule.CanParse: Boolean;
begin
  Result := False;
end;

function TStringTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TTermRule }

function TTermRule.CanParse: Boolean;
begin
  Result := False;
end;

function TTermRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TTypeRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TUsesClauseRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TVisibilityRule.Evaluate: TASTNode;
begin
  Result := nil;
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
  Result := False;
end;

function TWhileStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

{ TWithStatementRule }

function TWithStatementRule.CanParse: Boolean;
begin
  Result := False;
end;

function TWithStatementRule.Evaluate: TASTNode;
begin
  Result := nil;
end;

end.
