unit UVisitor;

/////////////////////////////////////////
// This file is generated! Don't edit! //
/////////////////////////////////////////

interface

uses
  UASTNode, UDelimitedItemNode, UListNode, UToken, UGeneratedNodes;

type
  TVisitor = class(TASTVisitor)
  public
    procedure Visit(ANode: TASTNode); overload; override;

    procedure Visit(ANode: TDelimitedItemNode); overload; virtual;
    procedure Visit(ANode: TListNode); overload; virtual;
    procedure Visit(ANode: TToken); overload; virtual;

    // Generated Nodes
    procedure Visit(ANode: TArrayTypeNode); overload; virtual;
    procedure Visit(ANode: TAssemblerStatementNode); overload; virtual;
    procedure Visit(ANode: TAttributeNode); overload; virtual;
    procedure Visit(ANode: TBinaryOperationNode); overload; virtual;
    procedure Visit(ANode: TBlockNode); overload; virtual;
    procedure Visit(ANode: TCaseSelectorNode); overload; virtual;
    procedure Visit(ANode: TCaseStatementNode); overload; virtual;
    procedure Visit(ANode: TClassOfNode); overload; virtual;
    procedure Visit(ANode: TClassTypeNode); overload; virtual;
    procedure Visit(ANode: TConstSectionNode); overload; virtual;
    procedure Visit(ANode: TConstantDeclNode); overload; virtual;
    procedure Visit(ANode: TConstantListNode); overload; virtual;
    procedure Visit(ANode: TDirectiveNode); overload; virtual;
    procedure Visit(ANode: TEnumeratedTypeElementNode); overload; virtual;
    procedure Visit(ANode: TEnumeratedTypeNode); overload; virtual;
    procedure Visit(ANode: TExceptionItemNode); overload; virtual;
    procedure Visit(ANode: TExportsItemNode); overload; virtual;
    procedure Visit(ANode: TExportsSpecifierNode); overload; virtual;
    procedure Visit(ANode: TExportsStatementNode); overload; virtual;
    procedure Visit(ANode: TFancyBlockNode); overload; virtual;
    procedure Visit(ANode: TFieldDeclNode); overload; virtual;
    procedure Visit(ANode: TFieldSectionNode); overload; virtual;
    procedure Visit(ANode: TFileTypeNode); overload; virtual;
    procedure Visit(ANode: TForInStatementNode); overload; virtual;
    procedure Visit(ANode: TForStatementNode); overload; virtual;
    procedure Visit(ANode: TGotoStatementNode); overload; virtual;
    procedure Visit(ANode: TIfStatementNode); overload; virtual;
    procedure Visit(ANode: TInitSectionNode); overload; virtual;
    procedure Visit(ANode: TInterfaceTypeNode); overload; virtual;
    procedure Visit(ANode: TLabelDeclSectionNode); overload; virtual;
    procedure Visit(ANode: TLabeledStatementNode); overload; virtual;
    procedure Visit(ANode: TMethodHeadingNode); overload; virtual;
    procedure Visit(ANode: TMethodImplementationNode); overload; virtual;
    procedure Visit(ANode: TMethodResolutionNode); overload; virtual;
    procedure Visit(ANode: TNumberFormatNode); overload; virtual;
    procedure Visit(ANode: TOpenArrayConstructorNode); overload; virtual;
    procedure Visit(ANode: TOpenArrayNode); overload; virtual;
    procedure Visit(ANode: TPackageNode); overload; virtual;
    procedure Visit(ANode: TPackedTypeNode); overload; virtual;
    procedure Visit(ANode: TParameterNode); overload; virtual;
    procedure Visit(ANode: TParameterizedNode); overload; virtual;
    procedure Visit(ANode: TParenthesizedExpressionNode); overload; virtual;
    procedure Visit(ANode: TPointerDereferenceNode); overload; virtual;
    procedure Visit(ANode: TPointerTypeNode); overload; virtual;
    procedure Visit(ANode: TProcedureTypeNode); overload; virtual;
    procedure Visit(ANode: TProgramNode); overload; virtual;
    procedure Visit(ANode: TPropertyNode); overload; virtual;
    procedure Visit(ANode: TRaiseStatementNode); overload; virtual;
    procedure Visit(ANode: TRecordFieldConstantNode); overload; virtual;
    procedure Visit(ANode: TRecordTypeNode); overload; virtual;
    procedure Visit(ANode: TRepeatStatementNode); overload; virtual;
    procedure Visit(ANode: TRequiresClauseNode); overload; virtual;
    procedure Visit(ANode: TSetLiteralNode); overload; virtual;
    procedure Visit(ANode: TSetOfNode); overload; virtual;
    procedure Visit(ANode: TStringOfLengthNode); overload; virtual;
    procedure Visit(ANode: TTryExceptNode); overload; virtual;
    procedure Visit(ANode: TTryFinallyNode); overload; virtual;
    procedure Visit(ANode: TTypeDeclNode); overload; virtual;
    procedure Visit(ANode: TTypeForwardDeclarationNode); overload; virtual;
    procedure Visit(ANode: TTypeHelperNode); overload; virtual;
    procedure Visit(ANode: TTypeSectionNode); overload; virtual;
    procedure Visit(ANode: TUnaryOperationNode); overload; virtual;
    procedure Visit(ANode: TUnitNode); overload; virtual;
    procedure Visit(ANode: TUnitSectionNode); overload; virtual;
    procedure Visit(ANode: TUsedUnitNode); overload; virtual;
    procedure Visit(ANode: TUsesClauseNode); overload; virtual;
    procedure Visit(ANode: TVarDeclNode); overload; virtual;
    procedure Visit(ANode: TVarSectionNode); overload; virtual;
    procedure Visit(ANode: TVariantGroupNode); overload; virtual;
    procedure Visit(ANode: TVariantSectionNode); overload; virtual;
    procedure Visit(ANode: TVisibilityNode); overload; virtual;
    procedure Visit(ANode: TVisibilitySectionNode); overload; virtual;
    procedure Visit(ANode: TWhileStatementNode); overload; virtual;
    procedure Visit(ANode: TWithStatementNode); overload; virtual;
  end;

