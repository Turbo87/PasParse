unit UToken;

interface

uses
  UTokenType, ULocation;

type
  TToken = class
  private
    FLocation: TLocation;
    FParsedText: string;
    FText: string;
    FTokenType: TTokenType;

    function GetEndLocation: TLocation;

  public
    constructor Create(ATokenType: TTokenType; ALocation: TLocation;
                       AText, AParsedText: string);

    property Location: TLocation read FLocation;
    property EndLocation: TLocation read GetEndLocation;
    property ParsedText: string read FParsedText;
    property Text: string read FText;
    property TokenType: TTokenType read FTokenType;
  end;

implementation

{ TToken }

constructor TToken.Create(ATokenType: TTokenType; ALocation: TLocation; AText,
  AParsedText: string);
begin
  FTokenType := ATokenType;
  FLocation := ALocation;
  FText := AText;
  FParsedText := AParsedText;
end;

function TToken.GetEndLocation: TLocation;
begin
  Result := TLocation.Create(FLocation.FileName, FLocation.FileSource,
                             FLocation.Offset + Length(FText));
end;

end.
