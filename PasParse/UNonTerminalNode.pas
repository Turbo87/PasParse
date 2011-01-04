unit UNonTerminalNode;

interface

uses
  UASTNode, ULocation;

type
  TNonTerminalNode = class(TASTNode)
  protected
    function GetLocation: TLocation; override;
    function GetEndLocation: TLocation; override;

  public
    function InspectTo(AIndentCount: Integer): string; override;
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

function TNonTerminalNode.InspectTo(AIndentCount: Integer): string;
var
  AChildIndentCount: Integer;
  I: Integer;
  AProperty: TASTNode.TProperty;
begin
  Result := Copy(ClassName, 2);
  AChildIndentCount := AIndentCount + 1;
  for I := 0 to FProperties.Count - 1 do
  begin
    AProperty := (FProperties.Items[I] as TASTNode.TProperty);
    Result := Result + #13#10 + StringOfChar(' ', AChildIndentCount * 2) +
      AProperty.Key + ': ';
    if AProperty.Value <> nil then
      Result := Result + AProperty.Value.InspectTo(AChildIndentCount)
    else
      Result := Result + '(none)';
  end;
end;

end.