implementation

{ TVisitor }

procedure TVisitor.Visit(ANode: TASTNode);
begin
  // Visit child nodes
  if ANode is TDelimitedItemNode then
    Visit(ANode as TDelimitedItemNode);
  if ANode is TListNode then
    Visit(ANode as TListNode);
  if ANode is TToken then
    Visit(ANode as TToken);

  // Generated Nodes
  if ANode is TArrayTypeNode then
    Visit(ANode as TArrayTypeNode);
  if ANode is TAssemblerStatementNode then
    Visit(ANode as TAssemblerStatementNode);
  if ANode is TAttributeNode then
    Visit(ANode as TAttributeNode);
  if ANode is TBinaryOperationNode then
    Visit(ANode as TBinaryOperationNode);
  if ANode is TBlockNode then
    Visit(ANode as TBlockNode);
  if ANode is TCaseSelectorNode then
    Visit(ANode as TCaseSelectorNode);
  if ANode is TCaseStatementNode then
    Visit(ANode as TCaseStatementNode);
  if ANode is TClassOfNode then
    Visit(ANode as TClassOfNode);
  if ANode is TClassTypeNode then
    Visit(ANode as TClassTypeNode);
  if ANode is TConstSectionNode then
    Visit(ANode as TConstSectionNode);
  if ANode is TConstantDeclNode then
    Visit(ANode as TConstantDeclNode);
  if ANode is TConstantListNode then
    Visit(ANode as TConstantListNode);
  if ANode is TDirectiveNode then
    Visit(ANode as TDirectiveNode);
  if ANode is TEnumeratedTypeElementNode then
    Visit(ANode as TEnumeratedTypeElementNode);
  if ANode is TEnumeratedTypeNode then
    Visit(ANode as TEnumeratedTypeNode);
  if ANode is TExceptionItemNode then
    Visit(ANode as TExceptionItemNode);
  if ANode is TExportsItemNode then
    Visit(ANode as TExportsItemNode);
  if ANode is TExportsSpecifierNode then
    Visit(ANode as TExportsSpecifierNode);
  if ANode is TExportsStatementNode then
    Visit(ANode as TExportsStatementNode);
  if ANode is TFancyBlockNode then
    Visit(ANode as TFancyBlockNode);
  if ANode is TFieldDeclNode then
    Visit(ANode as TFieldDeclNode);
  if ANode is TFieldSectionNode then
    Visit(ANode as TFieldSectionNode);
  if ANode is TFileTypeNode then
    Visit(ANode as TFileTypeNode);
  if ANode is TForInStatementNode then
    Visit(ANode as TForInStatementNode);
  if ANode is TForStatementNode then
    Visit(ANode as TForStatementNode);
  if ANode is TGotoStatementNode then
    Visit(ANode as TGotoStatementNode);
  if ANode is TIfStatementNode then
    Visit(ANode as TIfStatementNode);
  if ANode is TInitSectionNode then
    Visit(ANode as TInitSectionNode);
  if ANode is TInterfaceTypeNode then
    Visit(ANode as TInterfaceTypeNode);
  if ANode is TLabelDeclSectionNode then
    Visit(ANode as TLabelDeclSectionNode);
  if ANode is TLabeledStatementNode then
    Visit(ANode as TLabeledStatementNode);
  if ANode is TMethodHeadingNode then
    Visit(ANode as TMethodHeadingNode);
  if ANode is TMethodImplementationNode then
    Visit(ANode as TMethodImplementationNode);
  if ANode is TMethodResolutionNode then
    Visit(ANode as TMethodResolutionNode);
  if ANode is TNumberFormatNode then
    Visit(ANode as TNumberFormatNode);
  if ANode is TOpenArrayConstructorNode then
    Visit(ANode as TOpenArrayConstructorNode);
  if ANode is TOpenArrayNode then
    Visit(ANode as TOpenArrayNode);
  if ANode is TPackageNode then
    Visit(ANode as TPackageNode);
  if ANode is TPackedTypeNode then
    Visit(ANode as TPackedTypeNode);
  if ANode is TParameterNode then
    Visit(ANode as TParameterNode);
  if ANode is TParameterizedNode then
    Visit(ANode as TParameterizedNode);
  if ANode is TParenthesizedExpressionNode then
    Visit(ANode as TParenthesizedExpressionNode);
  if ANode is TPointerDereferenceNode then
    Visit(ANode as TPointerDereferenceNode);
  if ANode is TPointerTypeNode then
    Visit(ANode as TPointerTypeNode);
  if ANode is TProcedureTypeNode then
    Visit(ANode as TProcedureTypeNode);
  if ANode is TProgramNode then
    Visit(ANode as TProgramNode);
  if ANode is TPropertyNode then
    Visit(ANode as TPropertyNode);
  if ANode is TRaiseStatementNode then
    Visit(ANode as TRaiseStatementNode);
  if ANode is TRecordFieldConstantNode then
    Visit(ANode as TRecordFieldConstantNode);
  if ANode is TRecordTypeNode then
    Visit(ANode as TRecordTypeNode);
  if ANode is TRepeatStatementNode then
    Visit(ANode as TRepeatStatementNode);
  if ANode is TRequiresClauseNode then
    Visit(ANode as TRequiresClauseNode);
  if ANode is TSetLiteralNode then
    Visit(ANode as TSetLiteralNode);
  if ANode is TSetOfNode then
    Visit(ANode as TSetOfNode);
  if ANode is TStringOfLengthNode then
    Visit(ANode as TStringOfLengthNode);
  if ANode is TTryExceptNode then
    Visit(ANode as TTryExceptNode);
  if ANode is TTryFinallyNode then
    Visit(ANode as TTryFinallyNode);
  if ANode is TTypeDeclNode then
    Visit(ANode as TTypeDeclNode);
  if ANode is TTypeForwardDeclarationNode then
    Visit(ANode as TTypeForwardDeclarationNode);
  if ANode is TTypeHelperNode then
    Visit(ANode as TTypeHelperNode);
  if ANode is TTypeSectionNode then
    Visit(ANode as TTypeSectionNode);
  if ANode is TUnaryOperationNode then
    Visit(ANode as TUnaryOperationNode);
  if ANode is TUnitNode then
    Visit(ANode as TUnitNode);
  if ANode is TUnitSectionNode then
    Visit(ANode as TUnitSectionNode);
  if ANode is TUsedUnitNode then
    Visit(ANode as TUsedUnitNode);
  if ANode is TUsesClauseNode then
    Visit(ANode as TUsesClauseNode);
  if ANode is TVarDeclNode then
    Visit(ANode as TVarDeclNode);
  if ANode is TVarSectionNode then
    Visit(ANode as TVarSectionNode);
  if ANode is TVariantGroupNode then
    Visit(ANode as TVariantGroupNode);
  if ANode is TVariantSectionNode then
    Visit(ANode as TVariantSectionNode);
  if ANode is TVisibilityNode then
    Visit(ANode as TVisibilityNode);
  if ANode is TVisibilitySectionNode then
    Visit(ANode as TVisibilitySectionNode);
  if ANode is TWhileStatementNode then
    Visit(ANode as TWhileStatementNode);
  if ANode is TWithStatementNode then
    Visit(ANode as TWithStatementNode);
