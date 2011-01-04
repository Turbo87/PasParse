unit ULexScanner;

interface

uses
  ULocation, UTokenType, UToken, UTokenSet, UDictionary;

type
  TLexScanner = class(TObject)
  type
    /// An instance of this class is returned when a matching token is found
    TMatch = class(TObject)
    private
      FLength: Integer;
      FParsedText: string;
      FTokenType: TTokenType;
    public
      /// Standard constructor
      constructor Create(ATokenType: TTokenType; ALength: Integer); overload;
      /// Additional constructor with parsed text
      constructor Create(ATokenType: TTokenType; ALength: Integer;
                         AParsedText: string); overload;

      /// Length of the found token
      property Length: Integer read FLength;
      property ParsedText: String read FParsedText;
      /// Type of the token
      property TokenType: TTokenType read FTokenType;
    end;

  private
    FFileName: string;
    FIndex: Integer;
    FSource: string;
    FWordTypes: TDictionary;

    /// Adds contents of the given TTokenSet to the FWordTypes dictionary
    procedure AddWordTypes(ATokenSet: TTokenSet; ASuffixLength: Integer);

    /// Searches for an identifier beginning with an ampersand (&)
    function AmpersandIdentifier: TLexScanner.TMatch;
    /// Searches for an identifier
    function BareWord: TLexScanner.TMatch;
    /// Searches for a curly braces comment {...}
    function CurlyBraceComment: TLexScanner.TMatch;
    /// Searches for a dot-dot token (..)
    function DotDot: TLexScanner.TMatch;
    /// Searches for a double-quoted apostrophe ("'")
    function DoubleQuotedApostrophe: TLexScanner.TMatch;
    /// Searches for an equality or assignment operator (:= < <= <> = > >=)
    function EqualityOrAssignmentOperator: TLexScanner.TMatch;
    /// Searches for a hexadecimal number
    function HexNumber: TLexScanner.TMatch;
    /// Searches for a decimal number
    function Number: TLexScanner.TMatch;
    /// Searches for a parenthesis-star comment (*...*)
    function ParenStarComment: TLexScanner.TMatch;
    /// Searches for a valid single character token
    function SingleCharacter: TLexScanner.TMatch;
    /// Searches for a single line comment (// until next line break)                                
    function SingleLineComment: TLexScanner.TMatch;
    /// Searches for a string literal
    function StringLiteral: TLexScanner.TMatch;

    /// Retrieve the next match, returns nil if no match found
    ///  The caller needs to make sure that the created
    ///  TMatch instance is freed again
    function NextMatch: TLexScanner.TMatch;

    /// Checks whether the requested offset is still a valid string position
    function CanRead(AOffset: Integer): Boolean;
    /// Reads the character at the given offset
    function Read(AOffset: Integer): Char;
    /// Reads the character at the given offset (checks for valid position first)
    function Peek(AOffset: Integer): Char;

    /// Checks whether the given character is valid for starting an identifier
    function IsWordLeadChar(AChar: Char): Boolean;
    /// Checks whether the given character is valid for continuing an identifier
    function IsWordContinuationChar(AChar: Char): Boolean;
    /// Checks whether the given character is a valid hexadecimal digit
    function IsHexDigit(AChar: Char): Boolean;
    /// Checks whether the given character is a valid digit
    function IsDigit(AChar: Char): Boolean;
    /// Checks whether the given character is a letter (A-Z and a-z)
    function IsLetter(AChar: Char): Boolean;
    /// Checks whether the given character is some form of whitespace
    function IsWhitespace(AChar: Char): Boolean;

    /// Returns a TLocation record of the current reading position
    function GetLocation: TLocation;

  public
    /// Standard constructor
    constructor Create(ASource, AFileName: string);
    destructor Destroy; override;

    /// Read-only representation of the current reading position as TLocation
    property Location: TLocation read GetLocation;

    /// Retrieve the next token, returns nil if end-of-file
    ///  The caller needs to make sure that the created
    ///  TToken instance is freed again
    function NextToken: TToken;
  end;

implementation

uses
  ULexException, TypInfo, SysUtils, UTokenSets;

{ TLexScanner }

procedure TLexScanner.AddWordTypes(ATokenSet: TTokenSet;
                                   ASuffixLength: Integer);
var
  ATokenType: TTokenType;
  ATokenString: string;
  ABaseWord: string;
