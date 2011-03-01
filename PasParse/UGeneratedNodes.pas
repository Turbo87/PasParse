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
  TOpenArrayConstructorNode = class;
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

  TOpenArrayConstructorNode = class(TNonTerminalNode)
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
var
  AArrayKeywordNode: TToken;
  AOpenBracketNode: TToken;
  AIndexListNode: TListNode;
  ACloseBracketNode: TToken;
  AOfKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FArrayKeywordNode <> nil then
    AArrayKeywordNode := (FArrayKeywordNode.Clone as TToken)
  else
    AArrayKeywordNode := nil;

  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FIndexListNode <> nil then
    AIndexListNode := (FIndexListNode.Clone as TListNode)
  else
    AIndexListNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TArrayTypeNode.Create(
    AArrayKeywordNode,
    AOpenBracketNode,
    AIndexListNode,
    ACloseBracketNode,
    AOfKeywordNode,
    ATypeNode);
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
var
  AAsmKeywordNode: TToken;
  AEndKeywordNode: TToken;
begin
  if FAsmKeywordNode <> nil then
    AAsmKeywordNode := (FAsmKeywordNode.Clone as TToken)
  else
    AAsmKeywordNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TAssemblerStatementNode.Create(
    AAsmKeywordNode,
    AEndKeywordNode);
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
var
  AOpenBracketNode: TToken;
  AScopeNode: TToken;
  AColonNode: TToken;
  AValueNode: TASTNode;
  ACloseBracketNode: TToken;
begin
  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FScopeNode <> nil then
    AScopeNode := (FScopeNode.Clone as TToken)
  else
    AScopeNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  Result := TAttributeNode.Create(
    AOpenBracketNode,
    AScopeNode,
    AColonNode,
    AValueNode,
    ACloseBracketNode);
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
var
  ALeftNode: TASTNode;
  AOperatorNode: TToken;
  ARightNode: TASTNode;
begin
  if FLeftNode <> nil then
    ALeftNode := (FLeftNode.Clone as TASTNode)
  else
    ALeftNode := nil;

  if FOperatorNode <> nil then
    AOperatorNode := (FOperatorNode.Clone as TToken)
  else
    AOperatorNode := nil;

  if FRightNode <> nil then
    ARightNode := (FRightNode.Clone as TASTNode)
  else
    ARightNode := nil;

  Result := TBinaryOperationNode.Create(
    ALeftNode,
    AOperatorNode,
    ARightNode);
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
var
  ABeginKeywordNode: TToken;
  AStatementListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FBeginKeywordNode <> nil then
    ABeginKeywordNode := (FBeginKeywordNode.Clone as TToken)
  else
    ABeginKeywordNode := nil;

  if FStatementListNode <> nil then
    AStatementListNode := (FStatementListNode.Clone as TListNode)
  else
    AStatementListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TBlockNode.Create(
    ABeginKeywordNode,
    AStatementListNode,
    AEndKeywordNode);
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
var
  AValueListNode: TListNode;
  AColonNode: TToken;
  AStatementNode: TASTNode;
  ASemicolonNode: TToken;
begin
  if FValueListNode <> nil then
    AValueListNode := (FValueListNode.Clone as TListNode)
  else
    AValueListNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TCaseSelectorNode.Create(
    AValueListNode,
    AColonNode,
    AStatementNode,
    ASemicolonNode);
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
var
  ACaseKeywordNode: TToken;
  AExpressionNode: TASTNode;
  AOfKeywordNode: TToken;
  ASelectorListNode: TListNode;
  AElseKeywordNode: TToken;
  AElseStatementListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FCaseKeywordNode <> nil then
    ACaseKeywordNode := (FCaseKeywordNode.Clone as TToken)
  else
    ACaseKeywordNode := nil;

  if FExpressionNode <> nil then
    AExpressionNode := (FExpressionNode.Clone as TASTNode)
  else
    AExpressionNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FSelectorListNode <> nil then
    ASelectorListNode := (FSelectorListNode.Clone as TListNode)
  else
    ASelectorListNode := nil;

  if FElseKeywordNode <> nil then
    AElseKeywordNode := (FElseKeywordNode.Clone as TToken)
  else
    AElseKeywordNode := nil;

  if FElseStatementListNode <> nil then
    AElseStatementListNode := (FElseStatementListNode.Clone as TListNode)
  else
    AElseStatementListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TCaseStatementNode.Create(
    ACaseKeywordNode,
    AExpressionNode,
    AOfKeywordNode,
    ASelectorListNode,
    AElseKeywordNode,
    AElseStatementListNode,
    AEndKeywordNode);
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
var
  AClassKeywordNode: TToken;
  AOfKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FClassKeywordNode <> nil then
    AClassKeywordNode := (FClassKeywordNode.Clone as TToken)
  else
    AClassKeywordNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TClassOfNode.Create(
    AClassKeywordNode,
    AOfKeywordNode,
    ATypeNode);
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
var
  AClassKeywordNode: TToken;
  ADispositionNode: TToken;
  AOpenParenthesisNode: TToken;
  AInheritanceListNode: TListNode;
  ACloseParenthesisNode: TToken;
  AContentListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FClassKeywordNode <> nil then
    AClassKeywordNode := (FClassKeywordNode.Clone as TToken)
  else
    AClassKeywordNode := nil;

  if FDispositionNode <> nil then
    ADispositionNode := (FDispositionNode.Clone as TToken)
  else
    ADispositionNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FInheritanceListNode <> nil then
    AInheritanceListNode := (FInheritanceListNode.Clone as TListNode)
  else
    AInheritanceListNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FContentListNode <> nil then
    AContentListNode := (FContentListNode.Clone as TListNode)
  else
    AContentListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TClassTypeNode.Create(
    AClassKeywordNode,
    ADispositionNode,
    AOpenParenthesisNode,
    AInheritanceListNode,
    ACloseParenthesisNode,
    AContentListNode,
    AEndKeywordNode);
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
var
  AConstKeywordNode: TToken;
  AConstListNode: TListNode;
begin
  if FConstKeywordNode <> nil then
    AConstKeywordNode := (FConstKeywordNode.Clone as TToken)
  else
    AConstKeywordNode := nil;

  if FConstListNode <> nil then
    AConstListNode := (FConstListNode.Clone as TListNode)
  else
    AConstListNode := nil;

  Result := TConstSectionNode.Create(
    AConstKeywordNode,
    AConstListNode);
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
var
  ANameNode: TToken;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  AEqualSignNode: TToken;
  AValueNode: TASTNode;
  APortabilityDirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  if FPortabilityDirectiveListNode <> nil then
    APortabilityDirectiveListNode := (FPortabilityDirectiveListNode.Clone as TListNode)
  else
    APortabilityDirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TConstantDeclNode.Create(
    ANameNode,
    AColonNode,
    ATypeNode,
    AEqualSignNode,
    AValueNode,
    APortabilityDirectiveListNode,
    ASemicolonNode);
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
var
  AOpenParenthesisNode: TToken;
  AItemListNode: TListNode;
  ACloseParenthesisNode: TToken;
begin
  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FItemListNode <> nil then
    AItemListNode := (FItemListNode.Clone as TListNode)
  else
    AItemListNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  Result := TConstantListNode.Create(
    AOpenParenthesisNode,
    AItemListNode,
    ACloseParenthesisNode);
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
var
  ASemicolonNode: TToken;
  AKeywordNode: TToken;
  AValueNode: TASTNode;
  ADataNode: TASTNode;
