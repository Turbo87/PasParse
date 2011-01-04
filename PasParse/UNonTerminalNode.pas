unit UNonTerminalNode;

interface

uses
  UASTNode, ULocation;

type
  TNonTerminalNode = class(TASTNode)
  protected
    function GetLocation: TLocation; override;
    function GetEndLocation: TLocation; override;
  end;

implementation

{ TNonTerminalNode }

function TNonTerminalNode.GetEndLocation: TLocation;
var
  I: Integer;
begin
  Result := nil;
  
  for I := FChildNodes.Count - 1 downto 0 do
  begin
    Result := (FChildNodes.Items[I] as TASTNode).EndLocation;
    if Result <> nil then
      Break;
  end;
end;

function TNonTerminalNode.GetLocation: TLocation;
var
  I: Integer;
begin
  Result := nil;

  for I := 0 to FChildNodes.Count - 1 do
  begin
    Result := (FChildNodes.Items[I] as TASTNode).Location;
    if Result <> nil then
      Break;
  end;
end;

end.
