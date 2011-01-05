unit UIParser;

interface

uses
  UToken, UITokenSet, UTokenType, UListNode, UParseException;

type
  IParser = class
  protected
    function ParseToken(ATokenType: TTokenType): TToken; overload; virtual; abstract;
    function ParseTokenList(ATokenSet: ITokenSet): TListNode; virtual; abstract;
    function TryParseToken(ATokenType: TTokenType): TToken; virtual; abstract;
    function CanParseToken(ATokenType: TTokenType): Boolean; overload; virtual; abstract;

    function Peek(AOffset: Integer): TTokenType; virtual; abstract;

    function CreateEmptyListNode: TListNode; virtual; abstract;

    procedure MoveNext; virtual; abstract;

  public
    function ParseToken(ATokenSet: ITokenSet): TToken; overload; virtual; abstract;
    function CanParseToken(ATokenSet: ITokenSet): Boolean; overload; virtual; abstract;

    function Failure(AExpected: string): EParseException; virtual; abstract;
  end;

implementation

end.
