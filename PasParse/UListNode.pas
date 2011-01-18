unit UListNode;

interface

uses
  UNonTerminalNode, UASTNode, Contnrs;

type
  TListNode = class(TNonTerminalNode)
  private
    function GetItem(const AIndex: Integer): TASTNode;
    function GetCount: Integer;

  public
    constructor Create(AItems: TObjectList);

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
  AList: TObjectList;
  I: Integer;
begin
  AList := TObjectList.Create(False);

  for I := 0 to FChildNodes.Count - 1 do
    AList.Add((FChildNodes[I] as TASTNode).Clone);

  Result := TListNode.Create(AList);
  AList.Free;
end;

constructor TListNode.Create(AItems: TObjectList);
var
  I: Integer;
begin
  inherited Create;

  for I := 0 to AItems.Count - 1 do
    FChildNodes.Add(AItems[I]);

  for I := 0 to AItems.Count - 1 do
    FProperties.Add(TASTNode.TProperty.Create('Items[' + IntToStr(I) + ']', (AItems[I] as TASTNode)));
end;

function TListNode.GetCount: Integer;
begin
  Result := FChildNodes.Count;
end;

function TListNode.GetItem(const AIndex: Integer): TASTNode;
begin
  Result := (FChildNodes.Items[AIndex] as TASTNode);
end;

end.
