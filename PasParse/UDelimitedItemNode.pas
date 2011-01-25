unit UDelimitedItemNode;

interface

uses
  UNonTerminalNode, UASTNode, UToken;

type
  TDelimitedItemNode = class(TNonTerminalNode)
  private
    FDelimiterNode: TToken;
    FItemNode: TASTNode;

  public
    constructor Create(AItemNode: TASTNode; ADelimiterNode: TToken);

    function Clone: TASTNode; override;
    
    property DelimiterNode: TToken read FDelimiterNode;
    property ItemNode: TASTNode read FItemNode;
  end;

implementation

{ TDelimitedItemNode }

function TDelimitedItemNode.Clone: TASTNode;
begin
  Result := TDelimitedItemNode.Create(
    FItemNode.Clone as TASTNode,
    FDelimiterNode.Clone as TToken);
end;

constructor TDelimitedItemNode.Create(AItemNode: TASTNode;
  ADelimiterNode: TToken);
begin
  inherited Create;
  FItemNode := AItemNode;
  FDelimiterNode := ADelimiterNode;

  FChildNodes.Add(AItemNode);
  FChildNodes.Add(ADelimiterNode);

  FProperties.Add(TASTNodeProperty.Create('ItemNode', AItemNode));
  FProperties.Add(TASTNodeProperty.Create('DelimiterNode', ADelimiterNode));
end;

end.
