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
  Visit(ANode.ItemNode);
  Visit(ANode.DelimiterNode);
end;

procedure TVisitor.Visit(ANode: TListNode);
var
  I: Integer;
begin
  // Visit child nodes
  for I := 0 to ANode.ItemsCount - 1 do
    Visit(ANode.Items[I]);
end;

procedure TVisitor.Visit(ANode: TToken);
begin
  // Do nothing
end;

procedure TVisitor.Visit(ANode: TArrayTypeNode);
begin
  // Visit child nodes
  Visit(ANode.ArrayKeywordNode);
  Visit(ANode.OpenBracketNode);
  Visit(ANode.IndexListNode);
  Visit(ANode.CloseBracketNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TAssemblerStatementNode);
begin
  // Visit child nodes
  Visit(ANode.AsmKeywordNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TAttributeNode);
begin
  // Visit child nodes
  Visit(ANode.OpenBracketNode);
  Visit(ANode.ScopeNode);
  Visit(ANode.ColonNode);
  Visit(ANode.ValueNode);
  Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TBinaryOperationNode);
begin
  // Visit child nodes
  Visit(ANode.LeftNode);
  Visit(ANode.OperatorNode);
  Visit(ANode.RightNode);
end;

procedure TVisitor.Visit(ANode: TBlockNode);
begin
  // Visit child nodes
  Visit(ANode.BeginKeywordNode);
  Visit(ANode.StatementListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TCaseSelectorNode);
begin
  // Visit child nodes
  Visit(ANode.ValueListNode);
  Visit(ANode.ColonNode);
  Visit(ANode.StatementNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TCaseStatementNode);
begin
  // Visit child nodes
  Visit(ANode.CaseKeywordNode);
  Visit(ANode.ExpressionNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.SelectorListNode);
  Visit(ANode.ElseKeywordNode);
  Visit(ANode.ElseStatementListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TClassOfNode);
begin
  // Visit child nodes
  Visit(ANode.ClassKeywordNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TClassTypeNode);
begin
  // Visit child nodes
  Visit(ANode.ClassKeywordNode);
  Visit(ANode.DispositionNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.InheritanceListNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.ContentListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TConstSectionNode);
begin
  // Visit child nodes
  Visit(ANode.ConstKeywordNode);
  Visit(ANode.ConstListNode);
end;

procedure TVisitor.Visit(ANode: TConstantDeclNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.ValueNode);
  Visit(ANode.PortabilityDirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TConstantListNode);
begin
  // Visit child nodes
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.ItemListNode);
  Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TDirectiveNode);
begin
  // Visit child nodes
  Visit(ANode.SemicolonNode);
  Visit(ANode.KeywordNode);
  Visit(ANode.ValueNode);
  Visit(ANode.DataNode);
end;

procedure TVisitor.Visit(ANode: TEnumeratedTypeElementNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TEnumeratedTypeNode);
begin
  // Visit child nodes
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.ItemListNode);
  Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TExceptionItemNode);
begin
  // Visit child nodes
  Visit(ANode.OnSemikeywordNode);
  Visit(ANode.NameNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.DoKeywordNode);
  Visit(ANode.StatementNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TExportsItemNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.SpecifierListNode);
end;

procedure TVisitor.Visit(ANode: TExportsSpecifierNode);
begin
  // Visit child nodes
  Visit(ANode.KeywordNode);
  Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TExportsStatementNode);
begin
  // Visit child nodes
  Visit(ANode.ExportsKeywordNode);
  Visit(ANode.ItemListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TFancyBlockNode);
begin
  // Visit child nodes
  Visit(ANode.DeclListNode);
  Visit(ANode.BlockNode);
end;

procedure TVisitor.Visit(ANode: TFieldDeclNode);
begin
  // Visit child nodes
  Visit(ANode.NameListNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.PortabilityDirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TFieldSectionNode);
begin
  // Visit child nodes
  Visit(ANode.ClassKeywordNode);
  Visit(ANode.VarKeywordNode);
  Visit(ANode.FieldListNode);
end;

procedure TVisitor.Visit(ANode: TFileTypeNode);
begin
  // Visit child nodes
  Visit(ANode.FileKeywordNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TForInStatementNode);
