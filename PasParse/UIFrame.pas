unit UIFrame;

interface

uses
  ULocation, UTokenType, UITokenSet, UToken;

type
  IFrame = class
  protected
    function GetDisplayName: string; virtual; abstract;
    function GetIsEOF: Boolean; virtual; abstract;
    function GetLocation: TLocation; virtual; abstract;
    function GetNext: IFrame; virtual; abstract;
    procedure SetNext(const Value: IFrame); virtual; abstract;
    function GetTokenType: TTokenType; virtual; abstract;

  public
    property DisplayName: string read GetDisplayName;
    property IsEOF: Boolean read GetIsEOF;
    property Location: TLocation read GetLocation;
    property Next: IFrame read GetNext write SetNext;
    property TokenType: TTokenType read GetTokenType;

    function CanParseToken(ATokenSet: ITokenSet): Boolean; virtual; abstract;
    function ParseToken(ATokenSet: ITokenSet): TToken; virtual; abstract;
  end;

implementation

end.