begin
  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  if FKeywordNode <> nil then
    AKeywordNode := (FKeywordNode.Clone as TToken)
  else
    AKeywordNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  if FDataNode <> nil then
    ADataNode := (FDataNode.Clone as TASTNode)
  else
    ADataNode := nil;

  Result := TDirectiveNode.Create(
    ASemicolonNode,
    AKeywordNode,
    AValueNode,
    ADataNode);
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
var
  ANameNode: TToken;
  AEqualSignNode: TToken;
  AValueNode: TASTNode;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  Result := TEnumeratedTypeElementNode.Create(
    ANameNode,
    AEqualSignNode,
    AValueNode);
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
var
  AOpenParenthesisNode: TToken;
  AItemListNode: TListNode;
  ACloseParenthesisNode: TToken;
begin
  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FItemListNode <> nil then
    AItemListNode := (FItemListNode.Clone as TListNode)
  else
    AItemListNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  Result := TEnumeratedTypeNode.Create(
    AOpenParenthesisNode,
    AItemListNode,
    ACloseParenthesisNode);
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
var
  AOnSemikeywordNode: TToken;
  ANameNode: TToken;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  ADoKeywordNode: TToken;
  AStatementNode: TASTNode;
  ASemicolonNode: TToken;
begin
  if FOnSemikeywordNode <> nil then
    AOnSemikeywordNode := (FOnSemikeywordNode.Clone as TToken)
  else
    AOnSemikeywordNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FDoKeywordNode <> nil then
    ADoKeywordNode := (FDoKeywordNode.Clone as TToken)
  else
    ADoKeywordNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TExceptionItemNode.Create(
    AOnSemikeywordNode,
    ANameNode,
    AColonNode,
    ATypeNode,
    ADoKeywordNode,
    AStatementNode,
    ASemicolonNode);
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
var
  ANameNode: TASTNode;
  ASpecifierListNode: TListNode;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TASTNode)
  else
    ANameNode := nil;

  if FSpecifierListNode <> nil then
    ASpecifierListNode := (FSpecifierListNode.Clone as TListNode)
  else
    ASpecifierListNode := nil;

  Result := TExportsItemNode.Create(
    ANameNode,
    ASpecifierListNode);
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
var
  AKeywordNode: TToken;
  AValueNode: TASTNode;
begin
  if FKeywordNode <> nil then
    AKeywordNode := (FKeywordNode.Clone as TToken)
  else
    AKeywordNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  Result := TExportsSpecifierNode.Create(
    AKeywordNode,
    AValueNode);
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
var
  AExportsKeywordNode: TToken;
  AItemListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FExportsKeywordNode <> nil then
    AExportsKeywordNode := (FExportsKeywordNode.Clone as TToken)
  else
    AExportsKeywordNode := nil;

  if FItemListNode <> nil then
    AItemListNode := (FItemListNode.Clone as TListNode)
  else
    AItemListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TExportsStatementNode.Create(
    AExportsKeywordNode,
    AItemListNode,
    ASemicolonNode);
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
var
  ADeclListNode: TListNode;
  ABlockNode: TASTNode;
begin
  if FDeclListNode <> nil then
    ADeclListNode := (FDeclListNode.Clone as TListNode)
  else
    ADeclListNode := nil;

  if FBlockNode <> nil then
    ABlockNode := (FBlockNode.Clone as TASTNode)
  else
    ABlockNode := nil;

  Result := TFancyBlockNode.Create(
    ADeclListNode,
    ABlockNode);
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
var
  ANameListNode: TListNode;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  APortabilityDirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FNameListNode <> nil then
    ANameListNode := (FNameListNode.Clone as TListNode)
  else
    ANameListNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FPortabilityDirectiveListNode <> nil then
    APortabilityDirectiveListNode := (FPortabilityDirectiveListNode.Clone as TListNode)
  else
    APortabilityDirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TFieldDeclNode.Create(
    ANameListNode,
    AColonNode,
    ATypeNode,
    APortabilityDirectiveListNode,
    ASemicolonNode);
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
var
  AClassKeywordNode: TToken;
  AVarKeywordNode: TToken;
  AFieldListNode: TListNode;
begin
  if FClassKeywordNode <> nil then
    AClassKeywordNode := (FClassKeywordNode.Clone as TToken)
  else
    AClassKeywordNode := nil;

  if FVarKeywordNode <> nil then
    AVarKeywordNode := (FVarKeywordNode.Clone as TToken)
  else
    AVarKeywordNode := nil;

  if FFieldListNode <> nil then
    AFieldListNode := (FFieldListNode.Clone as TListNode)
  else
    AFieldListNode := nil;

  Result := TFieldSectionNode.Create(
    AClassKeywordNode,
    AVarKeywordNode,
    AFieldListNode);
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
var
  AFileKeywordNode: TToken;
  AOfKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FFileKeywordNode <> nil then
    AFileKeywordNode := (FFileKeywordNode.Clone as TToken)
  else
    AFileKeywordNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TFileTypeNode.Create(
    AFileKeywordNode,
    AOfKeywordNode,
    ATypeNode);
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
var
  AForKeywordNode: TToken;
  ALoopVariableNode: TToken;
  AInKeywordNode: TToken;
  AExpressionNode: TASTNode;
  ADoKeywordNode: TToken;
  AStatementNode: TASTNode;
begin
  if FForKeywordNode <> nil then
    AForKeywordNode := (FForKeywordNode.Clone as TToken)
  else
    AForKeywordNode := nil;

  if FLoopVariableNode <> nil then
    ALoopVariableNode := (FLoopVariableNode.Clone as TToken)
  else
    ALoopVariableNode := nil;

  if FInKeywordNode <> nil then
    AInKeywordNode := (FInKeywordNode.Clone as TToken)
  else
    AInKeywordNode := nil;

  if FExpressionNode <> nil then
    AExpressionNode := (FExpressionNode.Clone as TASTNode)
  else
    AExpressionNode := nil;

  if FDoKeywordNode <> nil then
    ADoKeywordNode := (FDoKeywordNode.Clone as TToken)
  else
    ADoKeywordNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  Result := TForInStatementNode.Create(
    AForKeywordNode,
    ALoopVariableNode,
    AInKeywordNode,
    AExpressionNode,
    ADoKeywordNode,
    AStatementNode);
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
var
  AForKeywordNode: TToken;
  ALoopVariableNode: TToken;
  AColonEqualsNode: TToken;
  AStartingValueNode: TASTNode;
  ADirectionNode: TToken;
  AEndingValueNode: TASTNode;
  ADoKeywordNode: TToken;
  AStatementNode: TASTNode;
begin
  if FForKeywordNode <> nil then
    AForKeywordNode := (FForKeywordNode.Clone as TToken)
  else
    AForKeywordNode := nil;

  if FLoopVariableNode <> nil then
    ALoopVariableNode := (FLoopVariableNode.Clone as TToken)
  else
    ALoopVariableNode := nil;

  if FColonEqualsNode <> nil then
    AColonEqualsNode := (FColonEqualsNode.Clone as TToken)
  else
    AColonEqualsNode := nil;

  if FStartingValueNode <> nil then
    AStartingValueNode := (FStartingValueNode.Clone as TASTNode)
  else
    AStartingValueNode := nil;

  if FDirectionNode <> nil then
    ADirectionNode := (FDirectionNode.Clone as TToken)
  else
    ADirectionNode := nil;

  if FEndingValueNode <> nil then
    AEndingValueNode := (FEndingValueNode.Clone as TASTNode)
  else
    AEndingValueNode := nil;

  if FDoKeywordNode <> nil then
    ADoKeywordNode := (FDoKeywordNode.Clone as TToken)
  else
    ADoKeywordNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  Result := TForStatementNode.Create(
    AForKeywordNode,
    ALoopVariableNode,
    AColonEqualsNode,
    AStartingValueNode,
    ADirectionNode,
    AEndingValueNode,
    ADoKeywordNode,
    AStatementNode);
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
var
  AGotoKeywordNode: TToken;
  ALabelIdNode: TToken;
