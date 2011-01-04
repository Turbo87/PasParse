unit UBinaryOperationNode;

interface

uses
  UNonTerminalNode, UASTNode, UToken;

type
  TBinaryOperationNode = class(TNonTerminalNode)
  private
    FLeftNode: TASTNode;
    FOperatorNode: TToken;
    FRightNode: TASTNode;

  public
    constructor Create(ALeftNode: TASTNode; AOperatorNode: TToken;
      ARightNode: TASTNode);
    
    property LeftNode: TASTNode read FLeftNode;
    property OperatorNode: TToken read FOperatorNode;
    property RightNode: TASTNode read FRightNode;
  end;

implementation

{ TBinaryOperationNode }

constructor TBinaryOperationNode.Create(ALeftNode: TASTNode;
  AOperatorNode: TToken; ARightNode: TASTNode);
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

end.
