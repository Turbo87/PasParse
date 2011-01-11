unit UASTNode;

interface

uses
  ULocation, Contnrs;

type
  TASTNode = class
  type
    /// Key-Value-Pair based on string and TASTNode
    ///  The user is responsible for freeing FValue!
    TProperty = class
    private
      FKey: string;
      FValue: TASTNode;

    public
      property Key: string read FKey;
      property Value: TASTNode read FValue;

      constructor Create(const AKey: string; const AValue: TASTNode);
    end;

  private
    FParentNode: TASTNode;

  protected
    /// TObjectList with TASTNode elements
    FChildNodes: TObjectList;
    /// TObjectList with TASTNode.TProperty elements
    FProperties: TObjectList;

    constructor Create;

    function GetLocation: TLocation; virtual; abstract;
    function GetEndLocation: TLocation; virtual; abstract;

  public
    destructor Destroy; override;

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
  AChildNode: TASTNode;
begin
  FParentNode := AASTNode;
  for I := 0 to FChildNodes.Count - 1 do
  begin
    AChildNode := (FChildNodes.Items[I] as TASTNode);
    if AChildNode <> nil then
      AChildNode.BuildParentReferences(Self);
  end;
end;

constructor TASTNode.Create;
begin
  inherited;
  FChildNodes := TObjectList.Create;
  FProperties := TObjectList.Create;
end;

destructor TASTNode.Destroy;
begin
  FChildNodes.Free;
  FProperties.Free;
  inherited;
end;

function TASTNode.Inspect: string;
begin
  Result := InspectTo(0);
end;

function TASTNode.ToCode: string;
begin
  Result := ToCode(Self, Self);
end;

{ TASTNode.TProperty }

constructor TASTNode.TProperty.Create(const AKey: string;
  const AValue: TASTNode);
begin
  inherited Create;
  FKey := AKey;
  FValue := AValue;
end;

end.