begin
  if FGotoKeywordNode <> nil then
    AGotoKeywordNode := (FGotoKeywordNode.Clone as TToken)
  else
    AGotoKeywordNode := nil;

  if FLabelIdNode <> nil then
    ALabelIdNode := (FLabelIdNode.Clone as TToken)
  else
    ALabelIdNode := nil;

  Result := TGotoStatementNode.Create(
    AGotoKeywordNode,
    ALabelIdNode);
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
var
  AIfKeywordNode: TToken;
  AConditionNode: TASTNode;
  AThenKeywordNode: TToken;
  AThenStatementNode: TASTNode;
  AElseKeywordNode: TToken;
  AElseStatementNode: TASTNode;
begin
  if FIfKeywordNode <> nil then
    AIfKeywordNode := (FIfKeywordNode.Clone as TToken)
  else
    AIfKeywordNode := nil;

  if FConditionNode <> nil then
    AConditionNode := (FConditionNode.Clone as TASTNode)
  else
    AConditionNode := nil;

  if FThenKeywordNode <> nil then
    AThenKeywordNode := (FThenKeywordNode.Clone as TToken)
  else
    AThenKeywordNode := nil;

  if FThenStatementNode <> nil then
    AThenStatementNode := (FThenStatementNode.Clone as TASTNode)
  else
    AThenStatementNode := nil;

  if FElseKeywordNode <> nil then
    AElseKeywordNode := (FElseKeywordNode.Clone as TToken)
  else
    AElseKeywordNode := nil;

  if FElseStatementNode <> nil then
    AElseStatementNode := (FElseStatementNode.Clone as TASTNode)
  else
    AElseStatementNode := nil;

  Result := TIfStatementNode.Create(
    AIfKeywordNode,
    AConditionNode,
    AThenKeywordNode,
    AThenStatementNode,
    AElseKeywordNode,
    AElseStatementNode);
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
var
  AInitializationKeywordNode: TToken;
  AInitializationStatementListNode: TListNode;
  AFinalizationKeywordNode: TToken;
  AFinalizationStatementListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FInitializationKeywordNode <> nil then
    AInitializationKeywordNode := (FInitializationKeywordNode.Clone as TToken)
  else
    AInitializationKeywordNode := nil;

  if FInitializationStatementListNode <> nil then
    AInitializationStatementListNode := (FInitializationStatementListNode.Clone as TListNode)
  else
    AInitializationStatementListNode := nil;

  if FFinalizationKeywordNode <> nil then
    AFinalizationKeywordNode := (FFinalizationKeywordNode.Clone as TToken)
  else
    AFinalizationKeywordNode := nil;

  if FFinalizationStatementListNode <> nil then
    AFinalizationStatementListNode := (FFinalizationStatementListNode.Clone as TListNode)
  else
    AFinalizationStatementListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TInitSectionNode.Create(
    AInitializationKeywordNode,
    AInitializationStatementListNode,
    AFinalizationKeywordNode,
    AFinalizationStatementListNode,
    AEndKeywordNode);
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
var
  AInterfaceKeywordNode: TToken;
  AOpenParenthesisNode: TToken;
  ABaseInterfaceNode: TASTNode;
  ACloseParenthesisNode: TToken;
  AOpenBracketNode: TToken;
  AGuidNode: TASTNode;
  ACloseBracketNode: TToken;
  AMethodAndPropertyListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FInterfaceKeywordNode <> nil then
    AInterfaceKeywordNode := (FInterfaceKeywordNode.Clone as TToken)
  else
    AInterfaceKeywordNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FBaseInterfaceNode <> nil then
    ABaseInterfaceNode := (FBaseInterfaceNode.Clone as TASTNode)
  else
    ABaseInterfaceNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FGuidNode <> nil then
    AGuidNode := (FGuidNode.Clone as TASTNode)
  else
    AGuidNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  if FMethodAndPropertyListNode <> nil then
    AMethodAndPropertyListNode := (FMethodAndPropertyListNode.Clone as TListNode)
  else
    AMethodAndPropertyListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TInterfaceTypeNode.Create(
    AInterfaceKeywordNode,
    AOpenParenthesisNode,
    ABaseInterfaceNode,
    ACloseParenthesisNode,
    AOpenBracketNode,
    AGuidNode,
    ACloseBracketNode,
    AMethodAndPropertyListNode,
    AEndKeywordNode);
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
var
  ALabelKeywordNode: TToken;
  ALabelListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FLabelKeywordNode <> nil then
    ALabelKeywordNode := (FLabelKeywordNode.Clone as TToken)
  else
    ALabelKeywordNode := nil;

  if FLabelListNode <> nil then
    ALabelListNode := (FLabelListNode.Clone as TListNode)
  else
    ALabelListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TLabelDeclSectionNode.Create(
    ALabelKeywordNode,
    ALabelListNode,
    ASemicolonNode);
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
var
  ALabelIdNode: TToken;
  AColonNode: TToken;
  AStatementNode: TASTNode;
begin
  if FLabelIdNode <> nil then
    ALabelIdNode := (FLabelIdNode.Clone as TToken)
  else
    ALabelIdNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  Result := TLabeledStatementNode.Create(
    ALabelIdNode,
    AColonNode,
    AStatementNode);
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
var
  AClassKeywordNode: TToken;
  AMethodTypeNode: TToken;
  ANameNode: TASTNode;
  AOpenParenthesisNode: TToken;
  AParameterListNode: TListNode;
  ACloseParenthesisNode: TToken;
  AColonNode: TToken;
  AReturnTypeNode: TASTNode;
  ADirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FClassKeywordNode <> nil then
    AClassKeywordNode := (FClassKeywordNode.Clone as TToken)
  else
    AClassKeywordNode := nil;

  if FMethodTypeNode <> nil then
    AMethodTypeNode := (FMethodTypeNode.Clone as TToken)
  else
    AMethodTypeNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TASTNode)
  else
    ANameNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FParameterListNode <> nil then
    AParameterListNode := (FParameterListNode.Clone as TListNode)
  else
    AParameterListNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FReturnTypeNode <> nil then
    AReturnTypeNode := (FReturnTypeNode.Clone as TASTNode)
  else
    AReturnTypeNode := nil;

  if FDirectiveListNode <> nil then
    ADirectiveListNode := (FDirectiveListNode.Clone as TListNode)
  else
    ADirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TMethodHeadingNode.Create(
    AClassKeywordNode,
    AMethodTypeNode,
    ANameNode,
    AOpenParenthesisNode,
    AParameterListNode,
    ACloseParenthesisNode,
    AColonNode,
    AReturnTypeNode,
    ADirectiveListNode,
    ASemicolonNode);
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
var
  AMethodHeadingNode: TMethodHeadingNode;
  AFancyBlockNode: TFancyBlockNode;
  ASemicolonNode: TToken;
