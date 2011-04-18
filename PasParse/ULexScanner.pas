unit ULexScanner;

interface

uses
  ULocation, UTokenType, UToken, UTokenSet, UDictionary, Contnrs;

type
  /// <Description>An instance of this class is returned when a matching token is found.</Description>
  TMatch = class(TObject)
  private
    /// <Description>Length of the token.</Description>
    FLength: Integer;
    /// <Description>Parsed text of the token.</Description>
    /// <Description>This is not whole the text that was tokenized!</Description>
    /// <Description>See CurlyBraceComment() for and example.</Description>
    FParsedText: string;
    /// <Description>Type of the token.</Description>
    FTokenType: TTokenType;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(ATokenType: TTokenType; ALength: Integer); overload;
    /// <Description>Additional constructor with parsed text.</Description>
    constructor Create(ATokenType: TTokenType; ALength: Integer;
      AParsedText: string); overload;

    /// <Description>Length of the token.</Description>
    property Length: Integer read FLength;
    /// <Description>Parsed text of the token.</Description>
    /// <Description>This is not whole the text that was tokenized!</Description>
    /// <Description>See CurlyBraceComment() for and example.</Description>
    property ParsedText: String read FParsedText;
    /// <Description>Type of the token.</Description>
    property TokenType: TTokenType read FTokenType;
  end;

  /// <Description>The tokenizer.</Description>
  /// <Description>Converts a string to a list of Tokens.</Description>
  TLexScanner = class(TObject)
  private
    /// <Description>Name of the file that this instance should tokenize.</Description>
    FFileName: string;
    /// <Description>Current reading position.</Description>
    FIndex: Integer;
    /// <Description>Content of the file that this instance should tokenize.</Description>
    FSource: string;
    /// <Description>Dictionary of (semi)keywords.</Description>
    FWordTypes: TDictionary;

    /// <Description>Adds contents of the given TTokenSet to the FWordTypes dictionary.</Description>
    procedure AddWordTypes(ATokenSet: TTokenSet; ASuffixLength: Integer);

    /// <Description>Searches for an identifier beginning with an ampersand (&).</Description>
    function AmpersandIdentifier: TMatch;
    /// <Description>Searches for an identifier.</Description>
    function BareWord: TMatch;
    /// <Description>Searches for a curly braces comment {...}.</Description>
    function CurlyBraceComment: TMatch;
    /// <Description>Searches for a dot-dot token (..).</Description>
    function DotDot: TMatch;
    /// <Description>Searches for a double-quoted apostrophe ("'").</Description>
    function DoubleQuotedApostrophe: TMatch;
    /// <Description>Searches for an equality or assignment operator (:= < <= <> = > >=).</Description>
    function EqualityOrAssignmentOperator: TMatch;
    /// <Description>Searches for a hexadecimal number.</Description>
    function HexNumber: TMatch;
    /// <Description>Searches for a decimal number.</Description>
    function Number: TMatch;
    /// <Description>Searches for a parenthesis-star comment (*...*).</Description>
    function ParenStarComment: TMatch;
    /// <Description>Searches for a valid single character token.</Description>
    function SingleCharacter: TMatch;
    /// <Description>Searches for a single line comment (// until next line break).</Description>
    function SingleLineComment: TMatch;
    /// <Description>Searches for a string literal.</Description>
    function StringLiteral: TMatch;

    /// <Description>Returns the next Match or nil if no Match found.</Description>
    /// <Description>The caller is responsible for freeing the Match instance!</Description>
    function NextMatch: TMatch;

    /// <Description>Checks whether the requested offset is still a valid string position.</Description>
    function CanRead(AOffset: Integer): Boolean;
    /// <Description>Reads the character at the given offset.</Description>
    function Read(AOffset: Integer): Char;
    /// <Description>Reads the character at the given offset.</Description>
    /// <Description>Returns End-of-Transmission character (#4) if invalid position.</Description>
    function Peek(AOffset: Integer): Char;

    /// <Description>Checks whether the given character is valid for starting an identifier.</Description>
    function IsWordLeadChar(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is valid for continuing an identifier.</Description>
    function IsWordContinuationChar(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is a valid hexadecimal digit.</Description>
    function IsHexDigit(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is a valid digit.</Description>
    function IsDigit(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is a letter (A-Z and a-z).</Description>
    function IsLetter(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is some form of whitespace.</Description>
    function IsWhitespace(AChar: Char): Boolean;
    /// <Description>Checks whether the given character is a line break character.</Description>
    function IsLineBreak(AChar: Char): Boolean;

    /// <Description>Returns a Location instance of the current reading position.</Description>
    /// <Description>The caller is responsible for freeing the Location instance!</Description>
    function GetLocation: TLocation;

    /// <Description>Returns a list with all found tokens.</Description>
    /// <Description>The caller is responsible for freeing the list!</Description>
    function GetTokens: TObjectList;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(ASource, AFileName: string);
    /// <Description>Default destructor.</Description>
    destructor Destroy; override;

    /// <Description>Returns the next Token or nil if end-of-file is reached.</Description>
    /// <Description>The caller is responsible for freeing the Token!</Description>
    function NextToken: TToken;

    /// <Description>Returns a Location instance of the current reading position.</Description>
    /// <Description>The caller is responsible for freeing the Location instance!</Description>
    property Location: TLocation read GetLocation;

    /// <Description>Returns a list with all found tokens.</Description>
    /// <Description>The caller is responsible for freeing the list!</Description>
    property Tokens: TObjectList read GetTokens;
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
      FWordTypes.Write(AnsiLowerCase(ABaseWord), TObject(ATokenType));
    end;  
  end;      
end;

function TLexScanner.AmpersandIdentifier: TMatch;
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

function TLexScanner.BareWord: TMatch;
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
      ATokenType := TTokenType(AObject)
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

function TLexScanner.CurlyBraceComment: TMatch;
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
  FWordTypes.Free;
  inherited;
end;

function TLexScanner.DotDot: TMatch;
begin
  if (Peek(0) = '.') and (Peek(1) = '.') then
    Result := TMatch.Create(TTDotDot, 2)
  else
    Result := nil;
end;

function TLexScanner.DoubleQuotedApostrophe: TMatch;
begin
  if (Peek(0) = '"') and (Peek(1) = '''') and (Peek(2) = '"') then
    Result := TMatch.Create(TTStringLiteral, 3)
  else
    Result := nil;
end;

function TLexScanner.EqualityOrAssignmentOperator: TMatch;
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
  Result := TLocation.Create(FFileName, FSource, FIndex + 1);
end;

function TLexScanner.GetTokens: TObjectList;
var
  AToken: TToken;
begin
  // Create TToken list
  Result := TObjectList.Create;
  try
    // Iterate through tokens and add them to the list
    repeat
      AToken := NextToken;
      // If last token reached, jump out of the loop
      if AToken = nil then
        Break;

      Result.Add(AToken);
    until False;
  except
    Result.Free;
    raise;
  end;
end;

function TLexScanner.HexNumber: TMatch;
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

function TLexScanner.IsLineBreak(AChar: Char): Boolean;
begin
  Result := (AChar = #10)
end;

function TLexScanner.IsWordContinuationChar(AChar: Char): Boolean;
begin
  Result := IsLetter(AChar) or IsDigit(AChar) or (AChar = '_');
end;

function TLexScanner.IsWordLeadChar(AChar: Char): Boolean;
begin
  Result := IsLetter(AChar) or (AChar = '_');
end;

function TLexScanner.NextMatch: TMatch;
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
      AMatch.Free;
    end;
  end;
end;

function TLexScanner.Number: TMatch;
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

function TLexScanner.ParenStarComment: TMatch;
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

function TLexScanner.SingleCharacter: TMatch;
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

function TLexScanner.SingleLineComment: TMatch;
var
  ALength: Integer;
begin
  if (Peek(0) <> '/') or (Peek(1) <> '/') then
    Result := nil
  else
  begin
    ALength := 2;
    while (CanRead(ALength)) and
          (Peek(ALength) <> #13) and
          (Peek(ALength) <> #10) do
      Inc(ALength);

    Result := TMatch.Create(TTSingleLineComment, ALength);
  end;
end;

function TLexScanner.StringLiteral: TMatch;
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

{ TMatch }

constructor TMatch.Create(ATokenType: TTokenType; ALength: Integer);
begin
  // Call overloaded constructor with AParsedText = ''
  Create(ATokenType, ALength, '');
end;

constructor TMatch.Create(ATokenType: TTokenType; ALength: Integer;
  AParsedText: string);
begin
  FTokenType := ATokenType;
  FLength := ALength;
  FParsedText := AParsedText;
end;

end.
