unit UGeneratedNodes;

/////////////////////////////////////////
// This file is generated! Don't edit! //
/////////////////////////////////////////

interface

uses
  UNonTerminalNode, UASTNode, UToken, UListNode;
                                   
type
  // Forward declarations
  TArrayTypeNode = class;
  TAssemblerStatementNode = class;
  TAttributeNode = class;
  TBinaryOperationNode = class;
  TBlockNode = class;
  TCaseSelectorNode = class;
  TCaseStatementNode = class;
  TClassOfNode = class;
  TClassTypeNode = class;
  TConstSectionNode = class;
  TConstantDeclNode = class;
  TConstantListNode = class;
  TDirectiveNode = class;
  TEnumeratedTypeElementNode = class;
  TEnumeratedTypeNode = class;
  TExceptionItemNode = class;
  TExportsItemNode = class;
  TExportsSpecifierNode = class;
  TExportsStatementNode = class;
  TFancyBlockNode = class;
  TFieldDeclNode = class;
  TFieldSectionNode = class;
  TFileTypeNode = class;
  TForInStatementNode = class;
  TForStatementNode = class;
  TGotoStatementNode = class;
  TIfStatementNode = class;
  TInitSectionNode = class;
  TInterfaceTypeNode = class;
  TLabelDeclSectionNode = class;
  TLabeledStatementNode = class;
  TMethodHeadingNode = class;
  TMethodImplementationNode = class;
  TMethodResolutionNode = class;
  TNumberFormatNode = class;
  TOpenArrayNode = class;
  TPackageNode = class;
  TPackedTypeNode = class;
  TParameterNode = class;
  TParameterizedNode = class;
  TParenthesizedExpressionNode = class;
  TPointerDereferenceNode = class;
  TPointerTypeNode = class;
  TProcedureTypeNode = class;
  TProgramNode = class;
  TPropertyNode = class;
  TRaiseStatementNode = class;
  TRecordFieldConstantNode = class;
  TRecordTypeNode = class;
  TRepeatStatementNode = class;
  TRequiresClauseNode = class;
  TSetLiteralNode = class;
  TSetOfNode = class;
  TStringOfLengthNode = class;
  TTryExceptNode = class;
  TTryFinallyNode = class;
  TTypeDeclNode = class;
  TTypeForwardDeclarationNode = class;
  TTypeHelperNode = class;
  TTypeSectionNode = class;
  TUnaryOperationNode = class;
  TUnitNode = class;
  TUnitSectionNode = class;
  TUsedUnitNode = class;
  TUsesClauseNode = class;
  TVarDeclNode = class;
  TVarSectionNode = class;
  TVariantGroupNode = class;
  TVariantSectionNode = class;
  TVisibilityNode = class;
  TVisibilitySectionNode = class;
  TWhileStatementNode = class;
  TWithStatementNode = class;

  // Real declarations
  TArrayTypeNode = class(TNonTerminalNode)
  private
    FArrayKeywordNode: TToken;
    FOpenBracketNode: TToken;
    FIndexListNode: TListNode;
    FCloseBracketNode: TToken;
    FOfKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(AArrayKeywordNode: TToken; AOpenBracketNode: TToken; AIndexListNode: TListNode; ACloseBracketNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);

    property ArrayKeywordNode: TToken read FArrayKeywordNode;
    property OpenBracketNode: TToken read FOpenBracketNode;
    property IndexListNode: TListNode read FIndexListNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TAssemblerStatementNode = class(TNonTerminalNode)
  private
    FAsmKeywordNode: TToken;
    FEndKeywordNode: TToken;

  public
    constructor Create(AAsmKeywordNode: TToken; AEndKeywordNode: TToken);

    property AsmKeywordNode: TToken read FAsmKeywordNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TAttributeNode = class(TNonTerminalNode)
  private
    FOpenBracketNode: TToken;
    FScopeNode: TToken;
    FColonNode: TToken;
    FValueNode: TASTNode;
    FCloseBracketNode: TToken;

  public
    constructor Create(AOpenBracketNode: TToken; AScopeNode: TToken; AColonNode: TToken; AValueNode: TASTNode; ACloseBracketNode: TToken);

    property OpenBracketNode: TToken read FOpenBracketNode;
    property ScopeNode: TToken read FScopeNode;
    property ColonNode: TToken read FColonNode;
    property ValueNode: TASTNode read FValueNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
  end;

  TBinaryOperationNode = class(TNonTerminalNode)
  private
    FLeftNode: TASTNode;
    FOperatorNode: TToken;
    FRightNode: TASTNode;

  public
    constructor Create(ALeftNode: TASTNode; AOperatorNode: TToken; ARightNode: TASTNode);

    property LeftNode: TASTNode read FLeftNode;
    property OperatorNode: TToken read FOperatorNode;
    property RightNode: TASTNode read FRightNode;
  end;

  TBlockNode = class(TNonTerminalNode)
  private
    FBeginKeywordNode: TToken;
    FStatementListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ABeginKeywordNode: TToken; AStatementListNode: TListNode; AEndKeywordNode: TToken);

    property BeginKeywordNode: TToken read FBeginKeywordNode;
    property StatementListNode: TListNode read FStatementListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TCaseSelectorNode = class(TNonTerminalNode)
  private
    FValueListNode: TListNode;
    FColonNode: TToken;
    FStatementNode: TASTNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AValueListNode: TListNode; AColonNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);

    property ValueListNode: TListNode read FValueListNode;
    property ColonNode: TToken read FColonNode;
    property StatementNode: TASTNode read FStatementNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TCaseStatementNode = class(TNonTerminalNode)
  private
    FCaseKeywordNode: TToken;
    FExpressionNode: TASTNode;
    FOfKeywordNode: TToken;
    FSelectorListNode: TListNode;
    FElseKeywordNode: TToken;
    FElseStatementListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ACaseKeywordNode: TToken; AExpressionNode: TASTNode; AOfKeywordNode: TToken; ASelectorListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);

    property CaseKeywordNode: TToken read FCaseKeywordNode;
    property ExpressionNode: TASTNode read FExpressionNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property SelectorListNode: TListNode read FSelectorListNode;
    property ElseKeywordNode: TToken read FElseKeywordNode;
    property ElseStatementListNode: TListNode read FElseStatementListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TClassOfNode = class(TNonTerminalNode)
  private
    FClassKeywordNode: TToken;
    FOfKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(AClassKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);

    property ClassKeywordNode: TToken read FClassKeywordNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TClassTypeNode = class(TNonTerminalNode)
  private
    FClassKeywordNode: TToken;
    FDispositionNode: TToken;
    FOpenParenthesisNode: TToken;
    FInheritanceListNode: TListNode;
    FCloseParenthesisNode: TToken;
    FContentListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(AClassKeywordNode: TToken; ADispositionNode: TToken; AOpenParenthesisNode: TToken; AInheritanceListNode: TListNode; ACloseParenthesisNode: TToken; AContentListNode: TListNode; AEndKeywordNode: TToken);

    property ClassKeywordNode: TToken read FClassKeywordNode;
    property DispositionNode: TToken read FDispositionNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property InheritanceListNode: TListNode read FInheritanceListNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property ContentListNode: TListNode read FContentListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TConstSectionNode = class(TNonTerminalNode)
  private
    FConstKeywordNode: TToken;
    FConstListNode: TListNode;

  public
    constructor Create(AConstKeywordNode: TToken; AConstListNode: TListNode);

    property ConstKeywordNode: TToken read FConstKeywordNode;
    property ConstListNode: TListNode read FConstListNode;
  end;

  TConstantDeclNode = class(TNonTerminalNode)
  private
    FNameNode: TToken;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FEqualSignNode: TToken;
    FValueNode: TASTNode;
    FPortabilityDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);

    property NameNode: TToken read FNameNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property ValueNode: TASTNode read FValueNode;
    property PortabilityDirectiveListNode: TListNode read FPortabilityDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TConstantListNode = class(TNonTerminalNode)
  private
    FOpenParenthesisNode: TToken;
    FItemListNode: TListNode;
    FCloseParenthesisNode: TToken;

  public
    constructor Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);

    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property ItemListNode: TListNode read FItemListNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
  end;

  TDirectiveNode = class(TNonTerminalNode)
  private
    FSemicolonNode: TToken;
    FKeywordNode: TToken;
    FValueNode: TASTNode;
    FDataNode: TASTNode;

  public
    constructor Create(ASemicolonNode: TToken; AKeywordNode: TToken; AValueNode: TASTNode; ADataNode: TASTNode);

    property SemicolonNode: TToken read FSemicolonNode;
    property KeywordNode: TToken read FKeywordNode;
    property ValueNode: TASTNode read FValueNode;
    property DataNode: TASTNode read FDataNode;
  end;

  TEnumeratedTypeElementNode = class(TNonTerminalNode)
  private
    FNameNode: TToken;
    FEqualSignNode: TToken;
    FValueNode: TASTNode;

  public
    constructor Create(ANameNode: TToken; AEqualSignNode: TToken; AValueNode: TASTNode);

    property NameNode: TToken read FNameNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property ValueNode: TASTNode read FValueNode;
  end;

  TEnumeratedTypeNode = class(TNonTerminalNode)
  private
    FOpenParenthesisNode: TToken;
    FItemListNode: TListNode;
    FCloseParenthesisNode: TToken;

  public
    constructor Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);

    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property ItemListNode: TListNode read FItemListNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
  end;

  TExceptionItemNode = class(TNonTerminalNode)
  private
    FOnSemikeywordNode: TToken;
    FNameNode: TToken;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FDoKeywordNode: TToken;
    FStatementNode: TASTNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AOnSemikeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);

    property OnSemikeywordNode: TToken read FOnSemikeywordNode;
    property NameNode: TToken read FNameNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TExportsItemNode = class(TNonTerminalNode)
  private
    FNameNode: TASTNode;
    FSpecifierListNode: TListNode;

  public
    constructor Create(ANameNode: TASTNode; ASpecifierListNode: TListNode);

    property NameNode: TASTNode read FNameNode;
    property SpecifierListNode: TListNode read FSpecifierListNode;
  end;

  TExportsSpecifierNode = class(TNonTerminalNode)
  private
    FKeywordNode: TToken;
    FValueNode: TASTNode;

  public
    constructor Create(AKeywordNode: TToken; AValueNode: TASTNode);

    property KeywordNode: TToken read FKeywordNode;
    property ValueNode: TASTNode read FValueNode;
  end;

  TExportsStatementNode = class(TNonTerminalNode)
  private
    FExportsKeywordNode: TToken;
    FItemListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AExportsKeywordNode: TToken; AItemListNode: TListNode; ASemicolonNode: TToken);

    property ExportsKeywordNode: TToken read FExportsKeywordNode;
    property ItemListNode: TListNode read FItemListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TFancyBlockNode = class(TNonTerminalNode)
  private
    FDeclListNode: TListNode;
    FBlockNode: TASTNode;

  public
    constructor Create(ADeclListNode: TListNode; ABlockNode: TASTNode);

    property DeclListNode: TListNode read FDeclListNode;
    property BlockNode: TASTNode read FBlockNode;
  end;

  TFieldDeclNode = class(TNonTerminalNode)
  private
    FNameListNode: TListNode;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FPortabilityDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);

    property NameListNode: TListNode read FNameListNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property PortabilityDirectiveListNode: TListNode read FPortabilityDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TFieldSectionNode = class(TNonTerminalNode)
  private
    FClassKeywordNode: TToken;
    FVarKeywordNode: TToken;
    FFieldListNode: TListNode;

  public
    constructor Create(AClassKeywordNode: TToken; AVarKeywordNode: TToken; AFieldListNode: TListNode);

    property ClassKeywordNode: TToken read FClassKeywordNode;
    property VarKeywordNode: TToken read FVarKeywordNode;
    property FieldListNode: TListNode read FFieldListNode;
  end;

  TFileTypeNode = class(TNonTerminalNode)
  private
    FFileKeywordNode: TToken;
    FOfKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(AFileKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);

    property FileKeywordNode: TToken read FFileKeywordNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TForInStatementNode = class(TNonTerminalNode)
  private
    FForKeywordNode: TToken;
    FLoopVariableNode: TToken;
    FInKeywordNode: TToken;
    FExpressionNode: TASTNode;
    FDoKeywordNode: TToken;
    FStatementNode: TASTNode;

  public
    constructor Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AInKeywordNode: TToken; AExpressionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);

    property ForKeywordNode: TToken read FForKeywordNode;
    property LoopVariableNode: TToken read FLoopVariableNode;
    property InKeywordNode: TToken read FInKeywordNode;
    property ExpressionNode: TASTNode read FExpressionNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

  TForStatementNode = class(TNonTerminalNode)
  private
    FForKeywordNode: TToken;
    FLoopVariableNode: TToken;
    FColonEqualsNode: TToken;
    FStartingValueNode: TASTNode;
    FDirectionNode: TToken;
    FEndingValueNode: TASTNode;
    FDoKeywordNode: TToken;
    FStatementNode: TASTNode;

  public
    constructor Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AColonEqualsNode: TToken; AStartingValueNode: TASTNode; ADirectionNode: TToken; AEndingValueNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);

    property ForKeywordNode: TToken read FForKeywordNode;
    property LoopVariableNode: TToken read FLoopVariableNode;
    property ColonEqualsNode: TToken read FColonEqualsNode;
    property StartingValueNode: TASTNode read FStartingValueNode;
    property DirectionNode: TToken read FDirectionNode;
    property EndingValueNode: TASTNode read FEndingValueNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

  TGotoStatementNode = class(TNonTerminalNode)
  private
    FGotoKeywordNode: TToken;
    FLabelIdNode: TToken;

  public
    constructor Create(AGotoKeywordNode: TToken; ALabelIdNode: TToken);

    property GotoKeywordNode: TToken read FGotoKeywordNode;
    property LabelIdNode: TToken read FLabelIdNode;
  end;

  TIfStatementNode = class(TNonTerminalNode)
  private
    FIfKeywordNode: TToken;
    FConditionNode: TASTNode;
    FThenKeywordNode: TToken;
    FThenStatementNode: TASTNode;
    FElseKeywordNode: TToken;
    FElseStatementNode: TASTNode;

  public
    constructor Create(AIfKeywordNode: TToken; AConditionNode: TASTNode; AThenKeywordNode: TToken; AThenStatementNode: TASTNode; AElseKeywordNode: TToken; AElseStatementNode: TASTNode);

    property IfKeywordNode: TToken read FIfKeywordNode;
    property ConditionNode: TASTNode read FConditionNode;
    property ThenKeywordNode: TToken read FThenKeywordNode;
    property ThenStatementNode: TASTNode read FThenStatementNode;
    property ElseKeywordNode: TToken read FElseKeywordNode;
    property ElseStatementNode: TASTNode read FElseStatementNode;
  end;

  TInitSectionNode = class(TNonTerminalNode)
  private
    FInitializationKeywordNode: TToken;
    FInitializationStatementListNode: TListNode;
    FFinalizationKeywordNode: TToken;
    FFinalizationStatementListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(AInitializationKeywordNode: TToken; AInitializationStatementListNode: TListNode; AFinalizationKeywordNode: TToken; AFinalizationStatementListNode: TListNode; AEndKeywordNode: TToken);

    property InitializationKeywordNode: TToken read FInitializationKeywordNode;
    property InitializationStatementListNode: TListNode read FInitializationStatementListNode;
    property FinalizationKeywordNode: TToken read FFinalizationKeywordNode;
    property FinalizationStatementListNode: TListNode read FFinalizationStatementListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TInterfaceTypeNode = class(TNonTerminalNode)
  private
    FInterfaceKeywordNode: TToken;
    FOpenParenthesisNode: TToken;
    FBaseInterfaceNode: TASTNode;
    FCloseParenthesisNode: TToken;
    FOpenBracketNode: TToken;
    FGuidNode: TASTNode;
    FCloseBracketNode: TToken;
    FMethodAndPropertyListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(AInterfaceKeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseInterfaceNode: TASTNode; ACloseParenthesisNode: TToken; AOpenBracketNode: TToken; AGuidNode: TASTNode; ACloseBracketNode: TToken; AMethodAndPropertyListNode: TListNode; AEndKeywordNode: TToken);

    property InterfaceKeywordNode: TToken read FInterfaceKeywordNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property BaseInterfaceNode: TASTNode read FBaseInterfaceNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property OpenBracketNode: TToken read FOpenBracketNode;
    property GuidNode: TASTNode read FGuidNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
    property MethodAndPropertyListNode: TListNode read FMethodAndPropertyListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TLabelDeclSectionNode = class(TNonTerminalNode)
  private
    FLabelKeywordNode: TToken;
    FLabelListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ALabelKeywordNode: TToken; ALabelListNode: TListNode; ASemicolonNode: TToken);

    property LabelKeywordNode: TToken read FLabelKeywordNode;
    property LabelListNode: TListNode read FLabelListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TLabeledStatementNode = class(TNonTerminalNode)
  private
    FLabelIdNode: TToken;
    FColonNode: TToken;
    FStatementNode: TASTNode;

  public
    constructor Create(ALabelIdNode: TToken; AColonNode: TToken; AStatementNode: TASTNode);

    property LabelIdNode: TToken read FLabelIdNode;
    property ColonNode: TToken read FColonNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

  TMethodHeadingNode = class(TNonTerminalNode)
  private
    FClassKeywordNode: TToken;
    FMethodTypeNode: TToken;
    FNameNode: TASTNode;
    FOpenParenthesisNode: TToken;
    FParameterListNode: TListNode;
    FCloseParenthesisNode: TToken;
    FColonNode: TToken;
    FReturnTypeNode: TASTNode;
    FDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AClassKeywordNode: TToken; AMethodTypeNode: TToken; ANameNode: TASTNode; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);

    property ClassKeywordNode: TToken read FClassKeywordNode;
    property MethodTypeNode: TToken read FMethodTypeNode;
    property NameNode: TASTNode read FNameNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property ParameterListNode: TListNode read FParameterListNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property ColonNode: TToken read FColonNode;
    property ReturnTypeNode: TASTNode read FReturnTypeNode;
    property DirectiveListNode: TListNode read FDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TMethodImplementationNode = class(TNonTerminalNode)
  private
    FMethodHeadingNode: TMethodHeadingNode;
    FFancyBlockNode: TFancyBlockNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AMethodHeadingNode: TMethodHeadingNode; AFancyBlockNode: TFancyBlockNode; ASemicolonNode: TToken);

    property MethodHeadingNode: TMethodHeadingNode read FMethodHeadingNode;
    property FancyBlockNode: TFancyBlockNode read FFancyBlockNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TMethodResolutionNode = class(TNonTerminalNode)
  private
    FMethodTypeNode: TToken;
    FInterfaceMethodNode: TASTNode;
    FEqualSignNode: TToken;
    FImplementationMethodNode: TToken;
    FSemicolonNode: TToken;

  public
    constructor Create(AMethodTypeNode: TToken; AInterfaceMethodNode: TASTNode; AEqualSignNode: TToken; AImplementationMethodNode: TToken; ASemicolonNode: TToken);

    property MethodTypeNode: TToken read FMethodTypeNode;
    property InterfaceMethodNode: TASTNode read FInterfaceMethodNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property ImplementationMethodNode: TToken read FImplementationMethodNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TNumberFormatNode = class(TNonTerminalNode)
  private
    FValueNode: TASTNode;
    FSizeColonNode: TToken;
    FSizeNode: TASTNode;
    FPrecisionColonNode: TToken;
    FPrecisionNode: TASTNode;

  public
    constructor Create(AValueNode: TASTNode; ASizeColonNode: TToken; ASizeNode: TASTNode; APrecisionColonNode: TToken; APrecisionNode: TASTNode);

    property ValueNode: TASTNode read FValueNode;
    property SizeColonNode: TToken read FSizeColonNode;
    property SizeNode: TASTNode read FSizeNode;
    property PrecisionColonNode: TToken read FPrecisionColonNode;
    property PrecisionNode: TASTNode read FPrecisionNode;
  end;

  TOpenArrayNode = class(TNonTerminalNode)
  private
    FArrayKeywordNode: TToken;
    FOfKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(AArrayKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);

    property ArrayKeywordNode: TToken read FArrayKeywordNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TPackageNode = class(TNonTerminalNode)
  private
    FPackageKeywordNode: TToken;
    FNameNode: TASTNode;
    FSemicolonNode: TToken;
    FRequiresClauseNode: TRequiresClauseNode;
    FContainsClauseNode: TUsesClauseNode;
    FAttributeListNode: TListNode;
    FEndKeywordNode: TToken;
    FDotNode: TToken;

  public
    constructor Create(APackageKeywordNode: TToken; ANameNode: TASTNode; ASemicolonNode: TToken; ARequiresClauseNode: TRequiresClauseNode; AContainsClauseNode: TUsesClauseNode; AAttributeListNode: TListNode; AEndKeywordNode: TToken; ADotNode: TToken);

    property PackageKeywordNode: TToken read FPackageKeywordNode;
    property NameNode: TASTNode read FNameNode;
    property SemicolonNode: TToken read FSemicolonNode;
    property RequiresClauseNode: TRequiresClauseNode read FRequiresClauseNode;
    property ContainsClauseNode: TUsesClauseNode read FContainsClauseNode;
    property AttributeListNode: TListNode read FAttributeListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
    property DotNode: TToken read FDotNode;
  end;

  TPackedTypeNode = class(TNonTerminalNode)
  private
    FPackedKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(APackedKeywordNode: TToken; ATypeNode: TASTNode);

    property PackedKeywordNode: TToken read FPackedKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TParameterNode = class(TNonTerminalNode)
  private
    FModifierNode: TToken;
    FNameListNode: TListNode;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FEqualSignNode: TToken;
    FDefaultValueNode: TASTNode;

  public
    constructor Create(AModifierNode: TToken; ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; ADefaultValueNode: TASTNode);

    property ModifierNode: TToken read FModifierNode;
    property NameListNode: TListNode read FNameListNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property DefaultValueNode: TASTNode read FDefaultValueNode;
  end;

  TParameterizedNode = class(TNonTerminalNode)
  private
    FLeftNode: TASTNode;
    FOpenDelimiterNode: TToken;
    FParameterListNode: TListNode;
    FCloseDelimiterNode: TToken;

  public
    constructor Create(ALeftNode: TASTNode; AOpenDelimiterNode: TToken; AParameterListNode: TListNode; ACloseDelimiterNode: TToken);

    property LeftNode: TASTNode read FLeftNode;
    property OpenDelimiterNode: TToken read FOpenDelimiterNode;
    property ParameterListNode: TListNode read FParameterListNode;
    property CloseDelimiterNode: TToken read FCloseDelimiterNode;
  end;

  TParenthesizedExpressionNode = class(TNonTerminalNode)
  private
    FOpenParenthesisNode: TToken;
    FExpressionNode: TASTNode;
    FCloseParenthesisNode: TToken;

  public
    constructor Create(AOpenParenthesisNode: TToken; AExpressionNode: TASTNode; ACloseParenthesisNode: TToken);

    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property ExpressionNode: TASTNode read FExpressionNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
  end;

  TPointerDereferenceNode = class(TNonTerminalNode)
  private
    FOperandNode: TASTNode;
    FCaretNode: TToken;

  public
    constructor Create(AOperandNode: TASTNode; ACaretNode: TToken);

    property OperandNode: TASTNode read FOperandNode;
    property CaretNode: TToken read FCaretNode;
  end;

  TPointerTypeNode = class(TNonTerminalNode)
  private
    FCaretNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(ACaretNode: TToken; ATypeNode: TASTNode);

    property CaretNode: TToken read FCaretNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TProcedureTypeNode = class(TNonTerminalNode)
  private
    FMethodTypeNode: TToken;
    FOpenParenthesisNode: TToken;
    FParameterListNode: TListNode;
    FCloseParenthesisNode: TToken;
    FColonNode: TToken;
    FReturnTypeNode: TASTNode;
    FFirstDirectiveListNode: TListNode;
    FOfKeywordNode: TToken;
    FObjectKeywordNode: TToken;
    FSecondDirectiveListNode: TListNode;

  public
    constructor Create(AMethodTypeNode: TToken; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; AFirstDirectiveListNode: TListNode; AOfKeywordNode: TToken; AObjectKeywordNode: TToken; ASecondDirectiveListNode: TListNode);

    property MethodTypeNode: TToken read FMethodTypeNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property ParameterListNode: TListNode read FParameterListNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property ColonNode: TToken read FColonNode;
    property ReturnTypeNode: TASTNode read FReturnTypeNode;
    property FirstDirectiveListNode: TListNode read FFirstDirectiveListNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property ObjectKeywordNode: TToken read FObjectKeywordNode;
    property SecondDirectiveListNode: TListNode read FSecondDirectiveListNode;
  end;

  TProgramNode = class(TNonTerminalNode)
  private
    FProgramKeywordNode: TToken;
    FNameNode: TToken;
    FNoiseOpenParenthesisNode: TToken;
    FNoiseContentListNode: TListNode;
    FNoiseCloseParenthesisNode: TToken;
    FSemicolonNode: TToken;
    FUsesClauseNode: TUsesClauseNode;
    FDeclarationListNode: TListNode;
    FInitSectionNode: TInitSectionNode;
    FDotNode: TToken;

  public
    constructor Create(AProgramKeywordNode: TToken; ANameNode: TToken; ANoiseOpenParenthesisNode: TToken; ANoiseContentListNode: TListNode; ANoiseCloseParenthesisNode: TToken; ASemicolonNode: TToken; AUsesClauseNode: TUsesClauseNode; ADeclarationListNode: TListNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);

    property ProgramKeywordNode: TToken read FProgramKeywordNode;
    property NameNode: TToken read FNameNode;
    property NoiseOpenParenthesisNode: TToken read FNoiseOpenParenthesisNode;
    property NoiseContentListNode: TListNode read FNoiseContentListNode;
    property NoiseCloseParenthesisNode: TToken read FNoiseCloseParenthesisNode;
    property SemicolonNode: TToken read FSemicolonNode;
    property UsesClauseNode: TUsesClauseNode read FUsesClauseNode;
    property DeclarationListNode: TListNode read FDeclarationListNode;
    property InitSectionNode: TInitSectionNode read FInitSectionNode;
    property DotNode: TToken read FDotNode;
  end;

  TPropertyNode = class(TNonTerminalNode)
  private
    FClassKeywordNode: TToken;
    FPropertyKeywordNode: TToken;
    FNameNode: TToken;
    FOpenBracketNode: TToken;
    FParameterListNode: TListNode;
    FCloseBracketNode: TToken;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AClassKeywordNode: TToken; APropertyKeywordNode: TToken; ANameNode: TToken; AOpenBracketNode: TToken; AParameterListNode: TListNode; ACloseBracketNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);

    property ClassKeywordNode: TToken read FClassKeywordNode;
    property PropertyKeywordNode: TToken read FPropertyKeywordNode;
    property NameNode: TToken read FNameNode;
    property OpenBracketNode: TToken read FOpenBracketNode;
    property ParameterListNode: TListNode read FParameterListNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property DirectiveListNode: TListNode read FDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TRaiseStatementNode = class(TNonTerminalNode)
  private
    FRaiseKeywordNode: TToken;
    FExceptionNode: TASTNode;
    FAtSemikeywordNode: TToken;
    FAddressNode: TASTNode;

  public
    constructor Create(ARaiseKeywordNode: TToken; AExceptionNode: TASTNode; AAtSemikeywordNode: TToken; AAddressNode: TASTNode);

    property RaiseKeywordNode: TToken read FRaiseKeywordNode;
    property ExceptionNode: TASTNode read FExceptionNode;
    property AtSemikeywordNode: TToken read FAtSemikeywordNode;
    property AddressNode: TASTNode read FAddressNode;
  end;

  TRecordFieldConstantNode = class(TNonTerminalNode)
  private
    FNameNode: TASTNode;
    FColonNode: TToken;
    FValueNode: TASTNode;

  public
    constructor Create(ANameNode: TASTNode; AColonNode: TToken; AValueNode: TASTNode);

    property NameNode: TASTNode read FNameNode;
    property ColonNode: TToken read FColonNode;
    property ValueNode: TASTNode read FValueNode;
  end;

  TRecordTypeNode = class(TNonTerminalNode)
  private
    FRecordKeywordNode: TToken;
    FContentListNode: TListNode;
    FVariantSectionNode: TVariantSectionNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ARecordKeywordNode: TToken; AContentListNode: TListNode; AVariantSectionNode: TVariantSectionNode; AEndKeywordNode: TToken);

    property RecordKeywordNode: TToken read FRecordKeywordNode;
    property ContentListNode: TListNode read FContentListNode;
    property VariantSectionNode: TVariantSectionNode read FVariantSectionNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TRepeatStatementNode = class(TNonTerminalNode)
  private
    FRepeatKeywordNode: TToken;
    FStatementListNode: TListNode;
    FUntilKeywordNode: TToken;
    FConditionNode: TASTNode;

  public
    constructor Create(ARepeatKeywordNode: TToken; AStatementListNode: TListNode; AUntilKeywordNode: TToken; AConditionNode: TASTNode);

    property RepeatKeywordNode: TToken read FRepeatKeywordNode;
    property StatementListNode: TListNode read FStatementListNode;
    property UntilKeywordNode: TToken read FUntilKeywordNode;
    property ConditionNode: TASTNode read FConditionNode;
  end;

  TRequiresClauseNode = class(TNonTerminalNode)
  private
    FRequiresSemikeywordNode: TToken;
    FPackageListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ARequiresSemikeywordNode: TToken; APackageListNode: TListNode; ASemicolonNode: TToken);

    property RequiresSemikeywordNode: TToken read FRequiresSemikeywordNode;
    property PackageListNode: TListNode read FPackageListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TSetLiteralNode = class(TNonTerminalNode)
  private
    FOpenBracketNode: TToken;
    FItemListNode: TListNode;
    FCloseBracketNode: TToken;

  public
    constructor Create(AOpenBracketNode: TToken; AItemListNode: TListNode; ACloseBracketNode: TToken);

    property OpenBracketNode: TToken read FOpenBracketNode;
    property ItemListNode: TListNode read FItemListNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
  end;

  TSetOfNode = class(TNonTerminalNode)
  private
    FSetKeywordNode: TToken;
    FOfKeywordNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(ASetKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);

    property SetKeywordNode: TToken read FSetKeywordNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
  end;

  TStringOfLengthNode = class(TNonTerminalNode)
  private
    FStringKeywordNode: TToken;
    FOpenBracketNode: TToken;
    FLengthNode: TASTNode;
    FCloseBracketNode: TToken;

  public
    constructor Create(AStringKeywordNode: TToken; AOpenBracketNode: TToken; ALengthNode: TASTNode; ACloseBracketNode: TToken);

    property StringKeywordNode: TToken read FStringKeywordNode;
    property OpenBracketNode: TToken read FOpenBracketNode;
    property LengthNode: TASTNode read FLengthNode;
    property CloseBracketNode: TToken read FCloseBracketNode;
  end;

  TTryExceptNode = class(TNonTerminalNode)
  private
    FTryKeywordNode: TToken;
    FTryStatementListNode: TListNode;
    FExceptKeywordNode: TToken;
    FExceptionItemListNode: TListNode;
    FElseKeywordNode: TToken;
    FElseStatementListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AExceptKeywordNode: TToken; AExceptionItemListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);

    property TryKeywordNode: TToken read FTryKeywordNode;
    property TryStatementListNode: TListNode read FTryStatementListNode;
    property ExceptKeywordNode: TToken read FExceptKeywordNode;
    property ExceptionItemListNode: TListNode read FExceptionItemListNode;
    property ElseKeywordNode: TToken read FElseKeywordNode;
    property ElseStatementListNode: TListNode read FElseStatementListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TTryFinallyNode = class(TNonTerminalNode)
  private
    FTryKeywordNode: TToken;
    FTryStatementListNode: TListNode;
    FFinallyKeywordNode: TToken;
    FFinallyStatementListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AFinallyKeywordNode: TToken; AFinallyStatementListNode: TListNode; AEndKeywordNode: TToken);

    property TryKeywordNode: TToken read FTryKeywordNode;
    property TryStatementListNode: TListNode read FTryStatementListNode;
    property FinallyKeywordNode: TToken read FFinallyKeywordNode;
    property FinallyStatementListNode: TListNode read FFinallyStatementListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TTypeDeclNode = class(TNonTerminalNode)
  private
    FNameNode: TToken;
    FEqualSignNode: TToken;
    FTypeKeywordNode: TToken;
    FTypeNode: TASTNode;
    FPortabilityDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeKeywordNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);

    property NameNode: TToken read FNameNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property TypeKeywordNode: TToken read FTypeKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
    property PortabilityDirectiveListNode: TListNode read FPortabilityDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TTypeForwardDeclarationNode = class(TNonTerminalNode)
  private
    FNameNode: TToken;
    FEqualSignNode: TToken;
    FTypeNode: TToken;
    FSemicolonNode: TToken;

  public
    constructor Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeNode: TToken; ASemicolonNode: TToken);

    property NameNode: TToken read FNameNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property TypeNode: TToken read FTypeNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TTypeHelperNode = class(TNonTerminalNode)
  private
    FTypeKeywordNode: TToken;
    FHelperSemikeywordNode: TToken;
    FOpenParenthesisNode: TToken;
    FBaseHelperTypeNode: TASTNode;
    FCloseParenthesisNode: TToken;
    FForKeywordNode: TToken;
    FTypeNode: TASTNode;
    FContentListNode: TListNode;
    FEndKeywordNode: TToken;

  public
    constructor Create(ATypeKeywordNode: TToken; AHelperSemikeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseHelperTypeNode: TASTNode; ACloseParenthesisNode: TToken; AForKeywordNode: TToken; ATypeNode: TASTNode; AContentListNode: TListNode; AEndKeywordNode: TToken);

    property TypeKeywordNode: TToken read FTypeKeywordNode;
    property HelperSemikeywordNode: TToken read FHelperSemikeywordNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property BaseHelperTypeNode: TASTNode read FBaseHelperTypeNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property ForKeywordNode: TToken read FForKeywordNode;
    property TypeNode: TASTNode read FTypeNode;
    property ContentListNode: TListNode read FContentListNode;
    property EndKeywordNode: TToken read FEndKeywordNode;
  end;

  TTypeSectionNode = class(TNonTerminalNode)
  private
    FTypeKeywordNode: TToken;
    FTypeListNode: TListNode;

  public
    constructor Create(ATypeKeywordNode: TToken; ATypeListNode: TListNode);

    property TypeKeywordNode: TToken read FTypeKeywordNode;
    property TypeListNode: TListNode read FTypeListNode;
  end;

  TUnaryOperationNode = class(TNonTerminalNode)
  private
    FOperatorNode: TToken;
    FOperandNode: TASTNode;

  public
    constructor Create(AOperatorNode: TToken; AOperandNode: TASTNode);

    property OperatorNode: TToken read FOperatorNode;
    property OperandNode: TASTNode read FOperandNode;
  end;

  TUnitNode = class(TNonTerminalNode)
  private
    FUnitKeywordNode: TToken;
    FUnitNameNode: TToken;
    FPortabilityDirectiveListNode: TListNode;
    FSemicolonNode: TToken;
    FInterfaceSectionNode: TUnitSectionNode;
    FImplementationSectionNode: TUnitSectionNode;
    FInitSectionNode: TInitSectionNode;
    FDotNode: TToken;

  public
    constructor Create(AUnitKeywordNode: TToken; AUnitNameNode: TToken; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken; AInterfaceSectionNode: TUnitSectionNode; AImplementationSectionNode: TUnitSectionNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);

    property UnitKeywordNode: TToken read FUnitKeywordNode;
    property UnitNameNode: TToken read FUnitNameNode;
    property PortabilityDirectiveListNode: TListNode read FPortabilityDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
    property InterfaceSectionNode: TUnitSectionNode read FInterfaceSectionNode;
    property ImplementationSectionNode: TUnitSectionNode read FImplementationSectionNode;
    property InitSectionNode: TInitSectionNode read FInitSectionNode;
    property DotNode: TToken read FDotNode;
  end;

  TUnitSectionNode = class(TNonTerminalNode)
  private
    FHeaderKeywordNode: TToken;
    FUsesClauseNode: TUsesClauseNode;
    FContentListNode: TListNode;

  public
    constructor Create(AHeaderKeywordNode: TToken; AUsesClauseNode: TUsesClauseNode; AContentListNode: TListNode);

    property HeaderKeywordNode: TToken read FHeaderKeywordNode;
    property UsesClauseNode: TUsesClauseNode read FUsesClauseNode;
    property ContentListNode: TListNode read FContentListNode;
  end;

  TUsedUnitNode = class(TNonTerminalNode)
  private
    FNameNode: TASTNode;
    FInKeywordNode: TToken;
    FFileNameNode: TToken;

  public
    constructor Create(ANameNode: TASTNode; AInKeywordNode: TToken; AFileNameNode: TToken);

    property NameNode: TASTNode read FNameNode;
    property InKeywordNode: TToken read FInKeywordNode;
    property FileNameNode: TToken read FFileNameNode;
  end;

  TUsesClauseNode = class(TNonTerminalNode)
  private
    FUsesKeywordNode: TToken;
    FUnitListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AUsesKeywordNode: TToken; AUnitListNode: TListNode; ASemicolonNode: TToken);

    property UsesKeywordNode: TToken read FUsesKeywordNode;
    property UnitListNode: TListNode read FUnitListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TVarDeclNode = class(TNonTerminalNode)
  private
    FNameListNode: TListNode;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FFirstPortabilityDirectiveListNode: TListNode;
    FAbsoluteSemikeywordNode: TToken;
    FAbsoluteAddressNode: TASTNode;
    FEqualSignNode: TToken;
    FValueNode: TASTNode;
    FSecondPortabilityDirectiveListNode: TListNode;
    FSemicolonNode: TToken;

  public
    constructor Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AFirstPortabilityDirectiveListNode: TListNode; AAbsoluteSemikeywordNode: TToken; AAbsoluteAddressNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; ASecondPortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);

    property NameListNode: TListNode read FNameListNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property FirstPortabilityDirectiveListNode: TListNode read FFirstPortabilityDirectiveListNode;
    property AbsoluteSemikeywordNode: TToken read FAbsoluteSemikeywordNode;
    property AbsoluteAddressNode: TASTNode read FAbsoluteAddressNode;
    property EqualSignNode: TToken read FEqualSignNode;
    property ValueNode: TASTNode read FValueNode;
    property SecondPortabilityDirectiveListNode: TListNode read FSecondPortabilityDirectiveListNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TVarSectionNode = class(TNonTerminalNode)
  private
    FVarKeywordNode: TToken;
    FVarListNode: TListNode;

  public
    constructor Create(AVarKeywordNode: TToken; AVarListNode: TListNode);

    property VarKeywordNode: TToken read FVarKeywordNode;
    property VarListNode: TListNode read FVarListNode;
  end;

  TVariantGroupNode = class(TNonTerminalNode)
  private
    FValueListNode: TListNode;
    FColonNode: TToken;
    FOpenParenthesisNode: TToken;
    FFieldDeclListNode: TListNode;
    FVariantSectionNode: TVariantSectionNode;
    FCloseParenthesisNode: TToken;
    FSemicolonNode: TToken;

  public
    constructor Create(AValueListNode: TListNode; AColonNode: TToken; AOpenParenthesisNode: TToken; AFieldDeclListNode: TListNode; AVariantSectionNode: TVariantSectionNode; ACloseParenthesisNode: TToken; ASemicolonNode: TToken);

    property ValueListNode: TListNode read FValueListNode;
    property ColonNode: TToken read FColonNode;
    property OpenParenthesisNode: TToken read FOpenParenthesisNode;
    property FieldDeclListNode: TListNode read FFieldDeclListNode;
    property VariantSectionNode: TVariantSectionNode read FVariantSectionNode;
    property CloseParenthesisNode: TToken read FCloseParenthesisNode;
    property SemicolonNode: TToken read FSemicolonNode;
  end;

  TVariantSectionNode = class(TNonTerminalNode)
  private
    FCaseKeywordNode: TToken;
    FNameNode: TToken;
    FColonNode: TToken;
    FTypeNode: TASTNode;
    FOfKeywordNode: TToken;
    FVariantGroupListNode: TListNode;

  public
    constructor Create(ACaseKeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AOfKeywordNode: TToken; AVariantGroupListNode: TListNode);

    property CaseKeywordNode: TToken read FCaseKeywordNode;
    property NameNode: TToken read FNameNode;
    property ColonNode: TToken read FColonNode;
    property TypeNode: TASTNode read FTypeNode;
    property OfKeywordNode: TToken read FOfKeywordNode;
    property VariantGroupListNode: TListNode read FVariantGroupListNode;
  end;

  TVisibilityNode = class(TNonTerminalNode)
  private
    FStrictSemikeywordNode: TToken;
    FVisibilityKeywordNode: TToken;

  public
    constructor Create(AStrictSemikeywordNode: TToken; AVisibilityKeywordNode: TToken);

    property StrictSemikeywordNode: TToken read FStrictSemikeywordNode;
    property VisibilityKeywordNode: TToken read FVisibilityKeywordNode;
  end;

  TVisibilitySectionNode = class(TNonTerminalNode)
  private
    FVisibilityNode: TVisibilityNode;
    FContentListNode: TListNode;

  public
    constructor Create(AVisibilityNode: TVisibilityNode; AContentListNode: TListNode);

    property VisibilityNode: TVisibilityNode read FVisibilityNode;
    property ContentListNode: TListNode read FContentListNode;
  end;

  TWhileStatementNode = class(TNonTerminalNode)
  private
    FWhileKeywordNode: TToken;
    FConditionNode: TASTNode;
    FDoKeywordNode: TToken;
    FStatementNode: TASTNode;

  public
    constructor Create(AWhileKeywordNode: TToken; AConditionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);

    property WhileKeywordNode: TToken read FWhileKeywordNode;
    property ConditionNode: TASTNode read FConditionNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

  TWithStatementNode = class(TNonTerminalNode)
  private
    FWithKeywordNode: TToken;
    FExpressionListNode: TListNode;
    FDoKeywordNode: TToken;
    FStatementNode: TASTNode;

  public
    constructor Create(AWithKeywordNode: TToken; AExpressionListNode: TListNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);

    property WithKeywordNode: TToken read FWithKeywordNode;
    property ExpressionListNode: TListNode read FExpressionListNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