begin
  if FMethodHeadingNode <> nil then
    AMethodHeadingNode := (FMethodHeadingNode.Clone as TMethodHeadingNode)
  else
    AMethodHeadingNode := nil;

  if FFancyBlockNode <> nil then
    AFancyBlockNode := (FFancyBlockNode.Clone as TFancyBlockNode)
  else
    AFancyBlockNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TMethodImplementationNode.Create(
    AMethodHeadingNode,
    AFancyBlockNode,
    ASemicolonNode);
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
var
  AMethodTypeNode: TToken;
  AInterfaceMethodNode: TASTNode;
  AEqualSignNode: TToken;
  AImplementationMethodNode: TToken;
  ASemicolonNode: TToken;
begin
  if FMethodTypeNode <> nil then
    AMethodTypeNode := (FMethodTypeNode.Clone as TToken)
  else
    AMethodTypeNode := nil;

  if FInterfaceMethodNode <> nil then
    AInterfaceMethodNode := (FInterfaceMethodNode.Clone as TASTNode)
  else
    AInterfaceMethodNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FImplementationMethodNode <> nil then
    AImplementationMethodNode := (FImplementationMethodNode.Clone as TToken)
  else
    AImplementationMethodNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TMethodResolutionNode.Create(
    AMethodTypeNode,
    AInterfaceMethodNode,
    AEqualSignNode,
    AImplementationMethodNode,
    ASemicolonNode);
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
var
  AValueNode: TASTNode;
  ASizeColonNode: TToken;
  ASizeNode: TASTNode;
  APrecisionColonNode: TToken;
  APrecisionNode: TASTNode;
begin
  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  if FSizeColonNode <> nil then
    ASizeColonNode := (FSizeColonNode.Clone as TToken)
  else
    ASizeColonNode := nil;

  if FSizeNode <> nil then
    ASizeNode := (FSizeNode.Clone as TASTNode)
  else
    ASizeNode := nil;

  if FPrecisionColonNode <> nil then
    APrecisionColonNode := (FPrecisionColonNode.Clone as TToken)
  else
    APrecisionColonNode := nil;

  if FPrecisionNode <> nil then
    APrecisionNode := (FPrecisionNode.Clone as TASTNode)
  else
    APrecisionNode := nil;

  Result := TNumberFormatNode.Create(
    AValueNode,
    ASizeColonNode,
    ASizeNode,
    APrecisionColonNode,
    APrecisionNode);
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

{ TOpenArrayConstructorNode }

function TOpenArrayConstructorNode.Clone: TASTNode;
var
  AOpenBracketNode: TToken;
  AItemListNode: TListNode;
  ACloseBracketNode: TToken;
begin
  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FItemListNode <> nil then
    AItemListNode := (FItemListNode.Clone as TListNode)
  else
    AItemListNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  Result := TOpenArrayConstructorNode.Create(
    AOpenBracketNode,
    AItemListNode,
    ACloseBracketNode);
end;

constructor TOpenArrayConstructorNode.Create(AOpenBracketNode: TToken; AItemListNode: TListNode; ACloseBracketNode: TToken);
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

{ TOpenArrayNode }

function TOpenArrayNode.Clone: TASTNode;
var
  AArrayKeywordNode: TToken;
  AOfKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FArrayKeywordNode <> nil then
    AArrayKeywordNode := (FArrayKeywordNode.Clone as TToken)
  else
    AArrayKeywordNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TOpenArrayNode.Create(
    AArrayKeywordNode,
    AOfKeywordNode,
    ATypeNode);
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
var
  APackageKeywordNode: TToken;
  ANameNode: TASTNode;
  ASemicolonNode: TToken;
  ARequiresClauseNode: TRequiresClauseNode;
  AContainsClauseNode: TUsesClauseNode;
  AAttributeListNode: TListNode;
  AEndKeywordNode: TToken;
  ADotNode: TToken;
begin
  if FPackageKeywordNode <> nil then
    APackageKeywordNode := (FPackageKeywordNode.Clone as TToken)
  else
    APackageKeywordNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TASTNode)
  else
    ANameNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  if FRequiresClauseNode <> nil then
    ARequiresClauseNode := (FRequiresClauseNode.Clone as TRequiresClauseNode)
  else
    ARequiresClauseNode := nil;

  if FContainsClauseNode <> nil then
    AContainsClauseNode := (FContainsClauseNode.Clone as TUsesClauseNode)
  else
    AContainsClauseNode := nil;

  if FAttributeListNode <> nil then
    AAttributeListNode := (FAttributeListNode.Clone as TListNode)
  else
    AAttributeListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  if FDotNode <> nil then
    ADotNode := (FDotNode.Clone as TToken)
  else
    ADotNode := nil;

  Result := TPackageNode.Create(
    APackageKeywordNode,
    ANameNode,
    ASemicolonNode,
    ARequiresClauseNode,
    AContainsClauseNode,
    AAttributeListNode,
    AEndKeywordNode,
    ADotNode);
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
var
  APackedKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FPackedKeywordNode <> nil then
    APackedKeywordNode := (FPackedKeywordNode.Clone as TToken)
  else
    APackedKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TPackedTypeNode.Create(
    APackedKeywordNode,
    ATypeNode);
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
var
  AModifierNode: TToken;
  ANameListNode: TListNode;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  AEqualSignNode: TToken;
  ADefaultValueNode: TASTNode;
begin
  if FModifierNode <> nil then
    AModifierNode := (FModifierNode.Clone as TToken)
  else
    AModifierNode := nil;

  if FNameListNode <> nil then
    ANameListNode := (FNameListNode.Clone as TListNode)
  else
    ANameListNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FDefaultValueNode <> nil then
    ADefaultValueNode := (FDefaultValueNode.Clone as TASTNode)
  else
    ADefaultValueNode := nil;

  Result := TParameterNode.Create(
    AModifierNode,
    ANameListNode,
    AColonNode,
    ATypeNode,
    AEqualSignNode,
    ADefaultValueNode);
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
var
  ALeftNode: TASTNode;
  AOpenDelimiterNode: TToken;
  AParameterListNode: TListNode;
  ACloseDelimiterNode: TToken;
begin
  if FLeftNode <> nil then
    ALeftNode := (FLeftNode.Clone as TASTNode)
  else
    ALeftNode := nil;

  if FOpenDelimiterNode <> nil then
    AOpenDelimiterNode := (FOpenDelimiterNode.Clone as TToken)
  else
    AOpenDelimiterNode := nil;

  if FParameterListNode <> nil then
    AParameterListNode := (FParameterListNode.Clone as TListNode)
  else
    AParameterListNode := nil;

  if FCloseDelimiterNode <> nil then
    ACloseDelimiterNode := (FCloseDelimiterNode.Clone as TToken)
  else
    ACloseDelimiterNode := nil;

  Result := TParameterizedNode.Create(
    ALeftNode,
    AOpenDelimiterNode,
    AParameterListNode,
    ACloseDelimiterNode);
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
var
  AOpenParenthesisNode: TToken;
  AExpressionNode: TASTNode;
  ACloseParenthesisNode: TToken;
begin
  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FExpressionNode <> nil then
    AExpressionNode := (FExpressionNode.Clone as TASTNode)
  else
    AExpressionNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  Result := TParenthesizedExpressionNode.Create(
    AOpenParenthesisNode,
    AExpressionNode,
    ACloseParenthesisNode);
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
var
  AOperandNode: TASTNode;
  ACaretNode: TToken;
