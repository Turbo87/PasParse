unit UIParser;

interface

uses
  UToken, UITokenSet, UTokenType, UListNode, UParseException,
  URuleType, UASTNode, UIFrame;

type
  IParser = class
  protected
    function TryParseToken(ATokenType: TTokenType): TToken; virtual; abstract;

    function GetNextFrame: IFrame; virtual; abstract;
    procedure SetNextFrame(const Value: IFrame); virtual; abstract;

  public
    function ParseToken(ATokenSet: ITokenSet): TToken; overload; virtual; abstract;
    function ParseToken(ATokenType: TTokenType): TToken; overload; virtual; abstract;
    function ParseTokenList(ATokenSet: ITokenSet): TListNode; virtual; abstract;
    function CanParseToken(ATokenSet: ITokenSet): Boolean; overload; virtual; abstract;
    function CanParseToken(ATokenType: TTokenType): Boolean; overload; virtual; abstract;
    function ParseDelimitedList(AItemRule: TRuleType; ADelimiterType: TTokenType): TListNode; virtual; abstract;
    function ParseRequiredRuleList(ARuleType: TRuleType): TListNode; virtual; abstract;
    function ParseOptionalRuleList(ARuleType: TRuleType): TListNode; virtual; abstract;
    function ParseOptionalStatementList: TListNode; virtual; abstract;
    function CanParseRule(ARuleType: TRuleType): Boolean; virtual; abstract;
    function ParseRuleInternal(ARuleType: TRuleType): TASTNode; virtual; abstract;

    function CreateEmptyListNode: TListNode; virtual; abstract;

    function Peek(AOffset: Integer): TTokenType; virtual; abstract;
    procedure MoveNext; virtual; abstract;

    property NextFrame: IFrame read GetNextFrame write SetNextFrame;

    function Failure(AExpected: string): EParseException; virtual; abstract;
  end;

implementation

end.
