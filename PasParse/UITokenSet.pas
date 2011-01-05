unit UITokenSet;

interface

uses
  UTokenType;

type
  ITokenSet = class
  protected
    function GetName: string; virtual; abstract;

  public
    /// Checks whether the set contains the given token type
    function Contains(ATokenType: TTokenType): Boolean; virtual; abstract;

    property Name: string read GetName;
  end;

implementation

end.
