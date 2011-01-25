unit UASTNode;

interface

uses
  ULocation, Contnrs;

type
  TASTNode = class;

  /// <Description>A Key-Value-Pair mapping a string to a ASTNode.</Description>
  /// <Description>The value (ASTNode) is not automatically destroyed on destruction of the Property!</Description>
  TASTNodeProperty = class
  private
    /// <Description>The key (string).</Description>
    FKey: string;
    /// <Description>The value (ASTNode).</Description>
    FValue: TASTNode;

  public
    /// <Description>Public read-only accessor for the key.</Description>
    property Key: string read FKey;
    /// <Description>Public read-only accessor for the value.</Description>
    property Value: TASTNode read FValue;

    /// <Description>Default constructor. Assigns key and value.</Description>
    constructor Create(const AKey: string; const AValue: TASTNode);
  end;

  /// <Description>Prototype/Interface for an Abstract Syntax Tree Node.</Description>
  TASTNode = class
  private
    /// <Description>Pointer to the parent node</Description>
    FParentNode: TASTNode;

  protected
    /// <Description>TObjectList of TASTNode elements.</Description>
    FChildNodes: TObjectList;
    /// <Description>TObjectList of TASTNodeProperty elements.</Description>
    FProperties: TObjectList;

    /// <Description>Default constructor.</Description>
    /// <Description>Should only be called by "inherited" of derived constructors.</Description>
    constructor Create;

    /// <Description>Returns the start Location of the Node.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function GetLocation: TLocation; virtual; abstract;
    /// <Description>Returns the end Location of the Node.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function GetEndLocation: TLocation; virtual; abstract;

  public
    /// <Description>Default destructor. Destroys all child nodes too!</Description>
    destructor Destroy; override;

    /// <Description>Returns the start Location of the Node.</Description>
    /// <Description>Calls the GetLocation() function.</Description>
    property Location: TLocation read GetLocation;
    /// <Description>Returns the end Location of the Node.</Description>
    /// <Description>Calls the GetEndLocation() function.</Description>
    property EndLocation: TLocation read GetEndLocation;

    /// <Description>Textual representation of the ASTNode.</Description>
    function Inspect: string;
    /// <Description>Textual representation of the ASTNode with a specified indentation level.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function InspectTo(AIndentCount: Integer): string; virtual; abstract;

    /// <Description>Creates a clone of the ASTNode.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function Clone: TASTNode; virtual; abstract;

    /// <Description>Recursively saves the parent ASTNode pointers.</Description>
    procedure BuildParentReferences(AASTNode: TASTNode);
    /// <Description>Returns read-only pointer to the parent ASTNode.</Description>
    property ParentNode: TASTNode read FParentNode;

    /// <Description>Returns the code between and including the given first and last ASTNodes.</Description>
    class function ToCode(AFirstNode, ALastNode: TASTNode): string; overload;
    /// <Description>Returns the code of this node.</Description>
    function ToCode: string; overload;
  end;

implementation

{ TASTNode }

class function TASTNode.ToCode(AFirstNode, ALastNode: TASTNode): string;
var
  AFirst, ALast: TLocation;
begin
  // Retrieve start and end Location of the ASTNodes
  AFirst := AFirstNode.Location;
  ALast := ALastNode.EndLocation;
  if AFirst.FileName <> ALast.FileName then
    // If the ASTNodes are in different files this won't work
    Result := '<code spans include files>'
  else
    // Otherwise copy and return the code between the two Locations
    Result :=
      Copy(AFirst.FileSource, AFirst.Offset, ALast.Offset - AFirst.Offset);  
end;

procedure TASTNode.BuildParentReferences(AASTNode: TASTNode);
var
  I: Integer;
  AChildNode: TASTNode;
begin
  // Save the argument as the new parent ASTNode
  FParentNode := AASTNode;
  // Tell the children that Self is their parent
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
  // Make room for children and properties
  FChildNodes := TObjectList.Create;
  FProperties := TObjectList.Create;
end;

destructor TASTNode.Destroy;
begin
  // Kill children and destroy properties
  FChildNodes.Free;
  FProperties.Free;
  inherited;
end;

function TASTNode.Inspect: string;
begin
  // Return InspectTo() with an indentation level of zero
  Result := InspectTo(0);
end;

function TASTNode.ToCode: string;
begin
  // Return ToCode() of just this one ASTNode
  Result := ToCode(Self, Self);
end;

{ TASTNodeProperty }

constructor TASTNodeProperty.Create(const AKey: string;
  const AValue: TASTNode);
begin
  inherited Create;
  // Assign key and value fields
  FKey := AKey;
  FValue := AValue;
end;

end.
