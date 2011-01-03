unit UASTNode;

interface

uses
  ULocation;

type
  TASTNode = class
  private
    FParentNode: TASTNode;
    
  protected
    function GetLocation: TLocation; virtual; abstract;
    function GetEndLocation: TLocation; virtual; abstract;

  public
    /// Location at the start of the token
    property Location: TLocation read GetLocation;
    /// Location at the end of the token
    property EndLocation: TLocation read GetEndLocation;

    property ParentNode: TASTNode read FParentNode;

    class function ToCode(AFirstNode, ALastNode: TASTNode): string;
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

end.