begin
  if FOperandNode <> nil then
    AOperandNode := (FOperandNode.Clone as TASTNode)
  else
    AOperandNode := nil;

  if FCaretNode <> nil then
    ACaretNode := (FCaretNode.Clone as TToken)
  else
    ACaretNode := nil;

  Result := TPointerDereferenceNode.Create(
    AOperandNode,
    ACaretNode);
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
var
  ACaretNode: TToken;
  ATypeNode: TASTNode;
begin
  if FCaretNode <> nil then
    ACaretNode := (FCaretNode.Clone as TToken)
  else
    ACaretNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TPointerTypeNode.Create(
    ACaretNode,
    ATypeNode);
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
var
  AMethodTypeNode: TToken;
  AOpenParenthesisNode: TToken;
  AParameterListNode: TListNode;
  ACloseParenthesisNode: TToken;
  AColonNode: TToken;
  AReturnTypeNode: TASTNode;
  AFirstDirectiveListNode: TListNode;
  AOfKeywordNode: TToken;
  AObjectKeywordNode: TToken;
  ASecondDirectiveListNode: TListNode;
begin
  if FMethodTypeNode <> nil then
    AMethodTypeNode := (FMethodTypeNode.Clone as TToken)
  else
    AMethodTypeNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FParameterListNode <> nil then
    AParameterListNode := (FParameterListNode.Clone as TListNode)
  else
    AParameterListNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FReturnTypeNode <> nil then
    AReturnTypeNode := (FReturnTypeNode.Clone as TASTNode)
  else
    AReturnTypeNode := nil;

  if FFirstDirectiveListNode <> nil then
    AFirstDirectiveListNode := (FFirstDirectiveListNode.Clone as TListNode)
  else
    AFirstDirectiveListNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FObjectKeywordNode <> nil then
    AObjectKeywordNode := (FObjectKeywordNode.Clone as TToken)
  else
    AObjectKeywordNode := nil;

  if FSecondDirectiveListNode <> nil then
    ASecondDirectiveListNode := (FSecondDirectiveListNode.Clone as TListNode)
  else
    ASecondDirectiveListNode := nil;

  Result := TProcedureTypeNode.Create(
    AMethodTypeNode,
    AOpenParenthesisNode,
    AParameterListNode,
    ACloseParenthesisNode,
    AColonNode,
    AReturnTypeNode,
    AFirstDirectiveListNode,
    AOfKeywordNode,
    AObjectKeywordNode,
    ASecondDirectiveListNode);
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
var
  AProgramKeywordNode: TToken;
  ANameNode: TToken;
  ANoiseOpenParenthesisNode: TToken;
  ANoiseContentListNode: TListNode;
  ANoiseCloseParenthesisNode: TToken;
  ASemicolonNode: TToken;
  AUsesClauseNode: TUsesClauseNode;
  ADeclarationListNode: TListNode;
  AInitSectionNode: TInitSectionNode;
  ADotNode: TToken;
begin
  if FProgramKeywordNode <> nil then
    AProgramKeywordNode := (FProgramKeywordNode.Clone as TToken)
  else
    AProgramKeywordNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FNoiseOpenParenthesisNode <> nil then
    ANoiseOpenParenthesisNode := (FNoiseOpenParenthesisNode.Clone as TToken)
  else
    ANoiseOpenParenthesisNode := nil;

  if FNoiseContentListNode <> nil then
    ANoiseContentListNode := (FNoiseContentListNode.Clone as TListNode)
  else
    ANoiseContentListNode := nil;

  if FNoiseCloseParenthesisNode <> nil then
    ANoiseCloseParenthesisNode := (FNoiseCloseParenthesisNode.Clone as TToken)
  else
    ANoiseCloseParenthesisNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  if FUsesClauseNode <> nil then
    AUsesClauseNode := (FUsesClauseNode.Clone as TUsesClauseNode)
  else
    AUsesClauseNode := nil;

  if FDeclarationListNode <> nil then
    ADeclarationListNode := (FDeclarationListNode.Clone as TListNode)
  else
    ADeclarationListNode := nil;

  if FInitSectionNode <> nil then
    AInitSectionNode := (FInitSectionNode.Clone as TInitSectionNode)
  else
    AInitSectionNode := nil;

  if FDotNode <> nil then
    ADotNode := (FDotNode.Clone as TToken)
  else
    ADotNode := nil;

  Result := TProgramNode.Create(
    AProgramKeywordNode,
    ANameNode,
    ANoiseOpenParenthesisNode,
    ANoiseContentListNode,
    ANoiseCloseParenthesisNode,
    ASemicolonNode,
    AUsesClauseNode,
    ADeclarationListNode,
    AInitSectionNode,
    ADotNode);
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
var
  AClassKeywordNode: TToken;
  APropertyKeywordNode: TToken;
  ANameNode: TToken;
  AOpenBracketNode: TToken;
  AParameterListNode: TListNode;
  ACloseBracketNode: TToken;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  ADirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FClassKeywordNode <> nil then
    AClassKeywordNode := (FClassKeywordNode.Clone as TToken)
  else
    AClassKeywordNode := nil;

  if FPropertyKeywordNode <> nil then
    APropertyKeywordNode := (FPropertyKeywordNode.Clone as TToken)
  else
    APropertyKeywordNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FParameterListNode <> nil then
    AParameterListNode := (FParameterListNode.Clone as TListNode)
  else
    AParameterListNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FDirectiveListNode <> nil then
    ADirectiveListNode := (FDirectiveListNode.Clone as TListNode)
  else
    ADirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TPropertyNode.Create(
    AClassKeywordNode,
    APropertyKeywordNode,
    ANameNode,
    AOpenBracketNode,
    AParameterListNode,
    ACloseBracketNode,
    AColonNode,
    ATypeNode,
    ADirectiveListNode,
    ASemicolonNode);
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
var
  ARaiseKeywordNode: TToken;
  AExceptionNode: TASTNode;
  AAtSemikeywordNode: TToken;
  AAddressNode: TASTNode;
begin
  if FRaiseKeywordNode <> nil then
    ARaiseKeywordNode := (FRaiseKeywordNode.Clone as TToken)
  else
    ARaiseKeywordNode := nil;

  if FExceptionNode <> nil then
    AExceptionNode := (FExceptionNode.Clone as TASTNode)
  else
    AExceptionNode := nil;

  if FAtSemikeywordNode <> nil then
    AAtSemikeywordNode := (FAtSemikeywordNode.Clone as TToken)
  else
    AAtSemikeywordNode := nil;

  if FAddressNode <> nil then
    AAddressNode := (FAddressNode.Clone as TASTNode)
  else
    AAddressNode := nil;

  Result := TRaiseStatementNode.Create(
    ARaiseKeywordNode,
    AExceptionNode,
    AAtSemikeywordNode,
    AAddressNode);
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
var
  ANameNode: TASTNode;
  AColonNode: TToken;
  AValueNode: TASTNode;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TASTNode)
  else
    ANameNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  Result := TRecordFieldConstantNode.Create(
    ANameNode,
    AColonNode,
    AValueNode);
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
var
  ARecordKeywordNode: TToken;
  AContentListNode: TListNode;
  AVariantSectionNode: TVariantSectionNode;
  AEndKeywordNode: TToken;