begin
  // Visit child nodes
  Visit(ANode.ForKeywordNode);
  Visit(ANode.LoopVariableNode);
  Visit(ANode.InKeywordNode);
  Visit(ANode.ExpressionNode);
  Visit(ANode.DoKeywordNode);
  Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TForStatementNode);
begin
  // Visit child nodes
  Visit(ANode.ForKeywordNode);
  Visit(ANode.LoopVariableNode);
  Visit(ANode.ColonEqualsNode);
  Visit(ANode.StartingValueNode);
  Visit(ANode.DirectionNode);
  Visit(ANode.EndingValueNode);
  Visit(ANode.DoKeywordNode);
  Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TGotoStatementNode);
begin
  // Visit child nodes
  Visit(ANode.GotoKeywordNode);
  Visit(ANode.LabelIdNode);
end;

procedure TVisitor.Visit(ANode: TIfStatementNode);
begin
  // Visit child nodes
  Visit(ANode.IfKeywordNode);
  Visit(ANode.ConditionNode);
  Visit(ANode.ThenKeywordNode);
  Visit(ANode.ThenStatementNode);
  Visit(ANode.ElseKeywordNode);
  Visit(ANode.ElseStatementNode);
end;

procedure TVisitor.Visit(ANode: TInitSectionNode);
begin
  // Visit child nodes
  Visit(ANode.InitializationKeywordNode);
  Visit(ANode.InitializationStatementListNode);
  Visit(ANode.FinalizationKeywordNode);
  Visit(ANode.FinalizationStatementListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TInterfaceTypeNode);
begin
  // Visit child nodes
  Visit(ANode.InterfaceKeywordNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.BaseInterfaceNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.OpenBracketNode);
  Visit(ANode.GuidNode);
  Visit(ANode.CloseBracketNode);
  Visit(ANode.MethodAndPropertyListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TLabelDeclSectionNode);
begin
  // Visit child nodes
  Visit(ANode.LabelKeywordNode);
  Visit(ANode.LabelListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TLabeledStatementNode);
begin
  // Visit child nodes
  Visit(ANode.LabelIdNode);
  Visit(ANode.ColonNode);
  Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TMethodHeadingNode);
begin
  // Visit child nodes
  Visit(ANode.ClassKeywordNode);
  Visit(ANode.MethodTypeNode);
  Visit(ANode.NameNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.ParameterListNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.ColonNode);
  Visit(ANode.ReturnTypeNode);
  Visit(ANode.DirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TMethodImplementationNode);
begin
  // Visit child nodes
  Visit(ANode.MethodHeadingNode);
  Visit(ANode.FancyBlockNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TMethodResolutionNode);
begin
  // Visit child nodes
  Visit(ANode.MethodTypeNode);
  Visit(ANode.InterfaceMethodNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.ImplementationMethodNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TNumberFormatNode);
begin
  // Visit child nodes
  Visit(ANode.ValueNode);
  Visit(ANode.SizeColonNode);
  Visit(ANode.SizeNode);
  Visit(ANode.PrecisionColonNode);
  Visit(ANode.PrecisionNode);
end;

procedure TVisitor.Visit(ANode: TOpenArrayNode);
begin
  // Visit child nodes
  Visit(ANode.ArrayKeywordNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TPackageNode);
begin
  // Visit child nodes
  Visit(ANode.PackageKeywordNode);
  Visit(ANode.NameNode);
  Visit(ANode.SemicolonNode);
  Visit(ANode.RequiresClauseNode);
  Visit(ANode.ContainsClauseNode);
  Visit(ANode.AttributeListNode);
  Visit(ANode.EndKeywordNode);
  Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TPackedTypeNode);
begin
  // Visit child nodes
  Visit(ANode.PackedKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TParameterNode);
begin
  // Visit child nodes
  Visit(ANode.ModifierNode);
  Visit(ANode.NameListNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.DefaultValueNode);
end;

procedure TVisitor.Visit(ANode: TParameterizedNode);
begin
  // Visit child nodes
  Visit(ANode.LeftNode);
  Visit(ANode.OpenDelimiterNode);
  Visit(ANode.ParameterListNode);
  Visit(ANode.CloseDelimiterNode);
end;

procedure TVisitor.Visit(ANode: TParenthesizedExpressionNode);
begin
  // Visit child nodes
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.ExpressionNode);
  Visit(ANode.CloseParenthesisNode);