end;

procedure TVisitor.Visit(ANode: TDelimitedItemNode);
begin
  // Visit child nodes
  if ANode.ItemNode <> nil then
    Visit(ANode.ItemNode);
  if ANode.DelimiterNode <> nil then
    Visit(ANode.DelimiterNode);
end;

procedure TVisitor.Visit(ANode: TListNode);
var
  I: Integer;
begin
  // Visit child nodes
  for I := 0 to ANode.ItemsCount - 1 do
  begin
    if ANode.Items[I] <> nil then
      Visit(ANode.Items[I]);
  end;
end;

procedure TVisitor.Visit(ANode: TToken);
begin
  // Do nothing
end;

procedure TVisitor.Visit(ANode: TArrayTypeNode);
begin
  // Visit child nodes
  if ANode.ArrayKeywordNode <> nil then
    Visit(ANode.ArrayKeywordNode);
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.IndexListNode <> nil then
    Visit(ANode.IndexListNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TAssemblerStatementNode);
begin
  // Visit child nodes
  if ANode.AsmKeywordNode <> nil then
    Visit(ANode.AsmKeywordNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TAttributeNode);
begin
  // Visit child nodes
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.ScopeNode <> nil then
    Visit(ANode.ScopeNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TBinaryOperationNode);
begin
  // Visit child nodes
  if ANode.LeftNode <> nil then
    Visit(ANode.LeftNode);
  if ANode.OperatorNode <> nil then
    Visit(ANode.OperatorNode);
  if ANode.RightNode <> nil then
    Visit(ANode.RightNode);