implementation

{ TArrayTypeNode }

constructor TArrayTypeNode.Create(AArrayKeywordNode: TToken; AOpenBracketNode: TToken; AIndexListNode: TListNode; ACloseBracketNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FArrayKeywordNode := AArrayKeywordNode;
  FOpenBracketNode := AOpenBracketNode;
  FIndexListNode := AIndexListNode;
  FCloseBracketNode := ACloseBracketNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(AArrayKeywordNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AIndexListNode);
  FChildNodes.Add(ACloseBracketNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('ArrayKeywordNode', AArrayKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('IndexListNode', AIndexListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TAssemblerStatementNode }

constructor TAssemblerStatementNode.Create(AAsmKeywordNode: TToken; AEndKeywordNode: TToken);
begin
  inherited Create;
  FAsmKeywordNode := AAsmKeywordNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(AAsmKeywordNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('AsmKeywordNode', AAsmKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TAttributeNode }

constructor TAttributeNode.Create(AOpenBracketNode: TToken; AScopeNode: TToken; AColonNode: TToken; AValueNode: TASTNode; ACloseBracketNode: TToken);
begin
  inherited Create;
  FOpenBracketNode := AOpenBracketNode;
  FScopeNode := AScopeNode;
  FColonNode := AColonNode;
  FValueNode := AValueNode;
  FCloseBracketNode := ACloseBracketNode;

  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AScopeNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ACloseBracketNode);

  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('ScopeNode', AScopeNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TBinaryOperationNode }

constructor TBinaryOperationNode.Create(ALeftNode: TASTNode; AOperatorNode: TToken; ARightNode: TASTNode);
begin
  inherited Create;
  FLeftNode := ALeftNode;
  FOperatorNode := AOperatorNode;
  FRightNode := ARightNode;

  FChildNodes.Add(ALeftNode);
  FChildNodes.Add(AOperatorNode);
  FChildNodes.Add(ARightNode);

  FProperties.Add(TASTNode.TProperty.Create('LeftNode', ALeftNode));
  FProperties.Add(TASTNode.TProperty.Create('OperatorNode', AOperatorNode));
  FProperties.Add(TASTNode.TProperty.Create('RightNode', ARightNode));
end;

{ TBlockNode }

constructor TBlockNode.Create(ABeginKeywordNode: TToken; AStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FBeginKeywordNode := ABeginKeywordNode;
  FStatementListNode := AStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ABeginKeywordNode);
  FChildNodes.Add(AStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('BeginKeywordNode', ABeginKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementListNode', AStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TCaseSelectorNode }

constructor TCaseSelectorNode.Create(AValueListNode: TListNode; AColonNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FValueListNode := AValueListNode;
  FColonNode := AColonNode;
  FStatementNode := AStatementNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AValueListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AStatementNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('ValueListNode', AValueListNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TCaseStatementNode }

constructor TCaseStatementNode.Create(ACaseKeywordNode: TToken; AExpressionNode: TASTNode; AOfKeywordNode: TToken; ASelectorListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FCaseKeywordNode := ACaseKeywordNode;
  FExpressionNode := AExpressionNode;
  FOfKeywordNode := AOfKeywordNode;
  FSelectorListNode := ASelectorListNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementListNode := AElseStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ACaseKeywordNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ASelectorListNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('CaseKeywordNode', ACaseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('SelectorListNode', ASelectorListNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseStatementListNode', AElseStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TClassOfNode }

constructor TClassOfNode.Create(AClassKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FClassKeywordNode := AClassKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TClassTypeNode }

constructor TClassTypeNode.Create(AClassKeywordNode: TToken; ADispositionNode: TToken; AOpenParenthesisNode: TToken; AInheritanceListNode: TListNode; ACloseParenthesisNode: TToken; AContentListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FClassKeywordNode := AClassKeywordNode;
  FDispositionNode := ADispositionNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FInheritanceListNode := AInheritanceListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FContentListNode := AContentListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(ADispositionNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AInheritanceListNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('DispositionNode', ADispositionNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('InheritanceListNode', AInheritanceListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TConstSectionNode }

constructor TConstSectionNode.Create(AConstKeywordNode: TToken; AConstListNode: TListNode);
begin
  inherited Create;
  FConstKeywordNode := AConstKeywordNode;
  FConstListNode := AConstListNode;

  FChildNodes.Add(AConstKeywordNode);
  FChildNodes.Add(AConstListNode);

  FProperties.Add(TASTNode.TProperty.Create('ConstKeywordNode', AConstKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ConstListNode', AConstListNode));
end;

{ TConstantDeclNode }

constructor TConstantDeclNode.Create(ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FEqualSignNode := AEqualSignNode;
  FValueNode := AValueNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNode.TProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TConstantListNode }

constructor TConstantListNode.Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FItemListNode := AItemListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseParenthesisNode);

  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TDirectiveNode }

constructor TDirectiveNode.Create(ASemicolonNode: TToken; AKeywordNode: TToken; AValueNode: TASTNode; ADataNode: TASTNode);
begin
  inherited Create;
  FSemicolonNode := ASemicolonNode;
  FKeywordNode := AKeywordNode;
  FValueNode := AValueNode;
  FDataNode := ADataNode;

  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(AKeywordNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ADataNode);

  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNode.TProperty.Create('KeywordNode', AKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNode.TProperty.Create('DataNode', ADataNode));
end;

{ TEnumeratedTypeElementNode }

constructor TEnumeratedTypeElementNode.Create(ANameNode: TToken; AEqualSignNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FValueNode := AValueNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AValueNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
end;

{ TEnumeratedTypeNode }

constructor TEnumeratedTypeNode.Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FItemListNode := AItemListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseParenthesisNode);

  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TExceptionItemNode }

constructor TExceptionItemNode.Create(AOnSemikeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FOnSemikeywordNode := AOnSemikeywordNode;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AOnSemikeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('OnSemikeywordNode', AOnSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TExportsItemNode }

constructor TExportsItemNode.Create(ANameNode: TASTNode; ASpecifierListNode: TListNode);
begin
  inherited Create;
  FNameNode := ANameNode;
  FSpecifierListNode := ASpecifierListNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(ASpecifierListNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('SpecifierListNode', ASpecifierListNode));
end;

{ TExportsSpecifierNode }

constructor TExportsSpecifierNode.Create(AKeywordNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;
  FKeywordNode := AKeywordNode;
  FValueNode := AValueNode;

  FChildNodes.Add(AKeywordNode);
  FChildNodes.Add(AValueNode);

  FProperties.Add(TASTNode.TProperty.Create('KeywordNode', AKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
end;

{ TExportsStatementNode }

constructor TExportsStatementNode.Create(AExportsKeywordNode: TToken; AItemListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FExportsKeywordNode := AExportsKeywordNode;
  FItemListNode := AItemListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AExportsKeywordNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('ExportsKeywordNode', AExportsKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TFancyBlockNode }

constructor TFancyBlockNode.Create(ADeclListNode: TListNode; ABlockNode: TASTNode);
begin
  inherited Create;
  FDeclListNode := ADeclListNode;
  FBlockNode := ABlockNode;

  FChildNodes.Add(ADeclListNode);
  FChildNodes.Add(ABlockNode);

  FProperties.Add(TASTNode.TProperty.Create('DeclListNode', ADeclListNode));
  FProperties.Add(TASTNode.TProperty.Create('BlockNode', ABlockNode));
end;

{ TFieldDeclNode }

constructor TFieldDeclNode.Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FNameListNode := ANameListNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ANameListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TFieldSectionNode }

constructor TFieldSectionNode.Create(AClassKeywordNode: TToken; AVarKeywordNode: TToken; AFieldListNode: TListNode);
begin
  inherited Create;
  FClassKeywordNode := AClassKeywordNode;
  FVarKeywordNode := AVarKeywordNode;
  FFieldListNode := AFieldListNode;

  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(AVarKeywordNode);
  FChildNodes.Add(AFieldListNode);

  FProperties.Add(TASTNode.TProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('VarKeywordNode', AVarKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('FieldListNode', AFieldListNode));
end;

{ TFileTypeNode }

constructor TFileTypeNode.Create(AFileKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FFileKeywordNode := AFileKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(AFileKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('FileKeywordNode', AFileKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TForInStatementNode }

constructor TForInStatementNode.Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AInKeywordNode: TToken; AExpressionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;
  FForKeywordNode := AForKeywordNode;
  FLoopVariableNode := ALoopVariableNode;
  FInKeywordNode := AInKeywordNode;
  FExpressionNode := AExpressionNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ALoopVariableNode);
  FChildNodes.Add(AInKeywordNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('LoopVariableNode', ALoopVariableNode));
  FProperties.Add(TASTNode.TProperty.Create('InKeywordNode', AInKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNode.TProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
end;

{ TForStatementNode }

constructor TForStatementNode.Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AColonEqualsNode: TToken; AStartingValueNode: TASTNode; ADirectionNode: TToken; AEndingValueNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;
  FForKeywordNode := AForKeywordNode;
  FLoopVariableNode := ALoopVariableNode;
  FColonEqualsNode := AColonEqualsNode;
  FStartingValueNode := AStartingValueNode;
  FDirectionNode := ADirectionNode;
  FEndingValueNode := AEndingValueNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ALoopVariableNode);
  FChildNodes.Add(AColonEqualsNode);
  FChildNodes.Add(AStartingValueNode);
  FChildNodes.Add(ADirectionNode);
  FChildNodes.Add(AEndingValueNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('LoopVariableNode', ALoopVariableNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonEqualsNode', AColonEqualsNode));
  FProperties.Add(TASTNode.TProperty.Create('StartingValueNode', AStartingValueNode));
  FProperties.Add(TASTNode.TProperty.Create('DirectionNode', ADirectionNode));
  FProperties.Add(TASTNode.TProperty.Create('EndingValueNode', AEndingValueNode));
  FProperties.Add(TASTNode.TProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
end;

{ TGotoStatementNode }

constructor TGotoStatementNode.Create(AGotoKeywordNode: TToken; ALabelIdNode: TToken);
begin
  inherited Create;
  FGotoKeywordNode := AGotoKeywordNode;
  FLabelIdNode := ALabelIdNode;

  FChildNodes.Add(AGotoKeywordNode);
  FChildNodes.Add(ALabelIdNode);

  FProperties.Add(TASTNode.TProperty.Create('GotoKeywordNode', AGotoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('LabelIdNode', ALabelIdNode));
end;

{ TIfStatementNode }

constructor TIfStatementNode.Create(AIfKeywordNode: TToken; AConditionNode: TASTNode; AThenKeywordNode: TToken; AThenStatementNode: TASTNode; AElseKeywordNode: TToken; AElseStatementNode: TASTNode);
begin
  inherited Create;
  FIfKeywordNode := AIfKeywordNode;
  FConditionNode := AConditionNode;
  FThenKeywordNode := AThenKeywordNode;
  FThenStatementNode := AThenStatementNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementNode := AElseStatementNode;

  FChildNodes.Add(AIfKeywordNode);
  FChildNodes.Add(AConditionNode);
  FChildNodes.Add(AThenKeywordNode);
  FChildNodes.Add(AThenStatementNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('IfKeywordNode', AIfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ConditionNode', AConditionNode));
  FProperties.Add(TASTNode.TProperty.Create('ThenKeywordNode', AThenKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ThenStatementNode', AThenStatementNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseStatementNode', AElseStatementNode));
end;

{ TInitSectionNode }

constructor TInitSectionNode.Create(AInitializationKeywordNode: TToken; AInitializationStatementListNode: TListNode; AFinalizationKeywordNode: TToken; AFinalizationStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FInitializationKeywordNode := AInitializationKeywordNode;
  FInitializationStatementListNode := AInitializationStatementListNode;
  FFinalizationKeywordNode := AFinalizationKeywordNode;
  FFinalizationStatementListNode := AFinalizationStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(AInitializationKeywordNode);
  FChildNodes.Add(AInitializationStatementListNode);
  FChildNodes.Add(AFinalizationKeywordNode);
  FChildNodes.Add(AFinalizationStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('InitializationKeywordNode', AInitializationKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('InitializationStatementListNode', AInitializationStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('FinalizationKeywordNode', AFinalizationKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('FinalizationStatementListNode', AFinalizationStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TInterfaceTypeNode }

constructor TInterfaceTypeNode.Create(AInterfaceKeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseInterfaceNode: TASTNode; ACloseParenthesisNode: TToken; AOpenBracketNode: TToken; AGuidNode: TASTNode; ACloseBracketNode: TToken; AMethodAndPropertyListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FInterfaceKeywordNode := AInterfaceKeywordNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FBaseInterfaceNode := ABaseInterfaceNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FOpenBracketNode := AOpenBracketNode;
  FGuidNode := AGuidNode;
  FCloseBracketNode := ACloseBracketNode;
  FMethodAndPropertyListNode := AMethodAndPropertyListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(AInterfaceKeywordNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(ABaseInterfaceNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AGuidNode);
  FChildNodes.Add(ACloseBracketNode);
  FChildNodes.Add(AMethodAndPropertyListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('InterfaceKeywordNode', AInterfaceKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('BaseInterfaceNode', ABaseInterfaceNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('GuidNode', AGuidNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('MethodAndPropertyListNode', AMethodAndPropertyListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TLabelDeclSectionNode }

constructor TLabelDeclSectionNode.Create(ALabelKeywordNode: TToken; ALabelListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FLabelKeywordNode := ALabelKeywordNode;
  FLabelListNode := ALabelListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ALabelKeywordNode);
  FChildNodes.Add(ALabelListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('LabelKeywordNode', ALabelKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('LabelListNode', ALabelListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TLabeledStatementNode }

constructor TLabeledStatementNode.Create(ALabelIdNode: TToken; AColonNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;
  FLabelIdNode := ALabelIdNode;
  FColonNode := AColonNode;
  FStatementNode := AStatementNode;

  FChildNodes.Add(ALabelIdNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('LabelIdNode', ALabelIdNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
end;

{ TMethodHeadingNode }

constructor TMethodHeadingNode.Create(AClassKeywordNode: TToken; AMethodTypeNode: TToken; ANameNode: TASTNode; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FClassKeywordNode := AClassKeywordNode;
  FMethodTypeNode := AMethodTypeNode;
  FNameNode := ANameNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FParameterListNode := AParameterListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FColonNode := AColonNode;
  FReturnTypeNode := AReturnTypeNode;
  FDirectiveListNode := ADirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(AMethodTypeNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AParameterListNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AReturnTypeNode);
  FChildNodes.Add(ADirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('ReturnTypeNode', AReturnTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('DirectiveListNode', ADirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TMethodImplementationNode }

constructor TMethodImplementationNode.Create(AMethodHeadingNode: TMethodHeadingNode; AFancyBlockNode: TFancyBlockNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FMethodHeadingNode := AMethodHeadingNode;
  FFancyBlockNode := AFancyBlockNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AMethodHeadingNode);
  FChildNodes.Add(AFancyBlockNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('MethodHeadingNode', AMethodHeadingNode));
  FProperties.Add(TASTNode.TProperty.Create('FancyBlockNode', AFancyBlockNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TMethodResolutionNode }

constructor TMethodResolutionNode.Create(AMethodTypeNode: TToken; AInterfaceMethodNode: TASTNode; AEqualSignNode: TToken; AImplementationMethodNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;
  FMethodTypeNode := AMethodTypeNode;
  FInterfaceMethodNode := AInterfaceMethodNode;
  FEqualSignNode := AEqualSignNode;
  FImplementationMethodNode := AImplementationMethodNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AMethodTypeNode);
  FChildNodes.Add(AInterfaceMethodNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AImplementationMethodNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('InterfaceMethodNode', AInterfaceMethodNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('ImplementationMethodNode', AImplementationMethodNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TNumberFormatNode }

constructor TNumberFormatNode.Create(AValueNode: TASTNode; ASizeColonNode: TToken; ASizeNode: TASTNode; APrecisionColonNode: TToken; APrecisionNode: TASTNode);
begin
  inherited Create;
  FValueNode := AValueNode;
  FSizeColonNode := ASizeColonNode;
  FSizeNode := ASizeNode;
  FPrecisionColonNode := APrecisionColonNode;
  FPrecisionNode := APrecisionNode;

  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ASizeColonNode);
  FChildNodes.Add(ASizeNode);
  FChildNodes.Add(APrecisionColonNode);
  FChildNodes.Add(APrecisionNode);

  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNode.TProperty.Create('SizeColonNode', ASizeColonNode));
  FProperties.Add(TASTNode.TProperty.Create('SizeNode', ASizeNode));
  FProperties.Add(TASTNode.TProperty.Create('PrecisionColonNode', APrecisionColonNode));
  FProperties.Add(TASTNode.TProperty.Create('PrecisionNode', APrecisionNode));
end;

{ TOpenArrayNode }

constructor TOpenArrayNode.Create(AArrayKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FArrayKeywordNode := AArrayKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(AArrayKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('ArrayKeywordNode', AArrayKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TPackageNode }

constructor TPackageNode.Create(APackageKeywordNode: TToken; ANameNode: TASTNode; ASemicolonNode: TToken; ARequiresClauseNode: TRequiresClauseNode; AContainsClauseNode: TUsesClauseNode; AAttributeListNode: TListNode; AEndKeywordNode: TToken; ADotNode: TToken);
begin
  inherited Create;
  FPackageKeywordNode := APackageKeywordNode;
  FNameNode := ANameNode;
  FSemicolonNode := ASemicolonNode;
  FRequiresClauseNode := ARequiresClauseNode;
  FContainsClauseNode := AContainsClauseNode;
  FAttributeListNode := AAttributeListNode;
  FEndKeywordNode := AEndKeywordNode;
  FDotNode := ADotNode;

  FChildNodes.Add(APackageKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(ARequiresClauseNode);
  FChildNodes.Add(AContainsClauseNode);
  FChildNodes.Add(AAttributeListNode);
  FChildNodes.Add(AEndKeywordNode);
  FChildNodes.Add(ADotNode);

  FProperties.Add(TASTNode.TProperty.Create('PackageKeywordNode', APackageKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNode.TProperty.Create('RequiresClauseNode', ARequiresClauseNode));
  FProperties.Add(TASTNode.TProperty.Create('ContainsClauseNode', AContainsClauseNode));
  FProperties.Add(TASTNode.TProperty.Create('AttributeListNode', AAttributeListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('DotNode', ADotNode));
end;

{ TPackedTypeNode }

constructor TPackedTypeNode.Create(APackedKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FPackedKeywordNode := APackedKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(APackedKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('PackedKeywordNode', APackedKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TParameterNode }

constructor TParameterNode.Create(AModifierNode: TToken; ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; ADefaultValueNode: TASTNode);
begin
  inherited Create;
  FModifierNode := AModifierNode;
  FNameListNode := ANameListNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FEqualSignNode := AEqualSignNode;
  FDefaultValueNode := ADefaultValueNode;

  FChildNodes.Add(AModifierNode);
  FChildNodes.Add(ANameListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ADefaultValueNode);

  FProperties.Add(TASTNode.TProperty.Create('ModifierNode', AModifierNode));
  FProperties.Add(TASTNode.TProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('DefaultValueNode', ADefaultValueNode));
end;

{ TParameterizedNode }

constructor TParameterizedNode.Create(ALeftNode: TASTNode; AOpenDelimiterNode: TToken; AParameterListNode: TListNode; ACloseDelimiterNode: TToken);
begin
  inherited Create;
  FLeftNode := ALeftNode;
  FOpenDelimiterNode := AOpenDelimiterNode;
  FParameterListNode := AParameterListNode;
  FCloseDelimiterNode := ACloseDelimiterNode;

  FChildNodes.Add(ALeftNode);
  FChildNodes.Add(AOpenDelimiterNode);
  FChildNodes.Add(AParameterListNode);
  FChildNodes.Add(ACloseDelimiterNode);

  FProperties.Add(TASTNode.TProperty.Create('LeftNode', ALeftNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenDelimiterNode', AOpenDelimiterNode));
  FProperties.Add(TASTNode.TProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseDelimiterNode', ACloseDelimiterNode));
end;

{ TParenthesizedExpressionNode }

constructor TParenthesizedExpressionNode.Create(AOpenParenthesisNode: TToken; AExpressionNode: TASTNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FExpressionNode := AExpressionNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(ACloseParenthesisNode);

  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TPointerDereferenceNode }

constructor TPointerDereferenceNode.Create(AOperandNode: TASTNode; ACaretNode: TToken);
begin
  inherited Create;
  FOperandNode := AOperandNode;
  FCaretNode := ACaretNode;

  FChildNodes.Add(AOperandNode);
  FChildNodes.Add(ACaretNode);

  FProperties.Add(TASTNode.TProperty.Create('OperandNode', AOperandNode));
  FProperties.Add(TASTNode.TProperty.Create('CaretNode', ACaretNode));
end;

{ TPointerTypeNode }

constructor TPointerTypeNode.Create(ACaretNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FCaretNode := ACaretNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(ACaretNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('CaretNode', ACaretNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TProcedureTypeNode }

constructor TProcedureTypeNode.Create(AMethodTypeNode: TToken; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; AFirstDirectiveListNode: TListNode; AOfKeywordNode: TToken; AObjectKeywordNode: TToken; ASecondDirectiveListNode: TListNode);
begin
  inherited Create;
  FMethodTypeNode := AMethodTypeNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FParameterListNode := AParameterListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FColonNode := AColonNode;
  FReturnTypeNode := AReturnTypeNode;
  FFirstDirectiveListNode := AFirstDirectiveListNode;
  FOfKeywordNode := AOfKeywordNode;
  FObjectKeywordNode := AObjectKeywordNode;
  FSecondDirectiveListNode := ASecondDirectiveListNode;

  FChildNodes.Add(AMethodTypeNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AParameterListNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AReturnTypeNode);
  FChildNodes.Add(AFirstDirectiveListNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(AObjectKeywordNode);
  FChildNodes.Add(ASecondDirectiveListNode);

  FProperties.Add(TASTNode.TProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('ReturnTypeNode', AReturnTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('FirstDirectiveListNode', AFirstDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ObjectKeywordNode', AObjectKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('SecondDirectiveListNode', ASecondDirectiveListNode));
end;

{ TProgramNode }

constructor TProgramNode.Create(AProgramKeywordNode: TToken; ANameNode: TToken; ANoiseOpenParenthesisNode: TToken; ANoiseContentListNode: TListNode; ANoiseCloseParenthesisNode: TToken; ASemicolonNode: TToken; AUsesClauseNode: TUsesClauseNode; ADeclarationListNode: TListNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);
begin
  inherited Create;
  FProgramKeywordNode := AProgramKeywordNode;
  FNameNode := ANameNode;
  FNoiseOpenParenthesisNode := ANoiseOpenParenthesisNode;
  FNoiseContentListNode := ANoiseContentListNode;
  FNoiseCloseParenthesisNode := ANoiseCloseParenthesisNode;
  FSemicolonNode := ASemicolonNode;
  FUsesClauseNode := AUsesClauseNode;
  FDeclarationListNode := ADeclarationListNode;
  FInitSectionNode := AInitSectionNode;
  FDotNode := ADotNode;

  FChildNodes.Add(AProgramKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(ANoiseOpenParenthesisNode);
  FChildNodes.Add(ANoiseContentListNode);
  FChildNodes.Add(ANoiseCloseParenthesisNode);
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(AUsesClauseNode);
  FChildNodes.Add(ADeclarationListNode);
  FChildNodes.Add(AInitSectionNode);
  FChildNodes.Add(ADotNode);

  FProperties.Add(TASTNode.TProperty.Create('ProgramKeywordNode', AProgramKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('NoiseOpenParenthesisNode', ANoiseOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('NoiseContentListNode', ANoiseContentListNode));
  FProperties.Add(TASTNode.TProperty.Create('NoiseCloseParenthesisNode', ANoiseCloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNode.TProperty.Create('UsesClauseNode', AUsesClauseNode));
  FProperties.Add(TASTNode.TProperty.Create('DeclarationListNode', ADeclarationListNode));
  FProperties.Add(TASTNode.TProperty.Create('InitSectionNode', AInitSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('DotNode', ADotNode));
end;

{ TPropertyNode }

constructor TPropertyNode.Create(AClassKeywordNode: TToken; APropertyKeywordNode: TToken; ANameNode: TToken; AOpenBracketNode: TToken; AParameterListNode: TListNode; ACloseBracketNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FClassKeywordNode := AClassKeywordNode;
  FPropertyKeywordNode := APropertyKeywordNode;
  FNameNode := ANameNode;
  FOpenBracketNode := AOpenBracketNode;
  FParameterListNode := AParameterListNode;
  FCloseBracketNode := ACloseBracketNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FDirectiveListNode := ADirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(APropertyKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AParameterListNode);
  FChildNodes.Add(ACloseBracketNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(ADirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('PropertyKeywordNode', APropertyKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('DirectiveListNode', ADirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TRaiseStatementNode }

constructor TRaiseStatementNode.Create(ARaiseKeywordNode: TToken; AExceptionNode: TASTNode; AAtSemikeywordNode: TToken; AAddressNode: TASTNode);
begin
  inherited Create;
  FRaiseKeywordNode := ARaiseKeywordNode;
  FExceptionNode := AExceptionNode;
  FAtSemikeywordNode := AAtSemikeywordNode;
  FAddressNode := AAddressNode;

  FChildNodes.Add(ARaiseKeywordNode);
  FChildNodes.Add(AExceptionNode);
  FChildNodes.Add(AAtSemikeywordNode);
  FChildNodes.Add(AAddressNode);

  FProperties.Add(TASTNode.TProperty.Create('RaiseKeywordNode', ARaiseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ExceptionNode', AExceptionNode));
  FProperties.Add(TASTNode.TProperty.Create('AtSemikeywordNode', AAtSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('AddressNode', AAddressNode));
end;

{ TRecordFieldConstantNode }

constructor TRecordFieldConstantNode.Create(ANameNode: TASTNode; AColonNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FValueNode := AValueNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AValueNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
end;

{ TRecordTypeNode }

constructor TRecordTypeNode.Create(ARecordKeywordNode: TToken; AContentListNode: TListNode; AVariantSectionNode: TVariantSectionNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FRecordKeywordNode := ARecordKeywordNode;
  FContentListNode := AContentListNode;
  FVariantSectionNode := AVariantSectionNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ARecordKeywordNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AVariantSectionNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('RecordKeywordNode', ARecordKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNode.TProperty.Create('VariantSectionNode', AVariantSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TRepeatStatementNode }

constructor TRepeatStatementNode.Create(ARepeatKeywordNode: TToken; AStatementListNode: TListNode; AUntilKeywordNode: TToken; AConditionNode: TASTNode);
begin
  inherited Create;
  FRepeatKeywordNode := ARepeatKeywordNode;
  FStatementListNode := AStatementListNode;
  FUntilKeywordNode := AUntilKeywordNode;
  FConditionNode := AConditionNode;

  FChildNodes.Add(ARepeatKeywordNode);
  FChildNodes.Add(AStatementListNode);
  FChildNodes.Add(AUntilKeywordNode);
  FChildNodes.Add(AConditionNode);

  FProperties.Add(TASTNode.TProperty.Create('RepeatKeywordNode', ARepeatKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementListNode', AStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('UntilKeywordNode', AUntilKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ConditionNode', AConditionNode));
end;

{ TRequiresClauseNode }

constructor TRequiresClauseNode.Create(ARequiresSemikeywordNode: TToken; APackageListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FRequiresSemikeywordNode := ARequiresSemikeywordNode;
  FPackageListNode := APackageListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ARequiresSemikeywordNode);
  FChildNodes.Add(APackageListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('RequiresSemikeywordNode', ARequiresSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('PackageListNode', APackageListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TSetLiteralNode }

constructor TSetLiteralNode.Create(AOpenBracketNode: TToken; AItemListNode: TListNode; ACloseBracketNode: TToken);
begin
  inherited Create;
  FOpenBracketNode := AOpenBracketNode;
  FItemListNode := AItemListNode;
  FCloseBracketNode := ACloseBracketNode;

  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseBracketNode);

  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TSetOfNode }

constructor TSetOfNode.Create(ASetKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;
  FSetKeywordNode := ASetKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  FChildNodes.Add(ASetKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  FProperties.Add(TASTNode.TProperty.Create('SetKeywordNode', ASetKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
end;

{ TStringOfLengthNode }

constructor TStringOfLengthNode.Create(AStringKeywordNode: TToken; AOpenBracketNode: TToken; ALengthNode: TASTNode; ACloseBracketNode: TToken);
begin
  inherited Create;
  FStringKeywordNode := AStringKeywordNode;
  FOpenBracketNode := AOpenBracketNode;
  FLengthNode := ALengthNode;
  FCloseBracketNode := ACloseBracketNode;

  FChildNodes.Add(AStringKeywordNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(ALengthNode);
  FChildNodes.Add(ACloseBracketNode);

  FProperties.Add(TASTNode.TProperty.Create('StringKeywordNode', AStringKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNode.TProperty.Create('LengthNode', ALengthNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TTryExceptNode }

constructor TTryExceptNode.Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AExceptKeywordNode: TToken; AExceptionItemListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FTryKeywordNode := ATryKeywordNode;
  FTryStatementListNode := ATryStatementListNode;
  FExceptKeywordNode := AExceptKeywordNode;
  FExceptionItemListNode := AExceptionItemListNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementListNode := AElseStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ATryKeywordNode);
  FChildNodes.Add(ATryStatementListNode);
  FChildNodes.Add(AExceptKeywordNode);
  FChildNodes.Add(AExceptionItemListNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('TryKeywordNode', ATryKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TryStatementListNode', ATryStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('ExceptKeywordNode', AExceptKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ExceptionItemListNode', AExceptionItemListNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ElseStatementListNode', AElseStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTryFinallyNode }

constructor TTryFinallyNode.Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AFinallyKeywordNode: TToken; AFinallyStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FTryKeywordNode := ATryKeywordNode;
  FTryStatementListNode := ATryStatementListNode;
  FFinallyKeywordNode := AFinallyKeywordNode;
  FFinallyStatementListNode := AFinallyStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ATryKeywordNode);
  FChildNodes.Add(ATryStatementListNode);
  FChildNodes.Add(AFinallyKeywordNode);
  FChildNodes.Add(AFinallyStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('TryKeywordNode', ATryKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TryStatementListNode', ATryStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('FinallyKeywordNode', AFinallyKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('FinallyStatementListNode', AFinallyStatementListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTypeDeclNode }

constructor TTypeDeclNode.Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeKeywordNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FTypeKeywordNode := ATypeKeywordNode;
  FTypeNode := ATypeNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TTypeForwardDeclarationNode }

constructor TTypeForwardDeclarationNode.Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FTypeNode := ATypeNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TTypeHelperNode }

constructor TTypeHelperNode.Create(ATypeKeywordNode: TToken; AHelperSemikeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseHelperTypeNode: TASTNode; ACloseParenthesisNode: TToken; AForKeywordNode: TToken; ATypeNode: TASTNode; AContentListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;
  FTypeKeywordNode := ATypeKeywordNode;
  FHelperSemikeywordNode := AHelperSemikeywordNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FBaseHelperTypeNode := ABaseHelperTypeNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FForKeywordNode := AForKeywordNode;
  FTypeNode := ATypeNode;
  FContentListNode := AContentListNode;
  FEndKeywordNode := AEndKeywordNode;

  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(AHelperSemikeywordNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(ABaseHelperTypeNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AEndKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('HelperSemikeywordNode', AHelperSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('BaseHelperTypeNode', ABaseHelperTypeNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNode.TProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTypeSectionNode }

constructor TTypeSectionNode.Create(ATypeKeywordNode: TToken; ATypeListNode: TListNode);
begin
  inherited Create;
  FTypeKeywordNode := ATypeKeywordNode;
  FTypeListNode := ATypeListNode;

  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(ATypeListNode);

  FProperties.Add(TASTNode.TProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeListNode', ATypeListNode));
end;

{ TUnaryOperationNode }

constructor TUnaryOperationNode.Create(AOperatorNode: TToken; AOperandNode: TASTNode);
begin
  inherited Create;
  FOperatorNode := AOperatorNode;
  FOperandNode := AOperandNode;

  FChildNodes.Add(AOperatorNode);
  FChildNodes.Add(AOperandNode);

  FProperties.Add(TASTNode.TProperty.Create('OperatorNode', AOperatorNode));
  FProperties.Add(TASTNode.TProperty.Create('OperandNode', AOperandNode));
end;

{ TUnitNode }

constructor TUnitNode.Create(AUnitKeywordNode: TToken; AUnitNameNode: TToken; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken; AInterfaceSectionNode: TUnitSectionNode; AImplementationSectionNode: TUnitSectionNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);
begin
  inherited Create;
  FUnitKeywordNode := AUnitKeywordNode;
  FUnitNameNode := AUnitNameNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;
  FInterfaceSectionNode := AInterfaceSectionNode;
  FImplementationSectionNode := AImplementationSectionNode;
  FInitSectionNode := AInitSectionNode;
  FDotNode := ADotNode;

  FChildNodes.Add(AUnitKeywordNode);
  FChildNodes.Add(AUnitNameNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(AInterfaceSectionNode);
  FChildNodes.Add(AImplementationSectionNode);
  FChildNodes.Add(AInitSectionNode);
  FChildNodes.Add(ADotNode);

  FProperties.Add(TASTNode.TProperty.Create('UnitKeywordNode', AUnitKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('UnitNameNode', AUnitNameNode));
  FProperties.Add(TASTNode.TProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNode.TProperty.Create('InterfaceSectionNode', AInterfaceSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('ImplementationSectionNode', AImplementationSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('InitSectionNode', AInitSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('DotNode', ADotNode));
end;

{ TUnitSectionNode }

constructor TUnitSectionNode.Create(AHeaderKeywordNode: TToken; AUsesClauseNode: TUsesClauseNode; AContentListNode: TListNode);
begin
  inherited Create;
  FHeaderKeywordNode := AHeaderKeywordNode;
  FUsesClauseNode := AUsesClauseNode;
  FContentListNode := AContentListNode;

  FChildNodes.Add(AHeaderKeywordNode);
  FChildNodes.Add(AUsesClauseNode);
  FChildNodes.Add(AContentListNode);

  FProperties.Add(TASTNode.TProperty.Create('HeaderKeywordNode', AHeaderKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('UsesClauseNode', AUsesClauseNode));
  FProperties.Add(TASTNode.TProperty.Create('ContentListNode', AContentListNode));
end;

{ TUsedUnitNode }

constructor TUsedUnitNode.Create(ANameNode: TASTNode; AInKeywordNode: TToken; AFileNameNode: TToken);
begin
  inherited Create;
  FNameNode := ANameNode;
  FInKeywordNode := AInKeywordNode;
  FFileNameNode := AFileNameNode;

  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AInKeywordNode);
  FChildNodes.Add(AFileNameNode);

  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('InKeywordNode', AInKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('FileNameNode', AFileNameNode));
end;

{ TUsesClauseNode }

constructor TUsesClauseNode.Create(AUsesKeywordNode: TToken; AUnitListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FUsesKeywordNode := AUsesKeywordNode;
  FUnitListNode := AUnitListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AUsesKeywordNode);
  FChildNodes.Add(AUnitListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('UsesKeywordNode', AUsesKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('UnitListNode', AUnitListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVarDeclNode }

constructor TVarDeclNode.Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AFirstPortabilityDirectiveListNode: TListNode; AAbsoluteSemikeywordNode: TToken; AAbsoluteAddressNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; ASecondPortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;
  FNameListNode := ANameListNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FFirstPortabilityDirectiveListNode := AFirstPortabilityDirectiveListNode;
  FAbsoluteSemikeywordNode := AAbsoluteSemikeywordNode;
  FAbsoluteAddressNode := AAbsoluteAddressNode;
  FEqualSignNode := AEqualSignNode;
  FValueNode := AValueNode;
  FSecondPortabilityDirectiveListNode := ASecondPortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(ANameListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AFirstPortabilityDirectiveListNode);
  FChildNodes.Add(AAbsoluteSemikeywordNode);
  FChildNodes.Add(AAbsoluteAddressNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ASecondPortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('FirstPortabilityDirectiveListNode', AFirstPortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('AbsoluteSemikeywordNode', AAbsoluteSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('AbsoluteAddressNode', AAbsoluteAddressNode));
  FProperties.Add(TASTNode.TProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNode.TProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNode.TProperty.Create('SecondPortabilityDirectiveListNode', ASecondPortabilityDirectiveListNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVarSectionNode }

constructor TVarSectionNode.Create(AVarKeywordNode: TToken; AVarListNode: TListNode);
begin
  inherited Create;
  FVarKeywordNode := AVarKeywordNode;
  FVarListNode := AVarListNode;

  FChildNodes.Add(AVarKeywordNode);
  FChildNodes.Add(AVarListNode);

  FProperties.Add(TASTNode.TProperty.Create('VarKeywordNode', AVarKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('VarListNode', AVarListNode));
end;

{ TVariantGroupNode }

constructor TVariantGroupNode.Create(AValueListNode: TListNode; AColonNode: TToken; AOpenParenthesisNode: TToken; AFieldDeclListNode: TListNode; AVariantSectionNode: TVariantSectionNode; ACloseParenthesisNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;
  FValueListNode := AValueListNode;
  FColonNode := AColonNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FFieldDeclListNode := AFieldDeclListNode;
  FVariantSectionNode := AVariantSectionNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FSemicolonNode := ASemicolonNode;

  FChildNodes.Add(AValueListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AFieldDeclListNode);
  FChildNodes.Add(AVariantSectionNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(ASemicolonNode);

  FProperties.Add(TASTNode.TProperty.Create('ValueListNode', AValueListNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('FieldDeclListNode', AFieldDeclListNode));
  FProperties.Add(TASTNode.TProperty.Create('VariantSectionNode', AVariantSectionNode));
  FProperties.Add(TASTNode.TProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNode.TProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVariantSectionNode }

constructor TVariantSectionNode.Create(ACaseKeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AOfKeywordNode: TToken; AVariantGroupListNode: TListNode);
begin
  inherited Create;
  FCaseKeywordNode := ACaseKeywordNode;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FOfKeywordNode := AOfKeywordNode;
  FVariantGroupListNode := AVariantGroupListNode;

  FChildNodes.Add(ACaseKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(AVariantGroupListNode);

  FProperties.Add(TASTNode.TProperty.Create('CaseKeywordNode', ACaseKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNode.TProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNode.TProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNode.TProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('VariantGroupListNode', AVariantGroupListNode));
end;

{ TVisibilityNode }

constructor TVisibilityNode.Create(AStrictSemikeywordNode: TToken; AVisibilityKeywordNode: TToken);
begin
  inherited Create;
  FStrictSemikeywordNode := AStrictSemikeywordNode;
  FVisibilityKeywordNode := AVisibilityKeywordNode;

  FChildNodes.Add(AStrictSemikeywordNode);
  FChildNodes.Add(AVisibilityKeywordNode);

  FProperties.Add(TASTNode.TProperty.Create('StrictSemikeywordNode', AStrictSemikeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('VisibilityKeywordNode', AVisibilityKeywordNode));
end;

{ TVisibilitySectionNode }

constructor TVisibilitySectionNode.Create(AVisibilityNode: TVisibilityNode; AContentListNode: TListNode);
begin
  inherited Create;
  FVisibilityNode := AVisibilityNode;
  FContentListNode := AContentListNode;

  FChildNodes.Add(AVisibilityNode);
  FChildNodes.Add(AContentListNode);

  FProperties.Add(TASTNode.TProperty.Create('VisibilityNode', AVisibilityNode));
  FProperties.Add(TASTNode.TProperty.Create('ContentListNode', AContentListNode));
end;

{ TWhileStatementNode }

constructor TWhileStatementNode.Create(AWhileKeywordNode: TToken; AConditionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;
  FWhileKeywordNode := AWhileKeywordNode;
  FConditionNode := AConditionNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  FChildNodes.Add(AWhileKeywordNode);
  FChildNodes.Add(AConditionNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('WhileKeywordNode', AWhileKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ConditionNode', AConditionNode));
  FProperties.Add(TASTNode.TProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
end;

{ TWithStatementNode }

constructor TWithStatementNode.Create(AWithKeywordNode: TToken; AExpressionListNode: TListNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;
  FWithKeywordNode := AWithKeywordNode;
  FExpressionListNode := AExpressionListNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  FChildNodes.Add(AWithKeywordNode);
  FChildNodes.Add(AExpressionListNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  FProperties.Add(TASTNode.TProperty.Create('WithKeywordNode', AWithKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('ExpressionListNode', AExpressionListNode));
  FProperties.Add(TASTNode.TProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNode.TProperty.Create('StatementNode', AStatementNode));
end;

end.