end;

procedure TVisitor.Visit(ANode: TPointerDereferenceNode);
begin
  // Visit child nodes
  Visit(ANode.OperandNode);
  Visit(ANode.CaretNode);
end;

procedure TVisitor.Visit(ANode: TPointerTypeNode);
begin
  // Visit child nodes
  Visit(ANode.CaretNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TProcedureTypeNode);
begin
  // Visit child nodes
  Visit(ANode.MethodTypeNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.ParameterListNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.ColonNode);
  Visit(ANode.ReturnTypeNode);
  Visit(ANode.FirstDirectiveListNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.ObjectKeywordNode);
  Visit(ANode.SecondDirectiveListNode);
end;

procedure TVisitor.Visit(ANode: TProgramNode);
begin
  // Visit child nodes
  Visit(ANode.ProgramKeywordNode);
  Visit(ANode.NameNode);
  Visit(ANode.NoiseOpenParenthesisNode);
  Visit(ANode.NoiseContentListNode);
  Visit(ANode.NoiseCloseParenthesisNode);
  Visit(ANode.SemicolonNode);
  Visit(ANode.UsesClauseNode);
  Visit(ANode.DeclarationListNode);
  Visit(ANode.InitSectionNode);
  Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TPropertyNode);
begin
  // Visit child nodes
  Visit(ANode.ClassKeywordNode);
  Visit(ANode.PropertyKeywordNode);
  Visit(ANode.NameNode);
  Visit(ANode.OpenBracketNode);
  Visit(ANode.ParameterListNode);
  Visit(ANode.CloseBracketNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.DirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TRaiseStatementNode);
begin
  // Visit child nodes
  Visit(ANode.RaiseKeywordNode);
  Visit(ANode.ExceptionNode);
  Visit(ANode.AtSemikeywordNode);
  Visit(ANode.AddressNode);
end;

procedure TVisitor.Visit(ANode: TRecordFieldConstantNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.ColonNode);
  Visit(ANode.ValueNode);
end;

procedure TVisitor.Visit(ANode: TRecordTypeNode);
begin
  // Visit child nodes
  Visit(ANode.RecordKeywordNode);
  Visit(ANode.ContentListNode);
  Visit(ANode.VariantSectionNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TRepeatStatementNode);
begin
  // Visit child nodes
  Visit(ANode.RepeatKeywordNode);
  Visit(ANode.StatementListNode);
  Visit(ANode.UntilKeywordNode);
  Visit(ANode.ConditionNode);
end;

procedure TVisitor.Visit(ANode: TRequiresClauseNode);
begin
  // Visit child nodes
  Visit(ANode.RequiresSemikeywordNode);
  Visit(ANode.PackageListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TSetLiteralNode);
begin
  // Visit child nodes
  Visit(ANode.OpenBracketNode);
  Visit(ANode.ItemListNode);
  Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TSetOfNode);
begin
  // Visit child nodes
  Visit(ANode.SetKeywordNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.TypeNode);
end;

procedure TVisitor.Visit(ANode: TStringOfLengthNode);
begin
  // Visit child nodes
  Visit(ANode.StringKeywordNode);
  Visit(ANode.OpenBracketNode);
  Visit(ANode.LengthNode);
  Visit(ANode.CloseBracketNode);
end;

procedure TVisitor.Visit(ANode: TTryExceptNode);
begin
  // Visit child nodes
  Visit(ANode.TryKeywordNode);
  Visit(ANode.TryStatementListNode);
  Visit(ANode.ExceptKeywordNode);
  Visit(ANode.ExceptionItemListNode);
  Visit(ANode.ElseKeywordNode);
  Visit(ANode.ElseStatementListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTryFinallyNode);
begin
  // Visit child nodes
  Visit(ANode.TryKeywordNode);
  Visit(ANode.TryStatementListNode);
  Visit(ANode.FinallyKeywordNode);
  Visit(ANode.FinallyStatementListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTypeDeclNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.TypeKeywordNode);
  Visit(ANode.TypeNode);
  Visit(ANode.PortabilityDirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TTypeForwardDeclarationNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.TypeNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TTypeHelperNode);