begin
  if FRecordKeywordNode <> nil then
    ARecordKeywordNode := (FRecordKeywordNode.Clone as TToken)
  else
    ARecordKeywordNode := nil;

  if FContentListNode <> nil then
    AContentListNode := (FContentListNode.Clone as TListNode)
  else
    AContentListNode := nil;

  if FVariantSectionNode <> nil then
    AVariantSectionNode := (FVariantSectionNode.Clone as TVariantSectionNode)
  else
    AVariantSectionNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TRecordTypeNode.Create(
    ARecordKeywordNode,
    AContentListNode,
    AVariantSectionNode,
    AEndKeywordNode);
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
var
  ARepeatKeywordNode: TToken;
  AStatementListNode: TListNode;
  AUntilKeywordNode: TToken;
  AConditionNode: TASTNode;
begin
  if FRepeatKeywordNode <> nil then
    ARepeatKeywordNode := (FRepeatKeywordNode.Clone as TToken)
  else
    ARepeatKeywordNode := nil;

  if FStatementListNode <> nil then
    AStatementListNode := (FStatementListNode.Clone as TListNode)
  else
    AStatementListNode := nil;

  if FUntilKeywordNode <> nil then
    AUntilKeywordNode := (FUntilKeywordNode.Clone as TToken)
  else
    AUntilKeywordNode := nil;

  if FConditionNode <> nil then
    AConditionNode := (FConditionNode.Clone as TASTNode)
  else
    AConditionNode := nil;

  Result := TRepeatStatementNode.Create(
    ARepeatKeywordNode,
    AStatementListNode,
    AUntilKeywordNode,
    AConditionNode);
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
var
  ARequiresSemikeywordNode: TToken;
  APackageListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FRequiresSemikeywordNode <> nil then
    ARequiresSemikeywordNode := (FRequiresSemikeywordNode.Clone as TToken)
  else
    ARequiresSemikeywordNode := nil;

  if FPackageListNode <> nil then
    APackageListNode := (FPackageListNode.Clone as TListNode)
  else
    APackageListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TRequiresClauseNode.Create(
    ARequiresSemikeywordNode,
    APackageListNode,
    ASemicolonNode);
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
var
  AOpenBracketNode: TToken;
  AItemListNode: TListNode;
  ACloseBracketNode: TToken;
begin
  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FItemListNode <> nil then
    AItemListNode := (FItemListNode.Clone as TListNode)
  else
    AItemListNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  Result := TSetLiteralNode.Create(
    AOpenBracketNode,
    AItemListNode,
    ACloseBracketNode);
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
var
  ASetKeywordNode: TToken;
  AOfKeywordNode: TToken;
  ATypeNode: TASTNode;
begin
  if FSetKeywordNode <> nil then
    ASetKeywordNode := (FSetKeywordNode.Clone as TToken)
  else
    ASetKeywordNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  Result := TSetOfNode.Create(
    ASetKeywordNode,
    AOfKeywordNode,
    ATypeNode);
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
var
  AStringKeywordNode: TToken;
  AOpenBracketNode: TToken;
  ALengthNode: TASTNode;
  ACloseBracketNode: TToken;
begin
  if FStringKeywordNode <> nil then
    AStringKeywordNode := (FStringKeywordNode.Clone as TToken)
  else
    AStringKeywordNode := nil;

  if FOpenBracketNode <> nil then
    AOpenBracketNode := (FOpenBracketNode.Clone as TToken)
  else
    AOpenBracketNode := nil;

  if FLengthNode <> nil then
    ALengthNode := (FLengthNode.Clone as TASTNode)
  else
    ALengthNode := nil;

  if FCloseBracketNode <> nil then
    ACloseBracketNode := (FCloseBracketNode.Clone as TToken)
  else
    ACloseBracketNode := nil;

  Result := TStringOfLengthNode.Create(
    AStringKeywordNode,
    AOpenBracketNode,
    ALengthNode,
    ACloseBracketNode);
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
var
  ATryKeywordNode: TToken;
  ATryStatementListNode: TListNode;
  AExceptKeywordNode: TToken;
  AExceptionItemListNode: TListNode;
  AElseKeywordNode: TToken;
  AElseStatementListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FTryKeywordNode <> nil then
    ATryKeywordNode := (FTryKeywordNode.Clone as TToken)
  else
    ATryKeywordNode := nil;

  if FTryStatementListNode <> nil then
    ATryStatementListNode := (FTryStatementListNode.Clone as TListNode)
  else
    ATryStatementListNode := nil;

  if FExceptKeywordNode <> nil then
    AExceptKeywordNode := (FExceptKeywordNode.Clone as TToken)
  else
    AExceptKeywordNode := nil;

  if FExceptionItemListNode <> nil then
    AExceptionItemListNode := (FExceptionItemListNode.Clone as TListNode)
  else
    AExceptionItemListNode := nil;

  if FElseKeywordNode <> nil then
    AElseKeywordNode := (FElseKeywordNode.Clone as TToken)
  else
    AElseKeywordNode := nil;

  if FElseStatementListNode <> nil then
    AElseStatementListNode := (FElseStatementListNode.Clone as TListNode)
  else
    AElseStatementListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TTryExceptNode.Create(
    ATryKeywordNode,
    ATryStatementListNode,
    AExceptKeywordNode,
    AExceptionItemListNode,
    AElseKeywordNode,
    AElseStatementListNode,
    AEndKeywordNode);
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
var
  ATryKeywordNode: TToken;
  ATryStatementListNode: TListNode;
  AFinallyKeywordNode: TToken;
  AFinallyStatementListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FTryKeywordNode <> nil then
    ATryKeywordNode := (FTryKeywordNode.Clone as TToken)
  else
    ATryKeywordNode := nil;

  if FTryStatementListNode <> nil then
    ATryStatementListNode := (FTryStatementListNode.Clone as TListNode)
  else
    ATryStatementListNode := nil;

  if FFinallyKeywordNode <> nil then
    AFinallyKeywordNode := (FFinallyKeywordNode.Clone as TToken)
  else
    AFinallyKeywordNode := nil;

  if FFinallyStatementListNode <> nil then
    AFinallyStatementListNode := (FFinallyStatementListNode.Clone as TListNode)
  else
    AFinallyStatementListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TTryFinallyNode.Create(
    ATryKeywordNode,
    ATryStatementListNode,
    AFinallyKeywordNode,
    AFinallyStatementListNode,
    AEndKeywordNode);
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
var
  ANameNode: TToken;
  AEqualSignNode: TToken;
  ATypeKeywordNode: TToken;
  ATypeNode: TASTNode;
  APortabilityDirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FTypeKeywordNode <> nil then
    ATypeKeywordNode := (FTypeKeywordNode.Clone as TToken)
  else
    ATypeKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FPortabilityDirectiveListNode <> nil then
    APortabilityDirectiveListNode := (FPortabilityDirectiveListNode.Clone as TListNode)
  else
    APortabilityDirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TTypeDeclNode.Create(
    ANameNode,
    AEqualSignNode,
    ATypeKeywordNode,
    ATypeNode,
    APortabilityDirectiveListNode,
    ASemicolonNode);
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
var
  ANameNode: TToken;
  AEqualSignNode: TToken;
  ATypeNode: TToken;
  ASemicolonNode: TToken;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TToken)
  else
    ATypeNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TTypeForwardDeclarationNode.Create(
    ANameNode,
    AEqualSignNode,
    ATypeNode,
    ASemicolonNode);
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
var
  ATypeKeywordNode: TToken;
  AHelperSemikeywordNode: TToken;
  AOpenParenthesisNode: TToken;
  ABaseHelperTypeNode: TASTNode;
  ACloseParenthesisNode: TToken;
  AForKeywordNode: TToken;
  ATypeNode: TASTNode;
  AContentListNode: TListNode;
  AEndKeywordNode: TToken;
