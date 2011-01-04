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
    
    property DelimiterNode: TToken read FDelimiterNode;
    property ItemNode: TASTNode read FItemNode;
  end;

implementation

{ TDelimitedItemNode }

constructor TDelimitedItemNode.Create(AItemNode: TASTNode;
  ADelimiterNode: TToken);
begin
  inherited Create;
  FItemNode := AItemNode;
  FDelimiterNode := ADelimiterNode;

  FChildNodes.Add(AItemNode);
  FChildNodes.Add(ADelimiterNode);

  FProperties.Add(TASTNode.TProperty.Create('ItemNode', AItemNode));
  FProperties.Add(TASTNode.TProperty.Create('DelimiterNode', ADelimiterNode));
end;

end.
