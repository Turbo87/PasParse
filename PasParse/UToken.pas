unit UToken;

interface

uses
  UTokenType, ULocation;

type
  /// Represents a token including it's text, positions and token type
  TToken = class
  private
    FLocation: TLocation;
    FParsedText: string;
    FText: string;
    FTokenType: TTokenType;

    function GetEndLocation: TLocation;

  public
    /// Standard constructor
    constructor Create(ATokenType: TTokenType; ALocation: TLocation;
                       AText, AParsedText: string);

    /// Location at the start of the token
    property Location: TLocation read FLocation;
    /// Location at the end of the token
    property EndLocation: TLocation read GetEndLocation;
    /// Parsed text if available, otherwise empty string ''
    property ParsedText: string read FParsedText;
    /// Textual representation of the token
    property Text: string read FText;
    /// Type of the token
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
  // Create a new TLocation instance at the end position of the token
  Result := TLocation.Create(FLocation.FileName, FLocation.FileSource,
                             FLocation.Offset + Length(FText));
end;

end.
