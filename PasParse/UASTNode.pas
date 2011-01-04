unit UASTNode;

interface

uses
  ULocation, Contnrs;

type
  TASTNode = class
  private
    FParentNode: TASTNode;

  protected
    FChildNodes: TObjectList;

    function GetLocation: TLocation; virtual; abstract;
    function GetEndLocation: TLocation; virtual; abstract;

  public
    /// Location at the start of the token
    property Location: TLocation read GetLocation;
    /// Location at the end of the token
    property EndLocation: TLocation read GetEndLocation;

    function InspectTo(AIndentCount: Integer): string; virtual; abstract;

    procedure BuildParentReferences(AASTNode: TASTNode);
    property ParentNode: TASTNode read FParentNode;

    class function ToCode(AFirstNode, ALastNode: TASTNode): string; overload;
    function ToCode: string; overload;
    function Inspect: string;
  end;

implementation

{ TASTNode }

class function TASTNode.ToCode(AFirstNode, ALastNode: TASTNode): string;
var
  AFirst, ALast: TLocation;
begin
  AFirst := AFirstNode.Location;
  ALast := ALastNode.EndLocation;
  if AFirst.FileName <> ALast.FileName then
    Result := '<code spans include files>'
  else
    Result :=
      Copy(AFirst.FileSource, AFirst.Offset, ALast.Offset - AFirst.Offset);  
end;

procedure TASTNode.BuildParentReferences(AASTNode: TASTNode);
var
  I: Integer;
begin
  FParentNode := AASTNode;
  for I := 0 to FChildNodes.Count - 1 do
  begin
    (FChildNodes.Items[I] as TASTNode).BuildParentReferences(Self);
  end;
end;

function TASTNode.Inspect: string;
begin
  Result := InspectTo(0);
end;

function TASTNode.ToCode: string;
begin
  Result := ToCode(Self, Self);
end;

end.
