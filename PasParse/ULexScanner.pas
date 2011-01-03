unit ULexScanner;

interface

uses
  ULocation, UTokenType, UToken, UTokenSet, Classes;

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
    FWordTypes: TStringList;

    /// Adds contents of the given TTokenSet to the FWordTypes dictionary
    procedure AddWordTypes(ATokenTypes: TTokenSet; ASuffixLength: Integer);

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

    /// Retrieve the next token, returns nil if end-of-file
    function NextToken: TToken;
  end;

implementation

uses
  ULexException, TypInfo, SysUtils, UTokenSets;

{ TLexScanner }

procedure TLexScanner.AddWordTypes(ATokenTypes: TTokenSet;
                                   ASuffixLength: Integer);
var
  ATokenType: TTokenType;
  ATokenString: string;
  ABaseWord: string;
begin
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    if ATokenTypes.Contains(ATokenType) then
    begin
      ATokenString := GetEnumName(TypeInfo(TTokenType), Integer(ATokenType));
      ABaseWord := Copy(ATokenString, 3, Length(ATokenString) - ASuffixLength);
      FWordTypes.AddObject(AnsiLowerCase(ABaseWord), TObject(Integer(ATokenType)));
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
  AIndex: integer;
begin
  if not IsWordLeadChar(Peek(0)) then
    Result := nil
  else
  begin
    ALength := 1;
    while IsWordContinuationChar(Peek(ALength)) do
      Inc(ALength);

    AWord := Copy(FSource, FIndex + 1, ALength);
    AIndex := FWordTypes.IndexOf(AnsiLowerCase(AWord));
    if AIndex > -1 then
      ATokenType := TTokenType(Integer(FWordTypes.Objects[AIndex]))
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
  FSource := ASource;
  FFileName := AFileName;

  FWordTypes := TStringList.Create;
  AddWordTypes(TTokenSets.TSSemikeyword, Length('TTSemikeyword'));
  AddWordTypes(TTokenSets.TSKeyword, Length('TTKeyword'));

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
    
    if Peek(1) = '$' then
    begin
      AParsedText := Copy(FSource, FIndex + 3, ALength - 3);
      Result := TMatch.Create(TTCompilerDirective, ALength, AParsedText);
    end
    else
      Result := TMatch.Create(TTCurlyBraceComment, ALength);
  end;
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
  Result := TLocation.Create(FFileName, FSource, FIndex);
end;

function TLexScanner.HexNumber: TLexScanner.TMatch;
var
  ALength: Integer;
begin
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
  while (FIndex < Length(FSource)) and IsWhitespace(Peek(0))  do
    Inc(FIndex);

  if FIndex >= Length(FSource) then
    Result := nil
  else
  begin
    AMatch := NextMatch;
    if AMatch = nil then
      raise ELexException.Create('Unrecognized character ''' + Peek(0) + '''',
                                 GetLocation)
    else
    begin
      AText := Copy(FSource, FIndex + 1, AMatch.Length);
      Result := TToken.Create(AMatch.TokenType, GetLocation, AText,
                              AMatch.ParsedText);
      Inc(FIndex, AMatch.Length);
      AMatch.Destroy;
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

    if (Peek(ALength) = '.') and (Peek(ALength + 1) <> '.') then
    begin
      Inc(ALength);
      while IsDigit(Peek(ALength)) do
        Inc(ALength);
    end;

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

    if Peek(ALength) = '$' then
    begin
      // TODO Trim()
      AParsedText := Copy(FSource, FIndex + 4, ALength - 5);
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
    Result := #255;
end;

function TLexScanner.Read(AOffset: Integer): Char;
begin
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
        while Peek(ALength) <> '''' do
          Inc(ALength);
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