begin
  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given TTokenSet contains the current token type
    if ATokenSet.Contains(ATokenType) then
    begin
      // Get token name (e.g. TTIfKeyword)
      ATokenString := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      // Convert token name to keyword (e.g. TTIfKeyword -> If)
      ABaseWord := Copy(ATokenString, 3, Length(ATokenString) - ASuffixLength);
      // Add keyword-token pair to FWordTypes keyword list
      FWordTypes.Write(AnsiLowerCase(ABaseWord), TObject(Integer(ATokenType)));
    end;  
  end;      
end;

function TLexScanner.AmpersandIdentifier: TLexScanner.TMatch;
var
  ALength: Integer;
begin
  if (Peek(0) <> '&') or (not IsWordLeadChar(Peek(1))) then
    Result := nil
  else
  begin
    ALength := 2;
    while IsWordContinuationChar(Peek(ALength)) do
      Inc(ALength);

    Result := TMatch.Create(TTIdentifier, ALength);
  end;
end;

function TLexScanner.BareWord: TLexScanner.TMatch;
var
  ALength: Integer;
  AWord: string;
  ATokenType: TTokenType;
  AObject: TObject;
begin
  if not IsWordLeadChar(Peek(0)) then
    Result := nil
  else
  begin
    ALength := 1;
    while IsWordContinuationChar(Peek(ALength)) do
      Inc(ALength);

    // Check whether the parsed identifier is a known keyword
    AWord := Copy(FSource, FIndex + 1, ALength);
    if FWordTypes.Read(AnsiLowerCase(AWord), AObject) then
      ATokenType := TTokenType(Integer(AObject))
    else
      ATokenType := TTIdentifier;

    Result := TMatch.Create(ATokenType, ALength);
  end;
end;

function TLexScanner.CanRead(AOffset: Integer): Boolean;
begin
  Result := (FIndex + AOffset < Length(FSource));
end;

constructor TLexScanner.Create(ASource, AFileName: string);
begin
  // Save source string and filename
  FSource := ASource;
  FFileName := AFileName;

  // Create new keyword list
  FWordTypes := TDictionary.Create;
  // Added (semi-)keywords to the keyword list
  AddWordTypes(TTokenSets.TSSemikeyword, Length('TTSemikeyword'));
  AddWordTypes(TTokenSets.TSKeyword, Length('TTKeyword'));

  // Set current reading position to zero
  FIndex := 0;
end;

function TLexScanner.CurlyBraceComment: TLexScanner.TMatch;
var
  ALength: Integer;
  AParsedText: string;
begin
  if Peek(0) <> '{' then
    Result := nil
  else
  begin
    ALength := 1;
    while (CanRead(ALength)) and (Peek(ALength) <> '}') do
      Inc(ALength);

    Inc(ALength);

    // Check for compiler directive {$...}
    if Peek(1) = '$' then
    begin
      AParsedText := Trim(Copy(FSource, FIndex + 3, ALength - 3));
      Result := TMatch.Create(TTCompilerDirective, ALength, AParsedText);
    end
    else
      Result := TMatch.Create(TTCurlyBraceComment, ALength);
  end;
end;

destructor TLexScanner.Destroy;
begin
  // Destroy keyword list
  FreeAndNil(FWordTypes);
  inherited;
end;

function TLexScanner.DotDot: TLexScanner.TMatch;
begin
  if (Peek(0) = '.') and (Peek(1) = '.') then
    Result := TMatch.Create(TTDotDot, 2)
  else
    Result := nil;
end;

