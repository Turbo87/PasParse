unit UFrame;

interface

uses
  ULocation, UTokenType, UTokenSet, UToken;

type
  TFrame = class
  protected
    function GetDisplayName: string; virtual; abstract;
    function GetIsEOF: Boolean; virtual; abstract;
    function GetLocation: TLocation; virtual; abstract;
    function GetNext: TFrame; virtual; abstract;
    function GetTokenType: TTokenType; virtual; abstract;

  public
    property DisplayName: string read GetDisplayName;
    property IsEOF: Boolean read GetIsEOF;
    property Location: TLocation read GetLocation;
    property Next: TFrame read GetNext;
    property TokenType: TTokenType read GetTokenType;

    function CanParseToken(ATokenSet: TTokenSet): Boolean; virtual; abstract;
    function ParseToken(ATokenSet: TTokenSet): TToken; virtual; abstract;
  end;

implementation

end.
