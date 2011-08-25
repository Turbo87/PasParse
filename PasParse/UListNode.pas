unit UListNode;

interface

uses
  UNonTerminalNode, UASTNode, Generics.Collections;

type
  TListNode = class(TNonTerminalNode)
  private
    function GetItem(const AIndex: Integer): TASTNode;
    function GetCount: Integer;

  public
    constructor Create(AItems: TObjectList<TASTNode>);

    function Clone: TASTNode; override;

    property Items[const AIndex: Integer]: TASTNode read GetItem;
    property ItemsCount: Integer read GetCount;
  end;

implementation

uses
  SysUtils;

{ TListNode }

function TListNode.Clone: TASTNode;
var
  AList: TObjectList<TASTNode>;
  I: Integer;
  AASTNode: TASTNode;
begin
  AList := TObjectList<TASTNode>.Create(False);

  for I := 0 to FChildNodes.Count - 1 do
  begin
    if FChildNodes[I] <> nil then
      AASTNode := FChildNodes[I].Clone
    else
      AASTNode := nil;
      
    AList.Add(AASTNode);
  end;

  Result := TListNode.Create(AList);
  AList.Free;
end;

constructor TListNode.Create(AItems: TObjectList<TASTNode>);
var
  I: Integer;
begin
  inherited Create;

  for I := 0 to AItems.Count - 1 do
  begin
    FChildNodes.Add(AItems[I]);
    FProperties.Add(TASTNodeProperty.Create('Items[' + IntToStr(I) + ']', (AItems[I] as TASTNode)));
  end;
end;

function TListNode.GetCount: Integer;
begin
  Result := FChildNodes.Count;
end;

function TListNode.GetItem(const AIndex: Integer): TASTNode;
begin
  Result := FChildNodes.Items[AIndex];
end;

end.
