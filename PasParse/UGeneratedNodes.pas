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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property SemicolonNode: TToken read FSemicolonNode;
    property KeywordNode: TToken read FKeywordNode;
    property ValueNode: TASTNode read FValueNode;
    property DataNode: TASTNode read FDataNode;

    // Additional method(s)
    function ForbidsBody: Boolean;
  end;

  TEnumeratedTypeElementNode = class(TNonTerminalNode)
  private
    FNameNode: TToken;
    FEqualSignNode: TToken;
    FValueNode: TASTNode;

  public
    constructor Create(ANameNode: TToken; AEqualSignNode: TToken; AValueNode: TASTNode);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property NameNode: TASTNode read FNameNode;
    property SpecifierListNode: TListNode read FSpecifierListNode;
  end;

  TExportsSpecifierNode = class(TNonTerminalNode)
  private
    FKeywordNode: TToken;
    FValueNode: TASTNode;

  public
    constructor Create(AKeywordNode: TToken; AValueNode: TASTNode);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    // Additional method(s)
    function RequiresBody: Boolean;
  end;

  TMethodImplementationNode = class(TNonTerminalNode)
  private
    FMethodHeadingNode: TMethodHeadingNode;
    FFancyBlockNode: TFancyBlockNode;
    FSemicolonNode: TToken;

  public
    constructor Create(AMethodHeadingNode: TMethodHeadingNode; AFancyBlockNode: TFancyBlockNode; ASemicolonNode: TToken);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property OperandNode: TASTNode read FOperandNode;
    property CaretNode: TToken read FCaretNode;
  end;

  TPointerTypeNode = class(TNonTerminalNode)
  private
    FCaretNode: TToken;
    FTypeNode: TASTNode;

  public
    constructor Create(ACaretNode: TToken; ATypeNode: TASTNode);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property TypeKeywordNode: TToken read FTypeKeywordNode;
    property TypeListNode: TListNode read FTypeListNode;
  end;

  TUnaryOperationNode = class(TNonTerminalNode)
  private
    FOperatorNode: TToken;
    FOperandNode: TASTNode;

  public
    constructor Create(AOperatorNode: TToken; AOperandNode: TASTNode);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property StrictSemikeywordNode: TToken read FStrictSemikeywordNode;
    property VisibilityKeywordNode: TToken read FVisibilityKeywordNode;
  end;

  TVisibilitySectionNode = class(TNonTerminalNode)
  private
    FVisibilityNode: TVisibilityNode;
    FContentListNode: TListNode;

  public
    constructor Create(AVisibilityNode: TVisibilityNode; AContentListNode: TListNode);

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

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

    function Clone: TASTNode; override;

    property WithKeywordNode: TToken read FWithKeywordNode;
    property ExpressionListNode: TListNode read FExpressionListNode;
    property DoKeywordNode: TToken read FDoKeywordNode;
    property StatementNode: TASTNode read FStatementNode;
  end;

implementation

uses
  UTokenType;

{ TArrayTypeNode }