begin
  if FTypeKeywordNode <> nil then
    ATypeKeywordNode := (FTypeKeywordNode.Clone as TToken)
  else
    ATypeKeywordNode := nil;

  if FHelperSemikeywordNode <> nil then
    AHelperSemikeywordNode := (FHelperSemikeywordNode.Clone as TToken)
  else
    AHelperSemikeywordNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FBaseHelperTypeNode <> nil then
    ABaseHelperTypeNode := (FBaseHelperTypeNode.Clone as TASTNode)
  else
    ABaseHelperTypeNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FForKeywordNode <> nil then
    AForKeywordNode := (FForKeywordNode.Clone as TToken)
  else
    AForKeywordNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FContentListNode <> nil then
    AContentListNode := (FContentListNode.Clone as TListNode)
  else
    AContentListNode := nil;

  if FEndKeywordNode <> nil then
    AEndKeywordNode := (FEndKeywordNode.Clone as TToken)
  else
    AEndKeywordNode := nil;

  Result := TTypeHelperNode.Create(
    ATypeKeywordNode,
    AHelperSemikeywordNode,
    AOpenParenthesisNode,
    ABaseHelperTypeNode,
    ACloseParenthesisNode,
    AForKeywordNode,
    ATypeNode,
    AContentListNode,
    AEndKeywordNode);
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
var
  ATypeKeywordNode: TToken;
  ATypeListNode: TListNode;
begin
  if FTypeKeywordNode <> nil then
    ATypeKeywordNode := (FTypeKeywordNode.Clone as TToken)
  else
    ATypeKeywordNode := nil;

  if FTypeListNode <> nil then
    ATypeListNode := (FTypeListNode.Clone as TListNode)
  else
    ATypeListNode := nil;

  Result := TTypeSectionNode.Create(
    ATypeKeywordNode,
    ATypeListNode);
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
var
  AOperatorNode: TToken;
  AOperandNode: TASTNode;
begin
  if FOperatorNode <> nil then
    AOperatorNode := (FOperatorNode.Clone as TToken)
  else
    AOperatorNode := nil;

  if FOperandNode <> nil then
    AOperandNode := (FOperandNode.Clone as TASTNode)
  else
    AOperandNode := nil;

  Result := TUnaryOperationNode.Create(
    AOperatorNode,
    AOperandNode);
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
var
  AUnitKeywordNode: TToken;
  AUnitNameNode: TToken;
  APortabilityDirectiveListNode: TListNode;
  ASemicolonNode: TToken;
  AInterfaceSectionNode: TUnitSectionNode;
  AImplementationSectionNode: TUnitSectionNode;
  AInitSectionNode: TInitSectionNode;
  ADotNode: TToken;
begin
  if FUnitKeywordNode <> nil then
    AUnitKeywordNode := (FUnitKeywordNode.Clone as TToken)
  else
    AUnitKeywordNode := nil;

  if FUnitNameNode <> nil then
    AUnitNameNode := (FUnitNameNode.Clone as TToken)
  else
    AUnitNameNode := nil;

  if FPortabilityDirectiveListNode <> nil then
    APortabilityDirectiveListNode := (FPortabilityDirectiveListNode.Clone as TListNode)
  else
    APortabilityDirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  if FInterfaceSectionNode <> nil then
    AInterfaceSectionNode := (FInterfaceSectionNode.Clone as TUnitSectionNode)
  else
    AInterfaceSectionNode := nil;

  if FImplementationSectionNode <> nil then
    AImplementationSectionNode := (FImplementationSectionNode.Clone as TUnitSectionNode)
  else
    AImplementationSectionNode := nil;

  if FInitSectionNode <> nil then
    AInitSectionNode := (FInitSectionNode.Clone as TInitSectionNode)
  else
    AInitSectionNode := nil;

  if FDotNode <> nil then
    ADotNode := (FDotNode.Clone as TToken)
  else
    ADotNode := nil;

  Result := TUnitNode.Create(
    AUnitKeywordNode,
    AUnitNameNode,
    APortabilityDirectiveListNode,
    ASemicolonNode,
    AInterfaceSectionNode,
    AImplementationSectionNode,
    AInitSectionNode,
    ADotNode);
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
var
  AHeaderKeywordNode: TToken;
  AUsesClauseNode: TUsesClauseNode;
  AContentListNode: TListNode;
begin
  if FHeaderKeywordNode <> nil then
    AHeaderKeywordNode := (FHeaderKeywordNode.Clone as TToken)
  else
    AHeaderKeywordNode := nil;

  if FUsesClauseNode <> nil then
    AUsesClauseNode := (FUsesClauseNode.Clone as TUsesClauseNode)
  else
    AUsesClauseNode := nil;

  if FContentListNode <> nil then
    AContentListNode := (FContentListNode.Clone as TListNode)
  else
    AContentListNode := nil;

  Result := TUnitSectionNode.Create(
    AHeaderKeywordNode,
    AUsesClauseNode,
    AContentListNode);
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
var
  ANameNode: TASTNode;
  AInKeywordNode: TToken;
  AFileNameNode: TToken;
begin
  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TASTNode)
  else
    ANameNode := nil;

  if FInKeywordNode <> nil then
    AInKeywordNode := (FInKeywordNode.Clone as TToken)
  else
    AInKeywordNode := nil;

  if FFileNameNode <> nil then
    AFileNameNode := (FFileNameNode.Clone as TToken)
  else
    AFileNameNode := nil;

  Result := TUsedUnitNode.Create(
    ANameNode,
    AInKeywordNode,
    AFileNameNode);
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
var
  AUsesKeywordNode: TToken;
  AUnitListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FUsesKeywordNode <> nil then
    AUsesKeywordNode := (FUsesKeywordNode.Clone as TToken)
  else
    AUsesKeywordNode := nil;

  if FUnitListNode <> nil then
    AUnitListNode := (FUnitListNode.Clone as TListNode)
  else
    AUnitListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TUsesClauseNode.Create(
    AUsesKeywordNode,
    AUnitListNode,
    ASemicolonNode);
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
var
  ANameListNode: TListNode;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  AFirstPortabilityDirectiveListNode: TListNode;
  AAbsoluteSemikeywordNode: TToken;
  AAbsoluteAddressNode: TASTNode;
  AEqualSignNode: TToken;
  AValueNode: TASTNode;
  ASecondPortabilityDirectiveListNode: TListNode;
  ASemicolonNode: TToken;