end;

procedure TVisitor.Visit(ANode: TBlockNode);
begin
  // Visit child nodes
  if ANode.BeginKeywordNode <> nil then
    Visit(ANode.BeginKeywordNode);
  if ANode.StatementListNode <> nil then
    Visit(ANode.StatementListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TCaseSelectorNode);
begin
  // Visit child nodes
  if ANode.ValueListNode <> nil then
    Visit(ANode.ValueListNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TCaseStatementNode);
begin
  // Visit child nodes
  if ANode.CaseKeywordNode <> nil then
    Visit(ANode.CaseKeywordNode);
  if ANode.ExpressionNode <> nil then
    Visit(ANode.ExpressionNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.SelectorListNode <> nil then
    Visit(ANode.SelectorListNode);
  if ANode.ElseKeywordNode <> nil then
    Visit(ANode.ElseKeywordNode);
  if ANode.ElseStatementListNode <> nil then
    Visit(ANode.ElseStatementListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TClassOfNode);
begin
  // Visit child nodes
  if ANode.ClassKeywordNode <> nil then
    Visit(ANode.ClassKeywordNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TClassTypeNode);
begin
  // Visit child nodes
  if ANode.ClassKeywordNode <> nil then
    Visit(ANode.ClassKeywordNode);
  if ANode.DispositionNode <> nil then
    Visit(ANode.DispositionNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.InheritanceListNode <> nil then
    Visit(ANode.InheritanceListNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.ContentListNode <> nil then
    Visit(ANode.ContentListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TConstSectionNode);
begin
  // Visit child nodes
  if ANode.ConstKeywordNode <> nil then
    Visit(ANode.ConstKeywordNode);
  if ANode.ConstListNode <> nil then
    Visit(ANode.ConstListNode);
end;

procedure TVisitor.Visit(ANode: TConstantDeclNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
  if ANode.PortabilityDirectiveListNode <> nil then
    Visit(ANode.PortabilityDirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TConstantListNode);
begin
  // Visit child nodes
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.ItemListNode <> nil then
    Visit(ANode.ItemListNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TDirectiveNode);
begin
  // Visit child nodes
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
  if ANode.KeywordNode <> nil then
    Visit(ANode.KeywordNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
  if ANode.DataNode <> nil then
    Visit(ANode.DataNode);
end;

procedure TVisitor.Visit(ANode: TEnumeratedTypeElementNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TEnumeratedTypeNode);
begin
  // Visit child nodes
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.ItemListNode <> nil then
    Visit(ANode.ItemListNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TExceptionItemNode);
begin
  // Visit child nodes
  if ANode.OnSemikeywordNode <> nil then
    Visit(ANode.OnSemikeywordNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.DoKeywordNode <> nil then
    Visit(ANode.DoKeywordNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TExportsItemNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.SpecifierListNode <> nil then
    Visit(ANode.SpecifierListNode);
end;

procedure TVisitor.Visit(ANode: TExportsSpecifierNode);
begin
  // Visit child nodes
  if ANode.KeywordNode <> nil then
    Visit(ANode.KeywordNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TExportsStatementNode);
begin
  // Visit child nodes
  if ANode.ExportsKeywordNode <> nil then
    Visit(ANode.ExportsKeywordNode);
  if ANode.ItemListNode <> nil then
    Visit(ANode.ItemListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TFancyBlockNode);
begin
  // Visit child nodes
  if ANode.DeclListNode <> nil then
    Visit(ANode.DeclListNode);
  if ANode.BlockNode <> nil then
    Visit(ANode.BlockNode);
end;

procedure TVisitor.Visit(ANode: TFieldDeclNode);
begin
  // Visit child nodes
  if ANode.NameListNode <> nil then
    Visit(ANode.NameListNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.PortabilityDirectiveListNode <> nil then
    Visit(ANode.PortabilityDirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TFieldSectionNode);
begin
  // Visit child nodes
  if ANode.ClassKeywordNode <> nil then
    Visit(ANode.ClassKeywordNode);
  if ANode.VarKeywordNode <> nil then
    Visit(ANode.VarKeywordNode);
  if ANode.FieldListNode <> nil then
    Visit(ANode.FieldListNode);
end;

procedure TVisitor.Visit(ANode: TFileTypeNode);
begin
  // Visit child nodes
  if ANode.FileKeywordNode <> nil then
    Visit(ANode.FileKeywordNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TForInStatementNode);
begin
  // Visit child nodes
  if ANode.ForKeywordNode <> nil then
    Visit(ANode.ForKeywordNode);
  if ANode.LoopVariableNode <> nil then
    Visit(ANode.LoopVariableNode);
  if ANode.InKeywordNode <> nil then
    Visit(ANode.InKeywordNode);
  if ANode.ExpressionNode <> nil then
    Visit(ANode.ExpressionNode);
  if ANode.DoKeywordNode <> nil then
    Visit(ANode.DoKeywordNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TForStatementNode);
begin
  // Visit child nodes
  if ANode.ForKeywordNode <> nil then
    Visit(ANode.ForKeywordNode);
  if ANode.LoopVariableNode <> nil then
    Visit(ANode.LoopVariableNode);
  if ANode.ColonEqualsNode <> nil then
    Visit(ANode.ColonEqualsNode);
  if ANode.StartingValueNode <> nil then
    Visit(ANode.StartingValueNode);
  if ANode.DirectionNode <> nil then
    Visit(ANode.DirectionNode);
  if ANode.EndingValueNode <> nil then
    Visit(ANode.EndingValueNode);
  if ANode.DoKeywordNode <> nil then
    Visit(ANode.DoKeywordNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TGotoStatementNode);
begin
  // Visit child nodes
  if ANode.GotoKeywordNode <> nil then
    Visit(ANode.GotoKeywordNode);
  if ANode.LabelIdNode <> nil then
    Visit(ANode.LabelIdNode);
end;

procedure TVisitor.Visit(ANode: TIfStatementNode);
begin
  // Visit child nodes
  if ANode.IfKeywordNode <> nil then
    Visit(ANode.IfKeywordNode);
  if ANode.ConditionNode <> nil then
    Visit(ANode.ConditionNode);
  if ANode.ThenKeywordNode <> nil then
    Visit(ANode.ThenKeywordNode);
  if ANode.ThenStatementNode <> nil then
    Visit(ANode.ThenStatementNode);
  if ANode.ElseKeywordNode <> nil then
    Visit(ANode.ElseKeywordNode);
  if ANode.ElseStatementNode <> nil then
    Visit(ANode.ElseStatementNode);
end;

procedure TVisitor.Visit(ANode: TInitSectionNode);
begin
  // Visit child nodes
  if ANode.InitializationKeywordNode <> nil then
    Visit(ANode.InitializationKeywordNode);
  if ANode.InitializationStatementListNode <> nil then
    Visit(ANode.InitializationStatementListNode);
  if ANode.FinalizationKeywordNode <> nil then
    Visit(ANode.FinalizationKeywordNode);
  if ANode.FinalizationStatementListNode <> nil then
    Visit(ANode.FinalizationStatementListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TInterfaceTypeNode);
begin
  // Visit child nodes
  if ANode.InterfaceKeywordNode <> nil then
    Visit(ANode.InterfaceKeywordNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.BaseInterfaceNode <> nil then
    Visit(ANode.BaseInterfaceNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.GuidNode <> nil then
    Visit(ANode.GuidNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
  if ANode.MethodAndPropertyListNode <> nil then
    Visit(ANode.MethodAndPropertyListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TLabelDeclSectionNode);
begin
  // Visit child nodes
  if ANode.LabelKeywordNode <> nil then
    Visit(ANode.LabelKeywordNode);
  if ANode.LabelListNode <> nil then
    Visit(ANode.LabelListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TLabeledStatementNode);
begin
  // Visit child nodes
  if ANode.LabelIdNode <> nil then
    Visit(ANode.LabelIdNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TMethodHeadingNode);
begin
  // Visit child nodes
  if ANode.ClassKeywordNode <> nil then
    Visit(ANode.ClassKeywordNode);
  if ANode.MethodTypeNode <> nil then
    Visit(ANode.MethodTypeNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.ParameterListNode <> nil then
    Visit(ANode.ParameterListNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.ReturnTypeNode <> nil then
    Visit(ANode.ReturnTypeNode);
  if ANode.DirectiveListNode <> nil then
    Visit(ANode.DirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TMethodImplementationNode);
begin
  // Visit child nodes
  if ANode.MethodHeadingNode <> nil then
    Visit(ANode.MethodHeadingNode);
  if ANode.FancyBlockNode <> nil then
    Visit(ANode.FancyBlockNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TMethodResolutionNode);
begin
  // Visit child nodes
  if ANode.MethodTypeNode <> nil then
    Visit(ANode.MethodTypeNode);
  if ANode.InterfaceMethodNode <> nil then
    Visit(ANode.InterfaceMethodNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.ImplementationMethodNode <> nil then
    Visit(ANode.ImplementationMethodNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TNumberFormatNode);
begin
  // Visit child nodes
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
  if ANode.SizeColonNode <> nil then
    Visit(ANode.SizeColonNode);
  if ANode.SizeNode <> nil then
    Visit(ANode.SizeNode);
  if ANode.PrecisionColonNode <> nil then
    Visit(ANode.PrecisionColonNode);
  if ANode.PrecisionNode <> nil then
    Visit(ANode.PrecisionNode);
end;

procedure TVisitor.Visit(ANode: TOpenArrayConstructorNode);
begin
  // Visit child nodes
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.ItemListNode <> nil then
    Visit(ANode.ItemListNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TOpenArrayNode);
begin
  // Visit child nodes
  if ANode.ArrayKeywordNode <> nil then
    Visit(ANode.ArrayKeywordNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TPackageNode);
begin
  // Visit child nodes
  if ANode.PackageKeywordNode <> nil then
    Visit(ANode.PackageKeywordNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
  if ANode.RequiresClauseNode <> nil then
    Visit(ANode.RequiresClauseNode);
  if ANode.ContainsClauseNode <> nil then
    Visit(ANode.ContainsClauseNode);
  if ANode.AttributeListNode <> nil then
    Visit(ANode.AttributeListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
  if ANode.DotNode <> nil then
    Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TPackedTypeNode);
begin
  // Visit child nodes
  if ANode.PackedKeywordNode <> nil then
    Visit(ANode.PackedKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TParameterNode);
begin
  // Visit child nodes
  if ANode.ModifierNode <> nil then
    Visit(ANode.ModifierNode);
  if ANode.NameListNode <> nil then
    Visit(ANode.NameListNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.DefaultValueNode <> nil then
    Visit(ANode.DefaultValueNode);
end;

procedure TVisitor.Visit(ANode: TParameterizedNode);
begin
  // Visit child nodes
  if ANode.LeftNode <> nil then
    Visit(ANode.LeftNode);
  if ANode.OpenDelimiterNode <> nil then
    Visit(ANode.OpenDelimiterNode);
  if ANode.ParameterListNode <> nil then
    Visit(ANode.ParameterListNode);
  if ANode.CloseDelimiterNode <> nil then
    Visit(ANode.CloseDelimiterNode);
end;

procedure TVisitor.Visit(ANode: TParenthesizedExpressionNode);
begin
  // Visit child nodes
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.ExpressionNode <> nil then
    Visit(ANode.ExpressionNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TPointerDereferenceNode);
begin
  // Visit child nodes
  if ANode.OperandNode <> nil then
    Visit(ANode.OperandNode);
  if ANode.CaretNode <> nil then
    Visit(ANode.CaretNode);
end;

procedure TVisitor.Visit(ANode: TPointerTypeNode);
begin
  // Visit child nodes
  if ANode.CaretNode <> nil then
    Visit(ANode.CaretNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TProcedureTypeNode);
begin
  // Visit child nodes
  if ANode.MethodTypeNode <> nil then
    Visit(ANode.MethodTypeNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.ParameterListNode <> nil then
    Visit(ANode.ParameterListNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.ReturnTypeNode <> nil then
    Visit(ANode.ReturnTypeNode);
  if ANode.FirstDirectiveListNode <> nil then
    Visit(ANode.FirstDirectiveListNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.ObjectKeywordNode <> nil then
    Visit(ANode.ObjectKeywordNode);
  if ANode.SecondDirectiveListNode <> nil then
    Visit(ANode.SecondDirectiveListNode);
end;

procedure TVisitor.Visit(ANode: TProgramNode);
begin
  // Visit child nodes
  if ANode.ProgramKeywordNode <> nil then
    Visit(ANode.ProgramKeywordNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.NoiseOpenParenthesisNode <> nil then
    Visit(ANode.NoiseOpenParenthesisNode);
  if ANode.NoiseContentListNode <> nil then
    Visit(ANode.NoiseContentListNode);
  if ANode.NoiseCloseParenthesisNode <> nil then
    Visit(ANode.NoiseCloseParenthesisNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
  if ANode.UsesClauseNode <> nil then
    Visit(ANode.UsesClauseNode);
  if ANode.DeclarationListNode <> nil then
    Visit(ANode.DeclarationListNode);
  if ANode.InitSectionNode <> nil then
    Visit(ANode.InitSectionNode);
  if ANode.DotNode <> nil then
    Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TPropertyNode);
begin
  // Visit child nodes
  if ANode.ClassKeywordNode <> nil then
    Visit(ANode.ClassKeywordNode);
  if ANode.PropertyKeywordNode <> nil then
    Visit(ANode.PropertyKeywordNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.ParameterListNode <> nil then
    Visit(ANode.ParameterListNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.DirectiveListNode <> nil then
    Visit(ANode.DirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TRaiseStatementNode);
begin
  // Visit child nodes
  if ANode.RaiseKeywordNode <> nil then
    Visit(ANode.RaiseKeywordNode);
  if ANode.ExceptionNode <> nil then
    Visit(ANode.ExceptionNode);
  if ANode.AtSemikeywordNode <> nil then
    Visit(ANode.AtSemikeywordNode);
  if ANode.AddressNode <> nil then
    Visit(ANode.AddressNode);
end;

procedure TVisitor.Visit(ANode: TRecordFieldConstantNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TRecordTypeNode);
begin
  // Visit child nodes
  if ANode.RecordKeywordNode <> nil then
    Visit(ANode.RecordKeywordNode);
  if ANode.ContentListNode <> nil then
    Visit(ANode.ContentListNode);
  if ANode.VariantSectionNode <> nil then
    Visit(ANode.VariantSectionNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TRepeatStatementNode);
begin
  // Visit child nodes
  if ANode.RepeatKeywordNode <> nil then
    Visit(ANode.RepeatKeywordNode);
  if ANode.StatementListNode <> nil then
    Visit(ANode.StatementListNode);
  if ANode.UntilKeywordNode <> nil then
    Visit(ANode.UntilKeywordNode);
  if ANode.ConditionNode <> nil then
    Visit(ANode.ConditionNode);
end;

procedure TVisitor.Visit(ANode: TRequiresClauseNode);
begin
  // Visit child nodes
  if ANode.RequiresSemikeywordNode <> nil then
    Visit(ANode.RequiresSemikeywordNode);
  if ANode.PackageListNode <> nil then
    Visit(ANode.PackageListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TSetLiteralNode);
begin
  // Visit child nodes
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.ItemListNode <> nil then
    Visit(ANode.ItemListNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TSetOfNode);
begin
  // Visit child nodes
  if ANode.SetKeywordNode <> nil then
    Visit(ANode.SetKeywordNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TStringOfLengthNode);
begin
  // Visit child nodes
  if ANode.StringKeywordNode <> nil then
    Visit(ANode.StringKeywordNode);
  if ANode.OpenBracketNode <> nil then
    Visit(ANode.OpenBracketNode);
  if ANode.LengthNode <> nil then
    Visit(ANode.LengthNode);
  if ANode.CloseBracketNode <> nil then
    Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TTryExceptNode);
begin
  // Visit child nodes
  if ANode.TryKeywordNode <> nil then
    Visit(ANode.TryKeywordNode);
  if ANode.TryStatementListNode <> nil then
    Visit(ANode.TryStatementListNode);
  if ANode.ExceptKeywordNode <> nil then
    Visit(ANode.ExceptKeywordNode);
  if ANode.ExceptionItemListNode <> nil then
    Visit(ANode.ExceptionItemListNode);
  if ANode.ElseKeywordNode <> nil then
    Visit(ANode.ElseKeywordNode);
  if ANode.ElseStatementListNode <> nil then
    Visit(ANode.ElseStatementListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTryFinallyNode);
begin
  // Visit child nodes
  if ANode.TryKeywordNode <> nil then
    Visit(ANode.TryKeywordNode);
  if ANode.TryStatementListNode <> nil then
    Visit(ANode.TryStatementListNode);
  if ANode.FinallyKeywordNode <> nil then
    Visit(ANode.FinallyKeywordNode);
  if ANode.FinallyStatementListNode <> nil then
    Visit(ANode.FinallyStatementListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTypeDeclNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.TypeKeywordNode <> nil then
    Visit(ANode.TypeKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.PortabilityDirectiveListNode <> nil then
    Visit(ANode.PortabilityDirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TTypeForwardDeclarationNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TTypeHelperNode);
begin
  // Visit child nodes
  if ANode.TypeKeywordNode <> nil then
    Visit(ANode.TypeKeywordNode);
  if ANode.HelperSemikeywordNode <> nil then
    Visit(ANode.HelperSemikeywordNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.BaseHelperTypeNode <> nil then
    Visit(ANode.BaseHelperTypeNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.ForKeywordNode <> nil then
    Visit(ANode.ForKeywordNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.ContentListNode <> nil then
    Visit(ANode.ContentListNode);
  if ANode.EndKeywordNode <> nil then
    Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTypeSectionNode);
begin
  // Visit child nodes
  if ANode.TypeKeywordNode <> nil then
    Visit(ANode.TypeKeywordNode);
  if ANode.TypeListNode <> nil then
    Visit(ANode.TypeListNode);
end;

procedure TVisitor.Visit(ANode: TUnaryOperationNode);
begin
  // Visit child nodes
  if ANode.OperatorNode <> nil then
    Visit(ANode.OperatorNode);
  if ANode.OperandNode <> nil then
    Visit(ANode.OperandNode);
end;

procedure TVisitor.Visit(ANode: TUnitNode);
begin
  // Visit child nodes
  if ANode.UnitKeywordNode <> nil then
    Visit(ANode.UnitKeywordNode);
  if ANode.UnitNameNode <> nil then
    Visit(ANode.UnitNameNode);
  if ANode.PortabilityDirectiveListNode <> nil then
    Visit(ANode.PortabilityDirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
  if ANode.InterfaceSectionNode <> nil then
    Visit(ANode.InterfaceSectionNode);
  if ANode.ImplementationSectionNode <> nil then
    Visit(ANode.ImplementationSectionNode);
  if ANode.InitSectionNode <> nil then
    Visit(ANode.InitSectionNode);
  if ANode.DotNode <> nil then
    Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TUnitSectionNode);
begin
  // Visit child nodes
  if ANode.HeaderKeywordNode <> nil then
    Visit(ANode.HeaderKeywordNode);
  if ANode.UsesClauseNode <> nil then
    Visit(ANode.UsesClauseNode);
  if ANode.ContentListNode <> nil then
    Visit(ANode.ContentListNode);
end;

procedure TVisitor.Visit(ANode: TUsedUnitNode);
begin
  // Visit child nodes
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.InKeywordNode <> nil then
    Visit(ANode.InKeywordNode);
  if ANode.FileNameNode <> nil then
    Visit(ANode.FileNameNode);
end;

procedure TVisitor.Visit(ANode: TUsesClauseNode);
begin
  // Visit child nodes
  if ANode.UsesKeywordNode <> nil then
    Visit(ANode.UsesKeywordNode);
  if ANode.UnitListNode <> nil then
    Visit(ANode.UnitListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVarDeclNode);
begin
  // Visit child nodes
  if ANode.NameListNode <> nil then
    Visit(ANode.NameListNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.FirstPortabilityDirectiveListNode <> nil then
    Visit(ANode.FirstPortabilityDirectiveListNode);
  if ANode.AbsoluteSemikeywordNode <> nil then
    Visit(ANode.AbsoluteSemikeywordNode);
  if ANode.AbsoluteAddressNode <> nil then
    Visit(ANode.AbsoluteAddressNode);
  if ANode.EqualSignNode <> nil then
    Visit(ANode.EqualSignNode);
  if ANode.ValueNode <> nil then
    Visit(ANode.ValueNode);
  if ANode.SecondPortabilityDirectiveListNode <> nil then
    Visit(ANode.SecondPortabilityDirectiveListNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVarSectionNode);
begin
  // Visit child nodes
  if ANode.VarKeywordNode <> nil then
    Visit(ANode.VarKeywordNode);
  if ANode.VarListNode <> nil then
    Visit(ANode.VarListNode);
end;

procedure TVisitor.Visit(ANode: TVariantGroupNode);
begin
  // Visit child nodes
  if ANode.ValueListNode <> nil then
    Visit(ANode.ValueListNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.OpenParenthesisNode <> nil then
    Visit(ANode.OpenParenthesisNode);
  if ANode.FieldDeclListNode <> nil then
    Visit(ANode.FieldDeclListNode);
  if ANode.VariantSectionNode <> nil then
    Visit(ANode.VariantSectionNode);
  if ANode.CloseParenthesisNode <> nil then
    Visit(ANode.CloseParenthesisNode);
  if ANode.SemicolonNode <> nil then
    Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVariantSectionNode);
begin
  // Visit child nodes
  if ANode.CaseKeywordNode <> nil then
    Visit(ANode.CaseKeywordNode);
  if ANode.NameNode <> nil then
    Visit(ANode.NameNode);
  if ANode.ColonNode <> nil then
    Visit(ANode.ColonNode);
  if ANode.TypeNode <> nil then
    Visit(ANode.TypeNode);
  if ANode.OfKeywordNode <> nil then
    Visit(ANode.OfKeywordNode);
  if ANode.VariantGroupListNode <> nil then
    Visit(ANode.VariantGroupListNode);
end;

procedure TVisitor.Visit(ANode: TVisibilityNode);
begin
  // Visit child nodes
  if ANode.StrictSemikeywordNode <> nil then
    Visit(ANode.StrictSemikeywordNode);
  if ANode.VisibilityKeywordNode <> nil then
    Visit(ANode.VisibilityKeywordNode);
end;

procedure TVisitor.Visit(ANode: TVisibilitySectionNode);
begin
  // Visit child nodes
  if ANode.VisibilityNode <> nil then
    Visit(ANode.VisibilityNode);
  if ANode.ContentListNode <> nil then
    Visit(ANode.ContentListNode);
end;

procedure TVisitor.Visit(ANode: TWhileStatementNode);
begin
  // Visit child nodes
  if ANode.WhileKeywordNode <> nil then
    Visit(ANode.WhileKeywordNode);
  if ANode.ConditionNode <> nil then
    Visit(ANode.ConditionNode);
  if ANode.DoKeywordNode <> nil then
    Visit(ANode.DoKeywordNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TWithStatementNode);
begin
  // Visit child nodes
  if ANode.WithKeywordNode <> nil then
    Visit(ANode.WithKeywordNode);
  if ANode.ExpressionListNode <> nil then
    Visit(ANode.ExpressionListNode);
  if ANode.DoKeywordNode <> nil then
    Visit(ANode.DoKeywordNode);
  if ANode.StatementNode <> nil then
    Visit(ANode.StatementNode);
end;

end.