begin
  // Visit child nodes
  Visit(ANode.TypeKeywordNode);
  Visit(ANode.HelperSemikeywordNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.BaseHelperTypeNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.ForKeywordNode);
  Visit(ANode.TypeNode);
  Visit(ANode.ContentListNode);
  Visit(ANode.EndKeywordNode);
end;

procedure TVisitor.Visit(ANode: TTypeSectionNode);
begin
  // Visit child nodes
  Visit(ANode.TypeKeywordNode);
  Visit(ANode.TypeListNode);
end;

procedure TVisitor.Visit(ANode: TUnaryOperationNode);
begin
  // Visit child nodes
  Visit(ANode.OperatorNode);
  Visit(ANode.OperandNode);
end;

procedure TVisitor.Visit(ANode: TUnitNode);
begin
  // Visit child nodes
  Visit(ANode.UnitKeywordNode);
  Visit(ANode.UnitNameNode);
  Visit(ANode.PortabilityDirectiveListNode);
  Visit(ANode.SemicolonNode);
  Visit(ANode.InterfaceSectionNode);
  Visit(ANode.ImplementationSectionNode);
  Visit(ANode.InitSectionNode);
  Visit(ANode.DotNode);
end;

procedure TVisitor.Visit(ANode: TUnitSectionNode);
begin
  // Visit child nodes
  Visit(ANode.HeaderKeywordNode);
  Visit(ANode.UsesClauseNode);
  Visit(ANode.ContentListNode);
end;

procedure TVisitor.Visit(ANode: TUsedUnitNode);
begin
  // Visit child nodes
  Visit(ANode.NameNode);
  Visit(ANode.InKeywordNode);
  Visit(ANode.FileNameNode);
end;

procedure TVisitor.Visit(ANode: TUsesClauseNode);
begin
  // Visit child nodes
  Visit(ANode.UsesKeywordNode);
  Visit(ANode.UnitListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVarDeclNode);
begin
  // Visit child nodes
  Visit(ANode.NameListNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.FirstPortabilityDirectiveListNode);
  Visit(ANode.AbsoluteSemikeywordNode);
  Visit(ANode.AbsoluteAddressNode);
  Visit(ANode.EqualSignNode);
  Visit(ANode.ValueNode);
  Visit(ANode.SecondPortabilityDirectiveListNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVarSectionNode);
begin
  // Visit child nodes
  Visit(ANode.VarKeywordNode);
  Visit(ANode.VarListNode);
end;

procedure TVisitor.Visit(ANode: TVariantGroupNode);
begin
  // Visit child nodes
  Visit(ANode.ValueListNode);
  Visit(ANode.ColonNode);
  Visit(ANode.OpenParenthesisNode);
  Visit(ANode.FieldDeclListNode);
  Visit(ANode.VariantSectionNode);
  Visit(ANode.CloseParenthesisNode);
  Visit(ANode.SemicolonNode);
end;

procedure TVisitor.Visit(ANode: TVariantSectionNode);
begin
  // Visit child nodes
  Visit(ANode.CaseKeywordNode);
  Visit(ANode.NameNode);
  Visit(ANode.ColonNode);
  Visit(ANode.TypeNode);
  Visit(ANode.OfKeywordNode);
  Visit(ANode.VariantGroupListNode);
end;

procedure TVisitor.Visit(ANode: TVisibilityNode);
begin
  // Visit child nodes
  Visit(ANode.StrictSemikeywordNode);
  Visit(ANode.VisibilityKeywordNode);
end;

procedure TVisitor.Visit(ANode: TVisibilitySectionNode);
begin
  // Visit child nodes
  Visit(ANode.VisibilityNode);
  Visit(ANode.ContentListNode);
end;

procedure TVisitor.Visit(ANode: TWhileStatementNode);
begin
  // Visit child nodes
  Visit(ANode.WhileKeywordNode);
  Visit(ANode.ConditionNode);
  Visit(ANode.DoKeywordNode);
  Visit(ANode.StatementNode);
end;

procedure TVisitor.Visit(ANode: TWithStatementNode);
begin
  // Visit child nodes
  Visit(ANode.WithKeywordNode);
  Visit(ANode.ExpressionListNode);
  Visit(ANode.DoKeywordNode);
  Visit(ANode.StatementNode);
end;

end.