begin
  if FNameListNode <> nil then
    ANameListNode := (FNameListNode.Clone as TListNode)
  else
    ANameListNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FFirstPortabilityDirectiveListNode <> nil then
    AFirstPortabilityDirectiveListNode := (FFirstPortabilityDirectiveListNode.Clone as TListNode)
  else
    AFirstPortabilityDirectiveListNode := nil;

  if FAbsoluteSemikeywordNode <> nil then
    AAbsoluteSemikeywordNode := (FAbsoluteSemikeywordNode.Clone as TToken)
  else
    AAbsoluteSemikeywordNode := nil;

  if FAbsoluteAddressNode <> nil then
    AAbsoluteAddressNode := (FAbsoluteAddressNode.Clone as TASTNode)
  else
    AAbsoluteAddressNode := nil;

  if FEqualSignNode <> nil then
    AEqualSignNode := (FEqualSignNode.Clone as TToken)
  else
    AEqualSignNode := nil;

  if FValueNode <> nil then
    AValueNode := (FValueNode.Clone as TASTNode)
  else
    AValueNode := nil;

  if FSecondPortabilityDirectiveListNode <> nil then
    ASecondPortabilityDirectiveListNode := (FSecondPortabilityDirectiveListNode.Clone as TListNode)
  else
    ASecondPortabilityDirectiveListNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TVarDeclNode.Create(
    ANameListNode,
    AColonNode,
    ATypeNode,
    AFirstPortabilityDirectiveListNode,
    AAbsoluteSemikeywordNode,
    AAbsoluteAddressNode,
    AEqualSignNode,
    AValueNode,
    ASecondPortabilityDirectiveListNode,
    ASemicolonNode);
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
var
  AVarKeywordNode: TToken;
  AVarListNode: TListNode;
begin
  if FVarKeywordNode <> nil then
    AVarKeywordNode := (FVarKeywordNode.Clone as TToken)
  else
    AVarKeywordNode := nil;

  if FVarListNode <> nil then
    AVarListNode := (FVarListNode.Clone as TListNode)
  else
    AVarListNode := nil;

  Result := TVarSectionNode.Create(
    AVarKeywordNode,
    AVarListNode);
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
var
  AValueListNode: TListNode;
  AColonNode: TToken;
  AOpenParenthesisNode: TToken;
  AFieldDeclListNode: TListNode;
  AVariantSectionNode: TVariantSectionNode;
  ACloseParenthesisNode: TToken;
  ASemicolonNode: TToken;
begin
  if FValueListNode <> nil then
    AValueListNode := (FValueListNode.Clone as TListNode)
  else
    AValueListNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FOpenParenthesisNode <> nil then
    AOpenParenthesisNode := (FOpenParenthesisNode.Clone as TToken)
  else
    AOpenParenthesisNode := nil;

  if FFieldDeclListNode <> nil then
    AFieldDeclListNode := (FFieldDeclListNode.Clone as TListNode)
  else
    AFieldDeclListNode := nil;

  if FVariantSectionNode <> nil then
    AVariantSectionNode := (FVariantSectionNode.Clone as TVariantSectionNode)
  else
    AVariantSectionNode := nil;

  if FCloseParenthesisNode <> nil then
    ACloseParenthesisNode := (FCloseParenthesisNode.Clone as TToken)
  else
    ACloseParenthesisNode := nil;

  if FSemicolonNode <> nil then
    ASemicolonNode := (FSemicolonNode.Clone as TToken)
  else
    ASemicolonNode := nil;

  Result := TVariantGroupNode.Create(
    AValueListNode,
    AColonNode,
    AOpenParenthesisNode,
    AFieldDeclListNode,
    AVariantSectionNode,
    ACloseParenthesisNode,
    ASemicolonNode);
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
var
  ACaseKeywordNode: TToken;
  ANameNode: TToken;
  AColonNode: TToken;
  ATypeNode: TASTNode;
  AOfKeywordNode: TToken;
  AVariantGroupListNode: TListNode;
begin
  if FCaseKeywordNode <> nil then
    ACaseKeywordNode := (FCaseKeywordNode.Clone as TToken)
  else
    ACaseKeywordNode := nil;

  if FNameNode <> nil then
    ANameNode := (FNameNode.Clone as TToken)
  else
    ANameNode := nil;

  if FColonNode <> nil then
    AColonNode := (FColonNode.Clone as TToken)
  else
    AColonNode := nil;

  if FTypeNode <> nil then
    ATypeNode := (FTypeNode.Clone as TASTNode)
  else
    ATypeNode := nil;

  if FOfKeywordNode <> nil then
    AOfKeywordNode := (FOfKeywordNode.Clone as TToken)
  else
    AOfKeywordNode := nil;

  if FVariantGroupListNode <> nil then
    AVariantGroupListNode := (FVariantGroupListNode.Clone as TListNode)
  else
    AVariantGroupListNode := nil;

  Result := TVariantSectionNode.Create(
    ACaseKeywordNode,
    ANameNode,
    AColonNode,
    ATypeNode,
    AOfKeywordNode,
    AVariantGroupListNode);
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
var
  AStrictSemikeywordNode: TToken;
  AVisibilityKeywordNode: TToken;
begin
  if FStrictSemikeywordNode <> nil then
    AStrictSemikeywordNode := (FStrictSemikeywordNode.Clone as TToken)
  else
    AStrictSemikeywordNode := nil;

  if FVisibilityKeywordNode <> nil then
    AVisibilityKeywordNode := (FVisibilityKeywordNode.Clone as TToken)
  else
    AVisibilityKeywordNode := nil;

  Result := TVisibilityNode.Create(
    AStrictSemikeywordNode,
    AVisibilityKeywordNode);
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
var
  AVisibilityNode: TVisibilityNode;
  AContentListNode: TListNode;
begin
  if FVisibilityNode <> nil then
    AVisibilityNode := (FVisibilityNode.Clone as TVisibilityNode)
  else
    AVisibilityNode := nil;

  if FContentListNode <> nil then
    AContentListNode := (FContentListNode.Clone as TListNode)
  else
    AContentListNode := nil;

  Result := TVisibilitySectionNode.Create(
    AVisibilityNode,
    AContentListNode);
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
var
  AWhileKeywordNode: TToken;
  AConditionNode: TASTNode;
  ADoKeywordNode: TToken;
  AStatementNode: TASTNode;
begin
  if FWhileKeywordNode <> nil then
    AWhileKeywordNode := (FWhileKeywordNode.Clone as TToken)
  else
    AWhileKeywordNode := nil;

  if FConditionNode <> nil then
    AConditionNode := (FConditionNode.Clone as TASTNode)
  else
    AConditionNode := nil;

  if FDoKeywordNode <> nil then
    ADoKeywordNode := (FDoKeywordNode.Clone as TToken)
  else
    ADoKeywordNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  Result := TWhileStatementNode.Create(
    AWhileKeywordNode,
    AConditionNode,
    ADoKeywordNode,
    AStatementNode);
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
var
  AWithKeywordNode: TToken;
  AExpressionListNode: TListNode;
  ADoKeywordNode: TToken;
  AStatementNode: TASTNode;
begin
  if FWithKeywordNode <> nil then
    AWithKeywordNode := (FWithKeywordNode.Clone as TToken)
  else
    AWithKeywordNode := nil;

  if FExpressionListNode <> nil then
    AExpressionListNode := (FExpressionListNode.Clone as TListNode)
  else
    AExpressionListNode := nil;

  if FDoKeywordNode <> nil then
    ADoKeywordNode := (FDoKeywordNode.Clone as TToken)
  else
    ADoKeywordNode := nil;

  if FStatementNode <> nil then
    AStatementNode := (FStatementNode.Clone as TASTNode)
  else
    AStatementNode := nil;

  Result := TWithStatementNode.Create(
    AWithKeywordNode,
    AExpressionListNode,
    ADoKeywordNode,
    AStatementNode);
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