function TArrayTypeNode.Clone: TASTNode;
begin
  Result := TArrayTypeNode.Create(
    FArrayKeywordNode.Clone as TToken,
    FOpenBracketNode.Clone as TToken,
    FIndexListNode.Clone as TListNode,
    FCloseBracketNode.Clone as TToken,
    FOfKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TArrayTypeNode.Create(AArrayKeywordNode: TToken; AOpenBracketNode: TToken; AIndexListNode: TListNode; ACloseBracketNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FArrayKeywordNode := AArrayKeywordNode;
  FOpenBracketNode := AOpenBracketNode;
  FIndexListNode := AIndexListNode;
  FCloseBracketNode := ACloseBracketNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(AArrayKeywordNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AIndexListNode);
  FChildNodes.Add(ACloseBracketNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ArrayKeywordNode', AArrayKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('IndexListNode', AIndexListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TAssemblerStatementNode }

function TAssemblerStatementNode.Clone: TASTNode;
begin
  Result := TAssemblerStatementNode.Create(
    FAsmKeywordNode.Clone as TToken,
    FEndKeywordNode.Clone as TToken);
end;

constructor TAssemblerStatementNode.Create(AAsmKeywordNode: TToken; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FAsmKeywordNode := AAsmKeywordNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(AAsmKeywordNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('AsmKeywordNode', AAsmKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TAttributeNode }

function TAttributeNode.Clone: TASTNode;
begin
  Result := TAttributeNode.Create(
    FOpenBracketNode.Clone as TToken,
    FScopeNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FValueNode.Clone as TASTNode,
    FCloseBracketNode.Clone as TToken);
end;

constructor TAttributeNode.Create(AOpenBracketNode: TToken; AScopeNode: TToken; AColonNode: TToken; AValueNode: TASTNode; ACloseBracketNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOpenBracketNode := AOpenBracketNode;
  FScopeNode := AScopeNode;
  FColonNode := AColonNode;
  FValueNode := AValueNode;
  FCloseBracketNode := ACloseBracketNode;

  // Adding child nodes
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AScopeNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ACloseBracketNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('ScopeNode', AScopeNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TBinaryOperationNode }

function TBinaryOperationNode.Clone: TASTNode;
begin
  Result := TBinaryOperationNode.Create(
    FLeftNode.Clone as TASTNode,
    FOperatorNode.Clone as TToken,
    FRightNode.Clone as TASTNode);
end;

constructor TBinaryOperationNode.Create(ALeftNode: TASTNode; AOperatorNode: TToken; ARightNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FLeftNode := ALeftNode;
  FOperatorNode := AOperatorNode;
  FRightNode := ARightNode;

  // Adding child nodes
  FChildNodes.Add(ALeftNode);
  FChildNodes.Add(AOperatorNode);
  FChildNodes.Add(ARightNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('LeftNode', ALeftNode));
  FProperties.Add(TASTNodeProperty.Create('OperatorNode', AOperatorNode));
  FProperties.Add(TASTNodeProperty.Create('RightNode', ARightNode));
end;

{ TBlockNode }

function TBlockNode.Clone: TASTNode;
begin
  Result := TBlockNode.Create(
    FBeginKeywordNode.Clone as TToken,
    FStatementListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TBlockNode.Create(ABeginKeywordNode: TToken; AStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FBeginKeywordNode := ABeginKeywordNode;
  FStatementListNode := AStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ABeginKeywordNode);
  FChildNodes.Add(AStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('BeginKeywordNode', ABeginKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementListNode', AStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TCaseSelectorNode }

function TCaseSelectorNode.Clone: TASTNode;
begin
  Result := TCaseSelectorNode.Create(
    FValueListNode.Clone as TListNode,
    FColonNode.Clone as TToken,
    FStatementNode.Clone as TASTNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TCaseSelectorNode.Create(AValueListNode: TListNode; AColonNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FValueListNode := AValueListNode;
  FColonNode := AColonNode;
  FStatementNode := AStatementNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AValueListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AStatementNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ValueListNode', AValueListNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TCaseStatementNode }

function TCaseStatementNode.Clone: TASTNode;
begin
  Result := TCaseStatementNode.Create(
    FCaseKeywordNode.Clone as TToken,
    FExpressionNode.Clone as TASTNode,
    FOfKeywordNode.Clone as TToken,
    FSelectorListNode.Clone as TListNode,
    FElseKeywordNode.Clone as TToken,
    FElseStatementListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TCaseStatementNode.Create(ACaseKeywordNode: TToken; AExpressionNode: TASTNode; AOfKeywordNode: TToken; ASelectorListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FCaseKeywordNode := ACaseKeywordNode;
  FExpressionNode := AExpressionNode;
  FOfKeywordNode := AOfKeywordNode;
  FSelectorListNode := ASelectorListNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementListNode := AElseStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ACaseKeywordNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ASelectorListNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('CaseKeywordNode', ACaseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('SelectorListNode', ASelectorListNode));
  FProperties.Add(TASTNodeProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ElseStatementListNode', AElseStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TClassOfNode }

function TClassOfNode.Clone: TASTNode;
begin
  Result := TClassOfNode.Create(
    FClassKeywordNode.Clone as TToken,
    FOfKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TClassOfNode.Create(AClassKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FClassKeywordNode := AClassKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TClassTypeNode }

function TClassTypeNode.Clone: TASTNode;
begin
  Result := TClassTypeNode.Create(
    FClassKeywordNode.Clone as TToken,
    FDispositionNode.Clone as TToken,
    FOpenParenthesisNode.Clone as TToken,
    FInheritanceListNode.Clone as TListNode,
    FCloseParenthesisNode.Clone as TToken,
    FContentListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TClassTypeNode.Create(AClassKeywordNode: TToken; ADispositionNode: TToken; AOpenParenthesisNode: TToken; AInheritanceListNode: TListNode; ACloseParenthesisNode: TToken; AContentListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FClassKeywordNode := AClassKeywordNode;
  FDispositionNode := ADispositionNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FInheritanceListNode := AInheritanceListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FContentListNode := AContentListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(ADispositionNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AInheritanceListNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('DispositionNode', ADispositionNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('InheritanceListNode', AInheritanceListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TConstSectionNode }

function TConstSectionNode.Clone: TASTNode;
begin
  Result := TConstSectionNode.Create(
    FConstKeywordNode.Clone as TToken,
    FConstListNode.Clone as TListNode);
end;

constructor TConstSectionNode.Create(AConstKeywordNode: TToken; AConstListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FConstKeywordNode := AConstKeywordNode;
  FConstListNode := AConstListNode;

  // Adding child nodes
  FChildNodes.Add(AConstKeywordNode);
  FChildNodes.Add(AConstListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ConstKeywordNode', AConstKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ConstListNode', AConstListNode));
end;

{ TConstantDeclNode }

function TConstantDeclNode.Clone: TASTNode;
begin
  Result := TConstantDeclNode.Create(
    FNameNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FEqualSignNode.Clone as TToken,
    FValueNode.Clone as TASTNode,
    FPortabilityDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TConstantDeclNode.Create(ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FEqualSignNode := AEqualSignNode;
  FValueNode := AValueNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNodeProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TConstantListNode }

function TConstantListNode.Clone: TASTNode;
begin
  Result := TConstantListNode.Create(
    FOpenParenthesisNode.Clone as TToken,
    FItemListNode.Clone as TListNode,
    FCloseParenthesisNode.Clone as TToken);
end;

constructor TConstantListNode.Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOpenParenthesisNode := AOpenParenthesisNode;
  FItemListNode := AItemListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  // Adding child nodes
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseParenthesisNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TDirectiveNode }

function TDirectiveNode.Clone: TASTNode;
begin
  Result := TDirectiveNode.Create(
    FSemicolonNode.Clone as TToken,
    FKeywordNode.Clone as TToken,
    FValueNode.Clone as TASTNode,
    FDataNode.Clone as TASTNode);
end;

constructor TDirectiveNode.Create(ASemicolonNode: TToken; AKeywordNode: TToken; AValueNode: TASTNode; ADataNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FSemicolonNode := ASemicolonNode;
  FKeywordNode := AKeywordNode;
  FValueNode := AValueNode;
  FDataNode := ADataNode;

  // Adding child nodes
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(AKeywordNode);
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ADataNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNodeProperty.Create('KeywordNode', AKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNodeProperty.Create('DataNode', ADataNode));
end;

function TDirectiveNode.ForbidsBody: Boolean;
begin
  // Forward or External directives must not have a body!
  Result := (FKeywordNode.TokenType = TTForwardSemikeyword) or
    (FKeywordNode.TokenType = TTExternalSemikeyword);
end;

{ TEnumeratedTypeElementNode }

function TEnumeratedTypeElementNode.Clone: TASTNode;
begin
  Result := TEnumeratedTypeElementNode.Create(
    FNameNode.Clone as TToken,
    FEqualSignNode.Clone as TToken,
    FValueNode.Clone as TASTNode);
end;

constructor TEnumeratedTypeElementNode.Create(ANameNode: TToken; AEqualSignNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FValueNode := AValueNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AValueNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
end;

{ TEnumeratedTypeNode }

function TEnumeratedTypeNode.Clone: TASTNode;
begin
  Result := TEnumeratedTypeNode.Create(
    FOpenParenthesisNode.Clone as TToken,
    FItemListNode.Clone as TListNode,
    FCloseParenthesisNode.Clone as TToken);
end;

constructor TEnumeratedTypeNode.Create(AOpenParenthesisNode: TToken; AItemListNode: TListNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOpenParenthesisNode := AOpenParenthesisNode;
  FItemListNode := AItemListNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  // Adding child nodes
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseParenthesisNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TExceptionItemNode }

function TExceptionItemNode.Clone: TASTNode;
begin
  Result := TExceptionItemNode.Create(
    FOnSemikeywordNode.Clone as TToken,
    FNameNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FDoKeywordNode.Clone as TToken,
    FStatementNode.Clone as TASTNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TExceptionItemNode.Create(AOnSemikeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOnSemikeywordNode := AOnSemikeywordNode;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AOnSemikeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OnSemikeywordNode', AOnSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TExportsItemNode }

function TExportsItemNode.Clone: TASTNode;
begin
  Result := TExportsItemNode.Create(
    FNameNode.Clone as TASTNode,
    FSpecifierListNode.Clone as TListNode);
end;

constructor TExportsItemNode.Create(ANameNode: TASTNode; ASpecifierListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FSpecifierListNode := ASpecifierListNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(ASpecifierListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('SpecifierListNode', ASpecifierListNode));
end;

{ TExportsSpecifierNode }

function TExportsSpecifierNode.Clone: TASTNode;
begin
  Result := TExportsSpecifierNode.Create(
    FKeywordNode.Clone as TToken,
    FValueNode.Clone as TASTNode);
end;

constructor TExportsSpecifierNode.Create(AKeywordNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FKeywordNode := AKeywordNode;
  FValueNode := AValueNode;

  // Adding child nodes
  FChildNodes.Add(AKeywordNode);
  FChildNodes.Add(AValueNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('KeywordNode', AKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
end;

{ TExportsStatementNode }

function TExportsStatementNode.Clone: TASTNode;
begin
  Result := TExportsStatementNode.Create(
    FExportsKeywordNode.Clone as TToken,
    FItemListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TExportsStatementNode.Create(AExportsKeywordNode: TToken; AItemListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FExportsKeywordNode := AExportsKeywordNode;
  FItemListNode := AItemListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AExportsKeywordNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ExportsKeywordNode', AExportsKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TFancyBlockNode }

function TFancyBlockNode.Clone: TASTNode;
begin
  Result := TFancyBlockNode.Create(
    FDeclListNode.Clone as TListNode,
    FBlockNode.Clone as TASTNode);
end;

constructor TFancyBlockNode.Create(ADeclListNode: TListNode; ABlockNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FDeclListNode := ADeclListNode;
  FBlockNode := ABlockNode;

  // Adding child nodes
  FChildNodes.Add(ADeclListNode);
  FChildNodes.Add(ABlockNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('DeclListNode', ADeclListNode));
  FProperties.Add(TASTNodeProperty.Create('BlockNode', ABlockNode));
end;

{ TFieldDeclNode }

function TFieldDeclNode.Clone: TASTNode;
begin
  Result := TFieldDeclNode.Create(
    FNameListNode.Clone as TListNode,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FPortabilityDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TFieldDeclNode.Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FNameListNode := ANameListNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ANameListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TFieldSectionNode }

function TFieldSectionNode.Clone: TASTNode;
begin
  Result := TFieldSectionNode.Create(
    FClassKeywordNode.Clone as TToken,
    FVarKeywordNode.Clone as TToken,
    FFieldListNode.Clone as TListNode);
end;

constructor TFieldSectionNode.Create(AClassKeywordNode: TToken; AVarKeywordNode: TToken; AFieldListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FClassKeywordNode := AClassKeywordNode;
  FVarKeywordNode := AVarKeywordNode;
  FFieldListNode := AFieldListNode;

  // Adding child nodes
  FChildNodes.Add(AClassKeywordNode);
  FChildNodes.Add(AVarKeywordNode);
  FChildNodes.Add(AFieldListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('VarKeywordNode', AVarKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('FieldListNode', AFieldListNode));
end;

{ TFileTypeNode }

function TFileTypeNode.Clone: TASTNode;
begin
  Result := TFileTypeNode.Create(
    FFileKeywordNode.Clone as TToken,
    FOfKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TFileTypeNode.Create(AFileKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FFileKeywordNode := AFileKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(AFileKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('FileKeywordNode', AFileKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TForInStatementNode }

function TForInStatementNode.Clone: TASTNode;
begin
  Result := TForInStatementNode.Create(
    FForKeywordNode.Clone as TToken,
    FLoopVariableNode.Clone as TToken,
    FInKeywordNode.Clone as TToken,
    FExpressionNode.Clone as TASTNode,
    FDoKeywordNode.Clone as TToken,
    FStatementNode.Clone as TASTNode);
end;

constructor TForInStatementNode.Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AInKeywordNode: TToken; AExpressionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FForKeywordNode := AForKeywordNode;
  FLoopVariableNode := ALoopVariableNode;
  FInKeywordNode := AInKeywordNode;
  FExpressionNode := AExpressionNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  // Adding child nodes
  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ALoopVariableNode);
  FChildNodes.Add(AInKeywordNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('LoopVariableNode', ALoopVariableNode));
  FProperties.Add(TASTNodeProperty.Create('InKeywordNode', AInKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNodeProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
end;

{ TForStatementNode }

function TForStatementNode.Clone: TASTNode;
begin
  Result := TForStatementNode.Create(
    FForKeywordNode.Clone as TToken,
    FLoopVariableNode.Clone as TToken,
    FColonEqualsNode.Clone as TToken,
    FStartingValueNode.Clone as TASTNode,
    FDirectionNode.Clone as TToken,
    FEndingValueNode.Clone as TASTNode,
    FDoKeywordNode.Clone as TToken,
    FStatementNode.Clone as TASTNode);
end;

constructor TForStatementNode.Create(AForKeywordNode: TToken; ALoopVariableNode: TToken; AColonEqualsNode: TToken; AStartingValueNode: TASTNode; ADirectionNode: TToken; AEndingValueNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FForKeywordNode := AForKeywordNode;
  FLoopVariableNode := ALoopVariableNode;
  FColonEqualsNode := AColonEqualsNode;
  FStartingValueNode := AStartingValueNode;
  FDirectionNode := ADirectionNode;
  FEndingValueNode := AEndingValueNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  // Adding child nodes
  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ALoopVariableNode);
  FChildNodes.Add(AColonEqualsNode);
  FChildNodes.Add(AStartingValueNode);
  FChildNodes.Add(ADirectionNode);
  FChildNodes.Add(AEndingValueNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('LoopVariableNode', ALoopVariableNode));
  FProperties.Add(TASTNodeProperty.Create('ColonEqualsNode', AColonEqualsNode));
  FProperties.Add(TASTNodeProperty.Create('StartingValueNode', AStartingValueNode));
  FProperties.Add(TASTNodeProperty.Create('DirectionNode', ADirectionNode));
  FProperties.Add(TASTNodeProperty.Create('EndingValueNode', AEndingValueNode));
  FProperties.Add(TASTNodeProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
end;

{ TGotoStatementNode }

function TGotoStatementNode.Clone: TASTNode;
begin
  Result := TGotoStatementNode.Create(
    FGotoKeywordNode.Clone as TToken,
    FLabelIdNode.Clone as TToken);
end;

constructor TGotoStatementNode.Create(AGotoKeywordNode: TToken; ALabelIdNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FGotoKeywordNode := AGotoKeywordNode;
  FLabelIdNode := ALabelIdNode;

  // Adding child nodes
  FChildNodes.Add(AGotoKeywordNode);
  FChildNodes.Add(ALabelIdNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('GotoKeywordNode', AGotoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('LabelIdNode', ALabelIdNode));
end;

{ TIfStatementNode }

function TIfStatementNode.Clone: TASTNode;
begin
  Result := TIfStatementNode.Create(
    FIfKeywordNode.Clone as TToken,
    FConditionNode.Clone as TASTNode,
    FThenKeywordNode.Clone as TToken,
    FThenStatementNode.Clone as TASTNode,
    FElseKeywordNode.Clone as TToken,
    FElseStatementNode.Clone as TASTNode);
end;

constructor TIfStatementNode.Create(AIfKeywordNode: TToken; AConditionNode: TASTNode; AThenKeywordNode: TToken; AThenStatementNode: TASTNode; AElseKeywordNode: TToken; AElseStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FIfKeywordNode := AIfKeywordNode;
  FConditionNode := AConditionNode;
  FThenKeywordNode := AThenKeywordNode;
  FThenStatementNode := AThenStatementNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementNode := AElseStatementNode;

  // Adding child nodes
  FChildNodes.Add(AIfKeywordNode);
  FChildNodes.Add(AConditionNode);
  FChildNodes.Add(AThenKeywordNode);
  FChildNodes.Add(AThenStatementNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('IfKeywordNode', AIfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ConditionNode', AConditionNode));
  FProperties.Add(TASTNodeProperty.Create('ThenKeywordNode', AThenKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ThenStatementNode', AThenStatementNode));
  FProperties.Add(TASTNodeProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ElseStatementNode', AElseStatementNode));
end;

{ TInitSectionNode }

function TInitSectionNode.Clone: TASTNode;
begin
  Result := TInitSectionNode.Create(
    FInitializationKeywordNode.Clone as TToken,
    FInitializationStatementListNode.Clone as TListNode,
    FFinalizationKeywordNode.Clone as TToken,
    FFinalizationStatementListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TInitSectionNode.Create(AInitializationKeywordNode: TToken; AInitializationStatementListNode: TListNode; AFinalizationKeywordNode: TToken; AFinalizationStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FInitializationKeywordNode := AInitializationKeywordNode;
  FInitializationStatementListNode := AInitializationStatementListNode;
  FFinalizationKeywordNode := AFinalizationKeywordNode;
  FFinalizationStatementListNode := AFinalizationStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(AInitializationKeywordNode);
  FChildNodes.Add(AInitializationStatementListNode);
  FChildNodes.Add(AFinalizationKeywordNode);
  FChildNodes.Add(AFinalizationStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('InitializationKeywordNode', AInitializationKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('InitializationStatementListNode', AInitializationStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('FinalizationKeywordNode', AFinalizationKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('FinalizationStatementListNode', AFinalizationStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TInterfaceTypeNode }

function TInterfaceTypeNode.Clone: TASTNode;
begin
  Result := TInterfaceTypeNode.Create(
    FInterfaceKeywordNode.Clone as TToken,
    FOpenParenthesisNode.Clone as TToken,
    FBaseInterfaceNode.Clone as TASTNode,
    FCloseParenthesisNode.Clone as TToken,
    FOpenBracketNode.Clone as TToken,
    FGuidNode.Clone as TASTNode,
    FCloseBracketNode.Clone as TToken,
    FMethodAndPropertyListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TInterfaceTypeNode.Create(AInterfaceKeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseInterfaceNode: TASTNode; ACloseParenthesisNode: TToken; AOpenBracketNode: TToken; AGuidNode: TASTNode; ACloseBracketNode: TToken; AMethodAndPropertyListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FInterfaceKeywordNode := AInterfaceKeywordNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FBaseInterfaceNode := ABaseInterfaceNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FOpenBracketNode := AOpenBracketNode;
  FGuidNode := AGuidNode;
  FCloseBracketNode := ACloseBracketNode;
  FMethodAndPropertyListNode := AMethodAndPropertyListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(AInterfaceKeywordNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(ABaseInterfaceNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AGuidNode);
  FChildNodes.Add(ACloseBracketNode);
  FChildNodes.Add(AMethodAndPropertyListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('InterfaceKeywordNode', AInterfaceKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('BaseInterfaceNode', ABaseInterfaceNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('GuidNode', AGuidNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNodeProperty.Create('MethodAndPropertyListNode', AMethodAndPropertyListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TLabelDeclSectionNode }

function TLabelDeclSectionNode.Clone: TASTNode;
begin
  Result := TLabelDeclSectionNode.Create(
    FLabelKeywordNode.Clone as TToken,
    FLabelListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TLabelDeclSectionNode.Create(ALabelKeywordNode: TToken; ALabelListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FLabelKeywordNode := ALabelKeywordNode;
  FLabelListNode := ALabelListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ALabelKeywordNode);
  FChildNodes.Add(ALabelListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('LabelKeywordNode', ALabelKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('LabelListNode', ALabelListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TLabeledStatementNode }

function TLabeledStatementNode.Clone: TASTNode;
begin
  Result := TLabeledStatementNode.Create(
    FLabelIdNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FStatementNode.Clone as TASTNode);
end;

constructor TLabeledStatementNode.Create(ALabelIdNode: TToken; AColonNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FLabelIdNode := ALabelIdNode;
  FColonNode := AColonNode;
  FStatementNode := AStatementNode;

  // Adding child nodes
  FChildNodes.Add(ALabelIdNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('LabelIdNode', ALabelIdNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
end;

{ TMethodHeadingNode }

function TMethodHeadingNode.Clone: TASTNode;
begin
  Result := TMethodHeadingNode.Create(
    FClassKeywordNode.Clone as TToken,
    FMethodTypeNode.Clone as TToken,
    FNameNode.Clone as TASTNode,
    FOpenParenthesisNode.Clone as TToken,
    FParameterListNode.Clone as TListNode,
    FCloseParenthesisNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FReturnTypeNode.Clone as TASTNode,
    FDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TMethodHeadingNode.Create(AClassKeywordNode: TToken; AMethodTypeNode: TToken; ANameNode: TASTNode; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
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

  // Adding child nodes
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

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('ReturnTypeNode', AReturnTypeNode));
  FProperties.Add(TASTNodeProperty.Create('DirectiveListNode', ADirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

function TMethodHeadingNode.RequiresBody: Boolean;
var
  I: Integer;
begin
  // Methods that are not Forward or External must have a body!
  Result := True;
  // Iterate through method directives to find forward/external keyword
  for I := 0 to FDirectiveListNode.ItemsCount - 1 do
    if (FDirectiveListNode.Items[I] as TDirectiveNode).ForbidsBody then
    begin
      // forward/external keyword found -> stop iterating and return False
      Result := False;
      Break;
    end;
end;

{ TMethodImplementationNode }

function TMethodImplementationNode.Clone: TASTNode;
begin
  Result := TMethodImplementationNode.Create(
    FMethodHeadingNode.Clone as TMethodHeadingNode,
    FFancyBlockNode.Clone as TFancyBlockNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TMethodImplementationNode.Create(AMethodHeadingNode: TMethodHeadingNode; AFancyBlockNode: TFancyBlockNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FMethodHeadingNode := AMethodHeadingNode;
  FFancyBlockNode := AFancyBlockNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AMethodHeadingNode);
  FChildNodes.Add(AFancyBlockNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('MethodHeadingNode', AMethodHeadingNode));
  FProperties.Add(TASTNodeProperty.Create('FancyBlockNode', AFancyBlockNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TMethodResolutionNode }

function TMethodResolutionNode.Clone: TASTNode;
begin
  Result := TMethodResolutionNode.Create(
    FMethodTypeNode.Clone as TToken,
    FInterfaceMethodNode.Clone as TASTNode,
    FEqualSignNode.Clone as TToken,
    FImplementationMethodNode.Clone as TToken,
    FSemicolonNode.Clone as TToken);
end;

constructor TMethodResolutionNode.Create(AMethodTypeNode: TToken; AInterfaceMethodNode: TASTNode; AEqualSignNode: TToken; AImplementationMethodNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FMethodTypeNode := AMethodTypeNode;
  FInterfaceMethodNode := AInterfaceMethodNode;
  FEqualSignNode := AEqualSignNode;
  FImplementationMethodNode := AImplementationMethodNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AMethodTypeNode);
  FChildNodes.Add(AInterfaceMethodNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(AImplementationMethodNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNodeProperty.Create('InterfaceMethodNode', AInterfaceMethodNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('ImplementationMethodNode', AImplementationMethodNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TNumberFormatNode }

function TNumberFormatNode.Clone: TASTNode;
begin
  Result := TNumberFormatNode.Create(
    FValueNode.Clone as TASTNode,
    FSizeColonNode.Clone as TToken,
    FSizeNode.Clone as TASTNode,
    FPrecisionColonNode.Clone as TToken,
    FPrecisionNode.Clone as TASTNode);
end;

constructor TNumberFormatNode.Create(AValueNode: TASTNode; ASizeColonNode: TToken; ASizeNode: TASTNode; APrecisionColonNode: TToken; APrecisionNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FValueNode := AValueNode;
  FSizeColonNode := ASizeColonNode;
  FSizeNode := ASizeNode;
  FPrecisionColonNode := APrecisionColonNode;
  FPrecisionNode := APrecisionNode;

  // Adding child nodes
  FChildNodes.Add(AValueNode);
  FChildNodes.Add(ASizeColonNode);
  FChildNodes.Add(ASizeNode);
  FChildNodes.Add(APrecisionColonNode);
  FChildNodes.Add(APrecisionNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNodeProperty.Create('SizeColonNode', ASizeColonNode));
  FProperties.Add(TASTNodeProperty.Create('SizeNode', ASizeNode));
  FProperties.Add(TASTNodeProperty.Create('PrecisionColonNode', APrecisionColonNode));
  FProperties.Add(TASTNodeProperty.Create('PrecisionNode', APrecisionNode));
end;

{ TOpenArrayNode }

function TOpenArrayNode.Clone: TASTNode;
begin
  Result := TOpenArrayNode.Create(
    FArrayKeywordNode.Clone as TToken,
    FOfKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TOpenArrayNode.Create(AArrayKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FArrayKeywordNode := AArrayKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(AArrayKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ArrayKeywordNode', AArrayKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TPackageNode }

function TPackageNode.Clone: TASTNode;
begin
  Result := TPackageNode.Create(
    FPackageKeywordNode.Clone as TToken,
    FNameNode.Clone as TASTNode,
    FSemicolonNode.Clone as TToken,
    FRequiresClauseNode.Clone as TRequiresClauseNode,
    FContainsClauseNode.Clone as TUsesClauseNode,
    FAttributeListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken,
    FDotNode.Clone as TToken);
end;

constructor TPackageNode.Create(APackageKeywordNode: TToken; ANameNode: TASTNode; ASemicolonNode: TToken; ARequiresClauseNode: TRequiresClauseNode; AContainsClauseNode: TUsesClauseNode; AAttributeListNode: TListNode; AEndKeywordNode: TToken; ADotNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FPackageKeywordNode := APackageKeywordNode;
  FNameNode := ANameNode;
  FSemicolonNode := ASemicolonNode;
  FRequiresClauseNode := ARequiresClauseNode;
  FContainsClauseNode := AContainsClauseNode;
  FAttributeListNode := AAttributeListNode;
  FEndKeywordNode := AEndKeywordNode;
  FDotNode := ADotNode;

  // Adding child nodes
  FChildNodes.Add(APackageKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(ARequiresClauseNode);
  FChildNodes.Add(AContainsClauseNode);
  FChildNodes.Add(AAttributeListNode);
  FChildNodes.Add(AEndKeywordNode);
  FChildNodes.Add(ADotNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('PackageKeywordNode', APackageKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNodeProperty.Create('RequiresClauseNode', ARequiresClauseNode));
  FProperties.Add(TASTNodeProperty.Create('ContainsClauseNode', AContainsClauseNode));
  FProperties.Add(TASTNodeProperty.Create('AttributeListNode', AAttributeListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('DotNode', ADotNode));
end;

{ TPackedTypeNode }

function TPackedTypeNode.Clone: TASTNode;
begin
  Result := TPackedTypeNode.Create(
    FPackedKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TPackedTypeNode.Create(APackedKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FPackedKeywordNode := APackedKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(APackedKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('PackedKeywordNode', APackedKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TParameterNode }

function TParameterNode.Clone: TASTNode;
begin
  Result := TParameterNode.Create(
    FModifierNode.Clone as TToken,
    FNameListNode.Clone as TListNode,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FEqualSignNode.Clone as TToken,
    FDefaultValueNode.Clone as TASTNode);
end;

constructor TParameterNode.Create(AModifierNode: TToken; ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AEqualSignNode: TToken; ADefaultValueNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FModifierNode := AModifierNode;
  FNameListNode := ANameListNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FEqualSignNode := AEqualSignNode;
  FDefaultValueNode := ADefaultValueNode;

  // Adding child nodes
  FChildNodes.Add(AModifierNode);
  FChildNodes.Add(ANameListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ADefaultValueNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ModifierNode', AModifierNode));
  FProperties.Add(TASTNodeProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('DefaultValueNode', ADefaultValueNode));
end;

{ TParameterizedNode }

function TParameterizedNode.Clone: TASTNode;
begin
  Result := TParameterizedNode.Create(
    FLeftNode.Clone as TASTNode,
    FOpenDelimiterNode.Clone as TToken,
    FParameterListNode.Clone as TListNode,
    FCloseDelimiterNode.Clone as TToken);
end;

constructor TParameterizedNode.Create(ALeftNode: TASTNode; AOpenDelimiterNode: TToken; AParameterListNode: TListNode; ACloseDelimiterNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FLeftNode := ALeftNode;
  FOpenDelimiterNode := AOpenDelimiterNode;
  FParameterListNode := AParameterListNode;
  FCloseDelimiterNode := ACloseDelimiterNode;

  // Adding child nodes
  FChildNodes.Add(ALeftNode);
  FChildNodes.Add(AOpenDelimiterNode);
  FChildNodes.Add(AParameterListNode);
  FChildNodes.Add(ACloseDelimiterNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('LeftNode', ALeftNode));
  FProperties.Add(TASTNodeProperty.Create('OpenDelimiterNode', AOpenDelimiterNode));
  FProperties.Add(TASTNodeProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseDelimiterNode', ACloseDelimiterNode));
end;

{ TParenthesizedExpressionNode }

function TParenthesizedExpressionNode.Clone: TASTNode;
begin
  Result := TParenthesizedExpressionNode.Create(
    FOpenParenthesisNode.Clone as TToken,
    FExpressionNode.Clone as TASTNode,
    FCloseParenthesisNode.Clone as TToken);
end;

constructor TParenthesizedExpressionNode.Create(AOpenParenthesisNode: TToken; AExpressionNode: TASTNode; ACloseParenthesisNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOpenParenthesisNode := AOpenParenthesisNode;
  FExpressionNode := AExpressionNode;
  FCloseParenthesisNode := ACloseParenthesisNode;

  // Adding child nodes
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AExpressionNode);
  FChildNodes.Add(ACloseParenthesisNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ExpressionNode', AExpressionNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
end;

{ TPointerDereferenceNode }

function TPointerDereferenceNode.Clone: TASTNode;
begin
  Result := TPointerDereferenceNode.Create(
    FOperandNode.Clone as TASTNode,
    FCaretNode.Clone as TToken);
end;

constructor TPointerDereferenceNode.Create(AOperandNode: TASTNode; ACaretNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOperandNode := AOperandNode;
  FCaretNode := ACaretNode;

  // Adding child nodes
  FChildNodes.Add(AOperandNode);
  FChildNodes.Add(ACaretNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OperandNode', AOperandNode));
  FProperties.Add(TASTNodeProperty.Create('CaretNode', ACaretNode));
end;

{ TPointerTypeNode }

function TPointerTypeNode.Clone: TASTNode;
begin
  Result := TPointerTypeNode.Create(
    FCaretNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TPointerTypeNode.Create(ACaretNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FCaretNode := ACaretNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(ACaretNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('CaretNode', ACaretNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TProcedureTypeNode }

function TProcedureTypeNode.Clone: TASTNode;
begin
  Result := TProcedureTypeNode.Create(
    FMethodTypeNode.Clone as TToken,
    FOpenParenthesisNode.Clone as TToken,
    FParameterListNode.Clone as TListNode,
    FCloseParenthesisNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FReturnTypeNode.Clone as TASTNode,
    FFirstDirectiveListNode.Clone as TListNode,
    FOfKeywordNode.Clone as TToken,
    FObjectKeywordNode.Clone as TToken,
    FSecondDirectiveListNode.Clone as TListNode);
end;

constructor TProcedureTypeNode.Create(AMethodTypeNode: TToken; AOpenParenthesisNode: TToken; AParameterListNode: TListNode; ACloseParenthesisNode: TToken; AColonNode: TToken; AReturnTypeNode: TASTNode; AFirstDirectiveListNode: TListNode; AOfKeywordNode: TToken; AObjectKeywordNode: TToken; ASecondDirectiveListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
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

  // Adding child nodes
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

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('MethodTypeNode', AMethodTypeNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('ReturnTypeNode', AReturnTypeNode));
  FProperties.Add(TASTNodeProperty.Create('FirstDirectiveListNode', AFirstDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ObjectKeywordNode', AObjectKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('SecondDirectiveListNode', ASecondDirectiveListNode));
end;

{ TProgramNode }

function TProgramNode.Clone: TASTNode;
begin
  Result := TProgramNode.Create(
    FProgramKeywordNode.Clone as TToken,
    FNameNode.Clone as TToken,
    FNoiseOpenParenthesisNode.Clone as TToken,
    FNoiseContentListNode.Clone as TListNode,
    FNoiseCloseParenthesisNode.Clone as TToken,
    FSemicolonNode.Clone as TToken,
    FUsesClauseNode.Clone as TUsesClauseNode,
    FDeclarationListNode.Clone as TListNode,
    FInitSectionNode.Clone as TInitSectionNode,
    FDotNode.Clone as TToken);
end;

constructor TProgramNode.Create(AProgramKeywordNode: TToken; ANameNode: TToken; ANoiseOpenParenthesisNode: TToken; ANoiseContentListNode: TListNode; ANoiseCloseParenthesisNode: TToken; ASemicolonNode: TToken; AUsesClauseNode: TUsesClauseNode; ADeclarationListNode: TListNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);
begin
  inherited Create;

  // Assigning private members
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

  // Adding child nodes
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

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ProgramKeywordNode', AProgramKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('NoiseOpenParenthesisNode', ANoiseOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('NoiseContentListNode', ANoiseContentListNode));
  FProperties.Add(TASTNodeProperty.Create('NoiseCloseParenthesisNode', ANoiseCloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNodeProperty.Create('UsesClauseNode', AUsesClauseNode));
  FProperties.Add(TASTNodeProperty.Create('DeclarationListNode', ADeclarationListNode));
  FProperties.Add(TASTNodeProperty.Create('InitSectionNode', AInitSectionNode));
  FProperties.Add(TASTNodeProperty.Create('DotNode', ADotNode));
end;

{ TPropertyNode }

function TPropertyNode.Clone: TASTNode;
begin
  Result := TPropertyNode.Create(
    FClassKeywordNode.Clone as TToken,
    FPropertyKeywordNode.Clone as TToken,
    FNameNode.Clone as TToken,
    FOpenBracketNode.Clone as TToken,
    FParameterListNode.Clone as TListNode,
    FCloseBracketNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TPropertyNode.Create(AClassKeywordNode: TToken; APropertyKeywordNode: TToken; ANameNode: TToken; AOpenBracketNode: TToken; AParameterListNode: TListNode; ACloseBracketNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; ADirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
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

  // Adding child nodes
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

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ClassKeywordNode', AClassKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('PropertyKeywordNode', APropertyKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('ParameterListNode', AParameterListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('DirectiveListNode', ADirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TRaiseStatementNode }

function TRaiseStatementNode.Clone: TASTNode;
begin
  Result := TRaiseStatementNode.Create(
    FRaiseKeywordNode.Clone as TToken,
    FExceptionNode.Clone as TASTNode,
    FAtSemikeywordNode.Clone as TToken,
    FAddressNode.Clone as TASTNode);
end;

constructor TRaiseStatementNode.Create(ARaiseKeywordNode: TToken; AExceptionNode: TASTNode; AAtSemikeywordNode: TToken; AAddressNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FRaiseKeywordNode := ARaiseKeywordNode;
  FExceptionNode := AExceptionNode;
  FAtSemikeywordNode := AAtSemikeywordNode;
  FAddressNode := AAddressNode;

  // Adding child nodes
  FChildNodes.Add(ARaiseKeywordNode);
  FChildNodes.Add(AExceptionNode);
  FChildNodes.Add(AAtSemikeywordNode);
  FChildNodes.Add(AAddressNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('RaiseKeywordNode', ARaiseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ExceptionNode', AExceptionNode));
  FProperties.Add(TASTNodeProperty.Create('AtSemikeywordNode', AAtSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('AddressNode', AAddressNode));
end;

{ TRecordFieldConstantNode }

function TRecordFieldConstantNode.Clone: TASTNode;
begin
  Result := TRecordFieldConstantNode.Create(
    FNameNode.Clone as TASTNode,
    FColonNode.Clone as TToken,
    FValueNode.Clone as TASTNode);
end;

constructor TRecordFieldConstantNode.Create(ANameNode: TASTNode; AColonNode: TToken; AValueNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FValueNode := AValueNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AValueNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
end;

{ TRecordTypeNode }

function TRecordTypeNode.Clone: TASTNode;
begin
  Result := TRecordTypeNode.Create(
    FRecordKeywordNode.Clone as TToken,
    FContentListNode.Clone as TListNode,
    FVariantSectionNode.Clone as TVariantSectionNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TRecordTypeNode.Create(ARecordKeywordNode: TToken; AContentListNode: TListNode; AVariantSectionNode: TVariantSectionNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FRecordKeywordNode := ARecordKeywordNode;
  FContentListNode := AContentListNode;
  FVariantSectionNode := AVariantSectionNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ARecordKeywordNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AVariantSectionNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('RecordKeywordNode', ARecordKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNodeProperty.Create('VariantSectionNode', AVariantSectionNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TRepeatStatementNode }

function TRepeatStatementNode.Clone: TASTNode;
begin
  Result := TRepeatStatementNode.Create(
    FRepeatKeywordNode.Clone as TToken,
    FStatementListNode.Clone as TListNode,
    FUntilKeywordNode.Clone as TToken,
    FConditionNode.Clone as TASTNode);
end;

constructor TRepeatStatementNode.Create(ARepeatKeywordNode: TToken; AStatementListNode: TListNode; AUntilKeywordNode: TToken; AConditionNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FRepeatKeywordNode := ARepeatKeywordNode;
  FStatementListNode := AStatementListNode;
  FUntilKeywordNode := AUntilKeywordNode;
  FConditionNode := AConditionNode;

  // Adding child nodes
  FChildNodes.Add(ARepeatKeywordNode);
  FChildNodes.Add(AStatementListNode);
  FChildNodes.Add(AUntilKeywordNode);
  FChildNodes.Add(AConditionNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('RepeatKeywordNode', ARepeatKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementListNode', AStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('UntilKeywordNode', AUntilKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ConditionNode', AConditionNode));
end;

{ TRequiresClauseNode }

function TRequiresClauseNode.Clone: TASTNode;
begin
  Result := TRequiresClauseNode.Create(
    FRequiresSemikeywordNode.Clone as TToken,
    FPackageListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TRequiresClauseNode.Create(ARequiresSemikeywordNode: TToken; APackageListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FRequiresSemikeywordNode := ARequiresSemikeywordNode;
  FPackageListNode := APackageListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ARequiresSemikeywordNode);
  FChildNodes.Add(APackageListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('RequiresSemikeywordNode', ARequiresSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('PackageListNode', APackageListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TSetLiteralNode }

function TSetLiteralNode.Clone: TASTNode;
begin
  Result := TSetLiteralNode.Create(
    FOpenBracketNode.Clone as TToken,
    FItemListNode.Clone as TListNode,
    FCloseBracketNode.Clone as TToken);
end;

constructor TSetLiteralNode.Create(AOpenBracketNode: TToken; AItemListNode: TListNode; ACloseBracketNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FOpenBracketNode := AOpenBracketNode;
  FItemListNode := AItemListNode;
  FCloseBracketNode := ACloseBracketNode;

  // Adding child nodes
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(AItemListNode);
  FChildNodes.Add(ACloseBracketNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('ItemListNode', AItemListNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TSetOfNode }

function TSetOfNode.Clone: TASTNode;
begin
  Result := TSetOfNode.Create(
    FSetKeywordNode.Clone as TToken,
    FOfKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode);
end;

constructor TSetOfNode.Create(ASetKeywordNode: TToken; AOfKeywordNode: TToken; ATypeNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FSetKeywordNode := ASetKeywordNode;
  FOfKeywordNode := AOfKeywordNode;
  FTypeNode := ATypeNode;

  // Adding child nodes
  FChildNodes.Add(ASetKeywordNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(ATypeNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('SetKeywordNode', ASetKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
end;

{ TStringOfLengthNode }

function TStringOfLengthNode.Clone: TASTNode;
begin
  Result := TStringOfLengthNode.Create(
    FStringKeywordNode.Clone as TToken,
    FOpenBracketNode.Clone as TToken,
    FLengthNode.Clone as TASTNode,
    FCloseBracketNode.Clone as TToken);
end;

constructor TStringOfLengthNode.Create(AStringKeywordNode: TToken; AOpenBracketNode: TToken; ALengthNode: TASTNode; ACloseBracketNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FStringKeywordNode := AStringKeywordNode;
  FOpenBracketNode := AOpenBracketNode;
  FLengthNode := ALengthNode;
  FCloseBracketNode := ACloseBracketNode;

  // Adding child nodes
  FChildNodes.Add(AStringKeywordNode);
  FChildNodes.Add(AOpenBracketNode);
  FChildNodes.Add(ALengthNode);
  FChildNodes.Add(ACloseBracketNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('StringKeywordNode', AStringKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OpenBracketNode', AOpenBracketNode));
  FProperties.Add(TASTNodeProperty.Create('LengthNode', ALengthNode));
  FProperties.Add(TASTNodeProperty.Create('CloseBracketNode', ACloseBracketNode));
end;

{ TTryExceptNode }

function TTryExceptNode.Clone: TASTNode;
begin
  Result := TTryExceptNode.Create(
    FTryKeywordNode.Clone as TToken,
    FTryStatementListNode.Clone as TListNode,
    FExceptKeywordNode.Clone as TToken,
    FExceptionItemListNode.Clone as TListNode,
    FElseKeywordNode.Clone as TToken,
    FElseStatementListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TTryExceptNode.Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AExceptKeywordNode: TToken; AExceptionItemListNode: TListNode; AElseKeywordNode: TToken; AElseStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FTryKeywordNode := ATryKeywordNode;
  FTryStatementListNode := ATryStatementListNode;
  FExceptKeywordNode := AExceptKeywordNode;
  FExceptionItemListNode := AExceptionItemListNode;
  FElseKeywordNode := AElseKeywordNode;
  FElseStatementListNode := AElseStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ATryKeywordNode);
  FChildNodes.Add(ATryStatementListNode);
  FChildNodes.Add(AExceptKeywordNode);
  FChildNodes.Add(AExceptionItemListNode);
  FChildNodes.Add(AElseKeywordNode);
  FChildNodes.Add(AElseStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('TryKeywordNode', ATryKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TryStatementListNode', ATryStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('ExceptKeywordNode', AExceptKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ExceptionItemListNode', AExceptionItemListNode));
  FProperties.Add(TASTNodeProperty.Create('ElseKeywordNode', AElseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ElseStatementListNode', AElseStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTryFinallyNode }

function TTryFinallyNode.Clone: TASTNode;
begin
  Result := TTryFinallyNode.Create(
    FTryKeywordNode.Clone as TToken,
    FTryStatementListNode.Clone as TListNode,
    FFinallyKeywordNode.Clone as TToken,
    FFinallyStatementListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TTryFinallyNode.Create(ATryKeywordNode: TToken; ATryStatementListNode: TListNode; AFinallyKeywordNode: TToken; AFinallyStatementListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FTryKeywordNode := ATryKeywordNode;
  FTryStatementListNode := ATryStatementListNode;
  FFinallyKeywordNode := AFinallyKeywordNode;
  FFinallyStatementListNode := AFinallyStatementListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ATryKeywordNode);
  FChildNodes.Add(ATryStatementListNode);
  FChildNodes.Add(AFinallyKeywordNode);
  FChildNodes.Add(AFinallyStatementListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('TryKeywordNode', ATryKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TryStatementListNode', ATryStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('FinallyKeywordNode', AFinallyKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('FinallyStatementListNode', AFinallyStatementListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTypeDeclNode }

function TTypeDeclNode.Clone: TASTNode;
begin
  Result := TTypeDeclNode.Create(
    FNameNode.Clone as TToken,
    FEqualSignNode.Clone as TToken,
    FTypeKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FPortabilityDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TTypeDeclNode.Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeKeywordNode: TToken; ATypeNode: TASTNode; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FTypeKeywordNode := ATypeKeywordNode;
  FTypeNode := ATypeNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TTypeForwardDeclarationNode }

function TTypeForwardDeclarationNode.Clone: TASTNode;
begin
  Result := TTypeForwardDeclarationNode.Create(
    FNameNode.Clone as TToken,
    FEqualSignNode.Clone as TToken,
    FTypeNode.Clone as TToken,
    FSemicolonNode.Clone as TToken);
end;

constructor TTypeForwardDeclarationNode.Create(ANameNode: TToken; AEqualSignNode: TToken; ATypeNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FEqualSignNode := AEqualSignNode;
  FTypeNode := ATypeNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AEqualSignNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TTypeHelperNode }

function TTypeHelperNode.Clone: TASTNode;
begin
  Result := TTypeHelperNode.Create(
    FTypeKeywordNode.Clone as TToken,
    FHelperSemikeywordNode.Clone as TToken,
    FOpenParenthesisNode.Clone as TToken,
    FBaseHelperTypeNode.Clone as TASTNode,
    FCloseParenthesisNode.Clone as TToken,
    FForKeywordNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FContentListNode.Clone as TListNode,
    FEndKeywordNode.Clone as TToken);
end;

constructor TTypeHelperNode.Create(ATypeKeywordNode: TToken; AHelperSemikeywordNode: TToken; AOpenParenthesisNode: TToken; ABaseHelperTypeNode: TASTNode; ACloseParenthesisNode: TToken; AForKeywordNode: TToken; ATypeNode: TASTNode; AContentListNode: TListNode; AEndKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FTypeKeywordNode := ATypeKeywordNode;
  FHelperSemikeywordNode := AHelperSemikeywordNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FBaseHelperTypeNode := ABaseHelperTypeNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FForKeywordNode := AForKeywordNode;
  FTypeNode := ATypeNode;
  FContentListNode := AContentListNode;
  FEndKeywordNode := AEndKeywordNode;

  // Adding child nodes
  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(AHelperSemikeywordNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(ABaseHelperTypeNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(AForKeywordNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AContentListNode);
  FChildNodes.Add(AEndKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('HelperSemikeywordNode', AHelperSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('BaseHelperTypeNode', ABaseHelperTypeNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('ForKeywordNode', AForKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('ContentListNode', AContentListNode));
  FProperties.Add(TASTNodeProperty.Create('EndKeywordNode', AEndKeywordNode));
end;

{ TTypeSectionNode }

function TTypeSectionNode.Clone: TASTNode;
begin
  Result := TTypeSectionNode.Create(
    FTypeKeywordNode.Clone as TToken,
    FTypeListNode.Clone as TListNode);
end;

constructor TTypeSectionNode.Create(ATypeKeywordNode: TToken; ATypeListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FTypeKeywordNode := ATypeKeywordNode;
  FTypeListNode := ATypeListNode;

  // Adding child nodes
  FChildNodes.Add(ATypeKeywordNode);
  FChildNodes.Add(ATypeListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('TypeKeywordNode', ATypeKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('TypeListNode', ATypeListNode));
end;

{ TUnaryOperationNode }

function TUnaryOperationNode.Clone: TASTNode;
begin
  Result := TUnaryOperationNode.Create(
    FOperatorNode.Clone as TToken,
    FOperandNode.Clone as TASTNode);
end;

constructor TUnaryOperationNode.Create(AOperatorNode: TToken; AOperandNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FOperatorNode := AOperatorNode;
  FOperandNode := AOperandNode;

  // Adding child nodes
  FChildNodes.Add(AOperatorNode);
  FChildNodes.Add(AOperandNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('OperatorNode', AOperatorNode));
  FProperties.Add(TASTNodeProperty.Create('OperandNode', AOperandNode));
end;

{ TUnitNode }

function TUnitNode.Clone: TASTNode;
begin
  Result := TUnitNode.Create(
    FUnitKeywordNode.Clone as TToken,
    FUnitNameNode.Clone as TToken,
    FPortabilityDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken,
    FInterfaceSectionNode.Clone as TUnitSectionNode,
    FImplementationSectionNode.Clone as TUnitSectionNode,
    FInitSectionNode.Clone as TInitSectionNode,
    FDotNode.Clone as TToken);
end;

constructor TUnitNode.Create(AUnitKeywordNode: TToken; AUnitNameNode: TToken; APortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken; AInterfaceSectionNode: TUnitSectionNode; AImplementationSectionNode: TUnitSectionNode; AInitSectionNode: TInitSectionNode; ADotNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FUnitKeywordNode := AUnitKeywordNode;
  FUnitNameNode := AUnitNameNode;
  FPortabilityDirectiveListNode := APortabilityDirectiveListNode;
  FSemicolonNode := ASemicolonNode;
  FInterfaceSectionNode := AInterfaceSectionNode;
  FImplementationSectionNode := AImplementationSectionNode;
  FInitSectionNode := AInitSectionNode;
  FDotNode := ADotNode;

  // Adding child nodes
  FChildNodes.Add(AUnitKeywordNode);
  FChildNodes.Add(AUnitNameNode);
  FChildNodes.Add(APortabilityDirectiveListNode);
  FChildNodes.Add(ASemicolonNode);
  FChildNodes.Add(AInterfaceSectionNode);
  FChildNodes.Add(AImplementationSectionNode);
  FChildNodes.Add(AInitSectionNode);
  FChildNodes.Add(ADotNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('UnitKeywordNode', AUnitKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('UnitNameNode', AUnitNameNode));
  FProperties.Add(TASTNodeProperty.Create('PortabilityDirectiveListNode', APortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
  FProperties.Add(TASTNodeProperty.Create('InterfaceSectionNode', AInterfaceSectionNode));
  FProperties.Add(TASTNodeProperty.Create('ImplementationSectionNode', AImplementationSectionNode));
  FProperties.Add(TASTNodeProperty.Create('InitSectionNode', AInitSectionNode));
  FProperties.Add(TASTNodeProperty.Create('DotNode', ADotNode));
end;

{ TUnitSectionNode }

function TUnitSectionNode.Clone: TASTNode;
begin
  Result := TUnitSectionNode.Create(
    FHeaderKeywordNode.Clone as TToken,
    FUsesClauseNode.Clone as TUsesClauseNode,
    FContentListNode.Clone as TListNode);
end;

constructor TUnitSectionNode.Create(AHeaderKeywordNode: TToken; AUsesClauseNode: TUsesClauseNode; AContentListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FHeaderKeywordNode := AHeaderKeywordNode;
  FUsesClauseNode := AUsesClauseNode;
  FContentListNode := AContentListNode;

  // Adding child nodes
  FChildNodes.Add(AHeaderKeywordNode);
  FChildNodes.Add(AUsesClauseNode);
  FChildNodes.Add(AContentListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('HeaderKeywordNode', AHeaderKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('UsesClauseNode', AUsesClauseNode));
  FProperties.Add(TASTNodeProperty.Create('ContentListNode', AContentListNode));
end;

{ TUsedUnitNode }

function TUsedUnitNode.Clone: TASTNode;
begin
  Result := TUsedUnitNode.Create(
    FNameNode.Clone as TASTNode,
    FInKeywordNode.Clone as TToken,
    FFileNameNode.Clone as TToken);
end;

constructor TUsedUnitNode.Create(ANameNode: TASTNode; AInKeywordNode: TToken; AFileNameNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FNameNode := ANameNode;
  FInKeywordNode := AInKeywordNode;
  FFileNameNode := AFileNameNode;

  // Adding child nodes
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AInKeywordNode);
  FChildNodes.Add(AFileNameNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('InKeywordNode', AInKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('FileNameNode', AFileNameNode));
end;

{ TUsesClauseNode }

function TUsesClauseNode.Clone: TASTNode;
begin
  Result := TUsesClauseNode.Create(
    FUsesKeywordNode.Clone as TToken,
    FUnitListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TUsesClauseNode.Create(AUsesKeywordNode: TToken; AUnitListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FUsesKeywordNode := AUsesKeywordNode;
  FUnitListNode := AUnitListNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AUsesKeywordNode);
  FChildNodes.Add(AUnitListNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('UsesKeywordNode', AUsesKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('UnitListNode', AUnitListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVarDeclNode }

function TVarDeclNode.Clone: TASTNode;
begin
  Result := TVarDeclNode.Create(
    FNameListNode.Clone as TListNode,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FFirstPortabilityDirectiveListNode.Clone as TListNode,
    FAbsoluteSemikeywordNode.Clone as TToken,
    FAbsoluteAddressNode.Clone as TASTNode,
    FEqualSignNode.Clone as TToken,
    FValueNode.Clone as TASTNode,
    FSecondPortabilityDirectiveListNode.Clone as TListNode,
    FSemicolonNode.Clone as TToken);
end;

constructor TVarDeclNode.Create(ANameListNode: TListNode; AColonNode: TToken; ATypeNode: TASTNode; AFirstPortabilityDirectiveListNode: TListNode; AAbsoluteSemikeywordNode: TToken; AAbsoluteAddressNode: TASTNode; AEqualSignNode: TToken; AValueNode: TASTNode; ASecondPortabilityDirectiveListNode: TListNode; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
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

  // Adding child nodes
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

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('NameListNode', ANameListNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('FirstPortabilityDirectiveListNode', AFirstPortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('AbsoluteSemikeywordNode', AAbsoluteSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('AbsoluteAddressNode', AAbsoluteAddressNode));
  FProperties.Add(TASTNodeProperty.Create('EqualSignNode', AEqualSignNode));
  FProperties.Add(TASTNodeProperty.Create('ValueNode', AValueNode));
  FProperties.Add(TASTNodeProperty.Create('SecondPortabilityDirectiveListNode', ASecondPortabilityDirectiveListNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVarSectionNode }

function TVarSectionNode.Clone: TASTNode;
begin
  Result := TVarSectionNode.Create(
    FVarKeywordNode.Clone as TToken,
    FVarListNode.Clone as TListNode);
end;

constructor TVarSectionNode.Create(AVarKeywordNode: TToken; AVarListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FVarKeywordNode := AVarKeywordNode;
  FVarListNode := AVarListNode;

  // Adding child nodes
  FChildNodes.Add(AVarKeywordNode);
  FChildNodes.Add(AVarListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('VarKeywordNode', AVarKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('VarListNode', AVarListNode));
end;

{ TVariantGroupNode }

function TVariantGroupNode.Clone: TASTNode;
begin
  Result := TVariantGroupNode.Create(
    FValueListNode.Clone as TListNode,
    FColonNode.Clone as TToken,
    FOpenParenthesisNode.Clone as TToken,
    FFieldDeclListNode.Clone as TListNode,
    FVariantSectionNode.Clone as TVariantSectionNode,
    FCloseParenthesisNode.Clone as TToken,
    FSemicolonNode.Clone as TToken);
end;

constructor TVariantGroupNode.Create(AValueListNode: TListNode; AColonNode: TToken; AOpenParenthesisNode: TToken; AFieldDeclListNode: TListNode; AVariantSectionNode: TVariantSectionNode; ACloseParenthesisNode: TToken; ASemicolonNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FValueListNode := AValueListNode;
  FColonNode := AColonNode;
  FOpenParenthesisNode := AOpenParenthesisNode;
  FFieldDeclListNode := AFieldDeclListNode;
  FVariantSectionNode := AVariantSectionNode;
  FCloseParenthesisNode := ACloseParenthesisNode;
  FSemicolonNode := ASemicolonNode;

  // Adding child nodes
  FChildNodes.Add(AValueListNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(AOpenParenthesisNode);
  FChildNodes.Add(AFieldDeclListNode);
  FChildNodes.Add(AVariantSectionNode);
  FChildNodes.Add(ACloseParenthesisNode);
  FChildNodes.Add(ASemicolonNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('ValueListNode', AValueListNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('OpenParenthesisNode', AOpenParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('FieldDeclListNode', AFieldDeclListNode));
  FProperties.Add(TASTNodeProperty.Create('VariantSectionNode', AVariantSectionNode));
  FProperties.Add(TASTNodeProperty.Create('CloseParenthesisNode', ACloseParenthesisNode));
  FProperties.Add(TASTNodeProperty.Create('SemicolonNode', ASemicolonNode));
end;

{ TVariantSectionNode }

function TVariantSectionNode.Clone: TASTNode;
begin
  Result := TVariantSectionNode.Create(
    FCaseKeywordNode.Clone as TToken,
    FNameNode.Clone as TToken,
    FColonNode.Clone as TToken,
    FTypeNode.Clone as TASTNode,
    FOfKeywordNode.Clone as TToken,
    FVariantGroupListNode.Clone as TListNode);
end;

constructor TVariantSectionNode.Create(ACaseKeywordNode: TToken; ANameNode: TToken; AColonNode: TToken; ATypeNode: TASTNode; AOfKeywordNode: TToken; AVariantGroupListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FCaseKeywordNode := ACaseKeywordNode;
  FNameNode := ANameNode;
  FColonNode := AColonNode;
  FTypeNode := ATypeNode;
  FOfKeywordNode := AOfKeywordNode;
  FVariantGroupListNode := AVariantGroupListNode;

  // Adding child nodes
  FChildNodes.Add(ACaseKeywordNode);
  FChildNodes.Add(ANameNode);
  FChildNodes.Add(AColonNode);
  FChildNodes.Add(ATypeNode);
  FChildNodes.Add(AOfKeywordNode);
  FChildNodes.Add(AVariantGroupListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('CaseKeywordNode', ACaseKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('NameNode', ANameNode));
  FProperties.Add(TASTNodeProperty.Create('ColonNode', AColonNode));
  FProperties.Add(TASTNodeProperty.Create('TypeNode', ATypeNode));
  FProperties.Add(TASTNodeProperty.Create('OfKeywordNode', AOfKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('VariantGroupListNode', AVariantGroupListNode));
end;

{ TVisibilityNode }

function TVisibilityNode.Clone: TASTNode;
begin
  Result := TVisibilityNode.Create(
    FStrictSemikeywordNode.Clone as TToken,
    FVisibilityKeywordNode.Clone as TToken);
end;

constructor TVisibilityNode.Create(AStrictSemikeywordNode: TToken; AVisibilityKeywordNode: TToken);
begin
  inherited Create;

  // Assigning private members
  FStrictSemikeywordNode := AStrictSemikeywordNode;
  FVisibilityKeywordNode := AVisibilityKeywordNode;

  // Adding child nodes
  FChildNodes.Add(AStrictSemikeywordNode);
  FChildNodes.Add(AVisibilityKeywordNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('StrictSemikeywordNode', AStrictSemikeywordNode));
  FProperties.Add(TASTNodeProperty.Create('VisibilityKeywordNode', AVisibilityKeywordNode));
end;

{ TVisibilitySectionNode }

function TVisibilitySectionNode.Clone: TASTNode;
begin
  Result := TVisibilitySectionNode.Create(
    FVisibilityNode.Clone as TVisibilityNode,
    FContentListNode.Clone as TListNode);
end;

constructor TVisibilitySectionNode.Create(AVisibilityNode: TVisibilityNode; AContentListNode: TListNode);
begin
  inherited Create;

  // Assigning private members
  FVisibilityNode := AVisibilityNode;
  FContentListNode := AContentListNode;

  // Adding child nodes
  FChildNodes.Add(AVisibilityNode);
  FChildNodes.Add(AContentListNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('VisibilityNode', AVisibilityNode));
  FProperties.Add(TASTNodeProperty.Create('ContentListNode', AContentListNode));
end;

{ TWhileStatementNode }

function TWhileStatementNode.Clone: TASTNode;
begin
  Result := TWhileStatementNode.Create(
    FWhileKeywordNode.Clone as TToken,
    FConditionNode.Clone as TASTNode,
    FDoKeywordNode.Clone as TToken,
    FStatementNode.Clone as TASTNode);
end;

constructor TWhileStatementNode.Create(AWhileKeywordNode: TToken; AConditionNode: TASTNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FWhileKeywordNode := AWhileKeywordNode;
  FConditionNode := AConditionNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  // Adding child nodes
  FChildNodes.Add(AWhileKeywordNode);
  FChildNodes.Add(AConditionNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('WhileKeywordNode', AWhileKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ConditionNode', AConditionNode));
  FProperties.Add(TASTNodeProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
end;

{ TWithStatementNode }

function TWithStatementNode.Clone: TASTNode;
begin
  Result := TWithStatementNode.Create(
    FWithKeywordNode.Clone as TToken,
    FExpressionListNode.Clone as TListNode,
    FDoKeywordNode.Clone as TToken,
    FStatementNode.Clone as TASTNode);
end;

constructor TWithStatementNode.Create(AWithKeywordNode: TToken; AExpressionListNode: TListNode; ADoKeywordNode: TToken; AStatementNode: TASTNode);
begin
  inherited Create;

  // Assigning private members
  FWithKeywordNode := AWithKeywordNode;
  FExpressionListNode := AExpressionListNode;
  FDoKeywordNode := ADoKeywordNode;
  FStatementNode := AStatementNode;

  // Adding child nodes
  FChildNodes.Add(AWithKeywordNode);
  FChildNodes.Add(AExpressionListNode);
  FChildNodes.Add(ADoKeywordNode);
  FChildNodes.Add(AStatementNode);

  // Adding properties
  FProperties.Add(TASTNodeProperty.Create('WithKeywordNode', AWithKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('ExpressionListNode', AExpressionListNode));
  FProperties.Add(TASTNodeProperty.Create('DoKeywordNode', ADoKeywordNode));
  FProperties.Add(TASTNodeProperty.Create('StatementNode', AStatementNode));
end;

end.