function TLexScanner.DoubleQuotedApostrophe: TLexScanner.TMatch;
begin
  if (Peek(0) = '"') and (Peek(1) = '''') and (Peek(2) = '"') then
    Result := TMatch.Create(TTStringLiteral, 3)
  else
    Result := nil;
end;

function TLexScanner.EqualityOrAssignmentOperator: TLexScanner.TMatch;
begin
  Result := nil;
  case Peek(0) of
    ':':
      if Peek(1) = '=' then
        Result := TMatch.Create(TTColonEquals, 2);
    '<':
      case Peek(1) of
        '=':
          Result := TMatch.Create(TTLessOrEqual, 2);
        '>':
          Result := TMatch.Create(TTNotEqual, 2);
        else
          Result := TMatch.Create(TTLessThan, 1);
      end;
    '=':
      Result := TMatch.Create(TTEqualSign, 1);
    '>':
      if Peek(1) = '=' then
        Result := TMatch.Create(TTGreaterOrEqual, 2)
      else
        Result := TMatch.Create(TTGreaterThan, 1);
  end;
end;

function TLexScanner.GetLocation: TLocation;
begin
  // TLocation is a record. No need to free it again afterwards.
  Result := TLocation.Create(FFileName, FSource, FIndex);
end;

function TLexScanner.HexNumber: TLexScanner.TMatch;
var
  ALength: Integer;
begin
  // Hex number begins with $
  if Peek(0) <> '$' then
    Result := nil
  else
  begin
    ALength := 1;
    while IsHexDigit(Peek(ALength)) do
      Inc(ALength);

    Result := TMatch.Create(TTNumber, ALength);
  end;
end;

function TLexScanner.IsDigit(AChar: Char): Boolean;
begin
  Result := ((AChar <= '9') and (AChar >= '0'))
end;

function TLexScanner.IsHexDigit(AChar: Char): Boolean;
begin
  Result := IsDigit(AChar) or
            ((AChar <= 'F') and (AChar >= 'A')) or
            ((AChar <= 'f') and (AChar >= 'a'));
end;

function TLexScanner.IsLetter(AChar: Char): Boolean;
begin
  Result := ((AChar <= 'Z') and (AChar >= 'A')) or
            ((AChar <= 'z') and (AChar >= 'a'));
end;

function TLexScanner.IsWhitespace(AChar: Char): Boolean;
begin
  Result := ((AChar <= #13) and (AChar >= #9)) or (AChar = ' ')
end;

function TLexScanner.IsWordContinuationChar(AChar: Char): Boolean;
begin
  Result := IsLetter(AChar) or IsDigit(AChar) or (AChar = '_');
end;

function TLexScanner.IsWordLeadChar(AChar: Char): Boolean;
begin
  Result := IsLetter(AChar) or (AChar = '_');
end;

function TLexScanner.NextMatch: TLexScanner.TMatch;
begin
  Result := BareWord;
  if Result = nil then
    Result := EqualityOrAssignmentOperator;
  if Result = nil then
    Result := Number;
  if Result = nil then
    Result := StringLiteral;
  if Result = nil then
    Result := SingleLineComment;
  if Result = nil then
    Result := CurlyBraceComment;
  if Result = nil then
    Result := ParenStarComment;
  if Result = nil then
    Result := DotDot;
  if Result = nil then
    Result := SingleCharacter;
  if Result = nil then
    Result := HexNumber;
  if Result = nil then
    Result := AmpersandIdentifier;
  if Result = nil then
    Result := DoubleQuotedApostrophe;
end;

function TLexScanner.NextToken: TToken;
var
  AMatch: TMatch;
  AText: string;
begin
  // Skip whitespace
  while (FIndex < Length(FSource)) and IsWhitespace(Peek(0))  do
    Inc(FIndex);

  // End-of-file reached
  if FIndex >= Length(FSource) then
    Result := nil
  else
  begin
    // Get next match
    AMatch := NextMatch;
    // If not match found -> raise exception
    if AMatch = nil then
      raise ELexException.Create('Unrecognized character ''' + Peek(0) + '''',
                                 Location)
    else
    begin
      // Create a new TToken instance from the match that was found
      AText := Copy(FSource, FIndex + 1, AMatch.Length);
      Result := TToken.Create(AMatch.TokenType, Location, AText,
                              AMatch.ParsedText);
      Inc(FIndex, AMatch.Length);
      FreeAndNil(AMatch);
    end;
  end;
end;

function TLexScanner.Number: TLexScanner.TMatch;
var
  ALength: Integer;
begin
  if not IsDigit(Peek(0)) then
    Result := nil
  else
  begin
    ALength := 1;
    while IsDigit(Peek(ALength)) do
      Inc(ALength);

    // Check for decimal point
    if (Peek(ALength) = '.') and (Peek(ALength + 1) <> '.') then
    begin
      Inc(ALength);
      while IsDigit(Peek(ALength)) do
        Inc(ALength);
    end;

    // Check for exponential format
    if (Peek(ALength) = 'e') or (Peek(ALength) = 'E') then
    begin
      Inc(ALength);
      if (Peek(ALength) = '+') or (Peek(ALength) = '-') then
        Inc(ALength);
      while IsDigit(Peek(ALength)) do
        Inc(ALength);
    end;

    Result := TMatch.Create(TTNumber, ALength);
  end;
end;

function TLexScanner.ParenStarComment: TLexScanner.TMatch;
var
  ALength: Integer;
  AParsedText: string;
begin
  if (Peek(0) <> '(') or (Peek(1) <> '*') then
    Result := nil
  else
  begin
    ALength := 2;
    while (CanRead(ALength)) and
          (not ((Peek(ALength) = '*') and (Peek(ALength + 1) = ')'))) do
      Inc(ALength);

    Inc(ALength, 2);

    // Check for compiler directive {$...}
    if Peek(2) = '$' then
    begin
      AParsedText := Trim(Copy(FSource, FIndex + 4, ALength - 5));
      Result := TMatch.Create(TTCompilerDirective, ALength, AParsedText);
    end
    else
      Result := TMatch.Create(TTParenStarComment, ALength);
  end;
end;

function TLexScanner.Peek(AOffset: Integer): Char;
begin
  if CanRead(AOffset) then
    Result := Read(AOffset)
  else
    // #4 = End of Transmission
    Result := #4;
end;

function TLexScanner.Read(AOffset: Integer): Char;
begin
  // Delphi string indices start with 1!!
  Result := FSource[FIndex + AOffset + 1];
end;

function TLexScanner.SingleCharacter: TLexScanner.TMatch;
begin
  Result := nil;
  case Peek(0) of
    '(': Result := TMatch.Create(TTOpenParenthesis, 1);
    ')': Result := TMatch.Create(TTCloseParenthesis, 1);
    '*': Result := TMatch.Create(TTTimesSign, 1);
    '+': Result := TMatch.Create(TTPlusSign, 1);
    ',': Result := TMatch.Create(TTComma, 1);
    '-': Result := TMatch.Create(TTMinusSign, 1);
    '.': Result := TMatch.Create(TTDot, 1);
    '/': Result := TMatch.Create(TTDivideBySign, 1);
    ':': Result := TMatch.Create(TTColon, 1);
    ';': Result := TMatch.Create(TTSemicolon, 1);
    '@': Result := TMatch.Create(TTAtSign, 1);
    '[': Result := TMatch.Create(TTOpenBracket, 1);
    ']': Result := TMatch.Create(TTCloseBracket, 1);
    '^': Result := TMatch.Create(TTCaret, 1);
  end;
end;

function TLexScanner.SingleLineComment: TLexScanner.TMatch;
var
  ALength: Integer;
begin
  if (Peek(0) <> '/') or (Peek(1) <> '/') then
    Result := nil
  else
  begin
    ALength := 2;
    // TODO strip trailing \n
    while (CanRead(ALength)) and
          (Peek(ALength) <> #13) and
          (Peek(ALength) <> #10) do
      Inc(ALength);

    Result := TMatch.Create(TTSingleLineComment, ALength);
  end;
end;

function TLexScanner.StringLiteral: TLexScanner.TMatch;
var
  ALength: Integer;
begin
  if (Peek(0) <> '''') and (Peek(0) <> '#') then
    Result := nil
  else
  begin
    ALength := 0;
    while (Peek(ALength) = '''') or (Peek(ALength) = '#') do
    begin
      if Peek(ALength) = '''' then
      begin
        Inc(ALength);
        while CanRead(ALength) and (Read(ALength) <> '''') do
          Inc(ALength);
        if (not CanRead(ALength)) and (Read(ALength) <> '''') then
          raise ELexException.Create('Closing apostrophe missing', Location);
        Inc(ALength);
      end
      else
      begin
        Inc(ALength);
        if Peek(ALength) = '$' then
          Inc(ALength);
        while (IsLetter(Peek(ALength))) or (IsDigit(Peek(ALength))) do
          Inc(ALength);        
      end;    
    end;

    Result := TMatch.Create(TTStringLiteral, ALength);
  end;
end;

{ TLexScanner.TMatch }

constructor TLexScanner.TMatch.Create(ATokenType: TTokenType; ALength: Integer);
begin
  // Call overloaded constructor with AParsedText = ''
  Create(ATokenType, ALength, '');
end;

constructor TLexScanner.TMatch.Create(ATokenType: TTokenType; ALength: Integer;
  AParsedText: string);
begin
  FTokenType := ATokenType;
  FLength := ALength;
  FParsedText := AParsedText;
end;

end.
