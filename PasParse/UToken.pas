unit UToken;

interface

uses
  UTokenType, ULocation, UASTNode, Generics.Collections;

type
  /// Represents a token including it's text, positions and token type
  TToken = class(TASTNode)
  private
    FLocation: TLocation;
    FEndLocation: TLocation;
    FParsedText: string;
    FText: string;
    FTokenType: TTokenType;
    FLineBreaksBefore: Integer;
    FCommentsBefore: TObjectList<TASTNode>;
    FLineBreaksAfter: Integer;
    FCommentsAfter: TObjectList<TASTNode>;

  protected
    function GetLocation: TLocation; override;
    function GetEndLocation: TLocation; override;

  public
    /// Standard constructor
    constructor Create(ATokenType: TTokenType; ALocation: TLocation;
                       AText, AParsedText: string);
    destructor Destroy; override;

    function InspectTo(AIndentCount: Integer): string; override;

    /// Parsed text if available, otherwise empty string ''
    property ParsedText: string read FParsedText;
    /// Textual representation of the token
    property Text: string read FText;
    /// Type of the token
    property TokenType: TTokenType read FTokenType;

    property LineBreaksBefore: Integer read FLineBreaksBefore write FLineBreaksBefore;
    property CommentsBefore: TObjectList<TASTNode> read FCommentsBefore write FCommentsBefore;
    property LineBreaksAfter: Integer read FLineBreaksAfter write FLineBreaksAfter;
    property CommentsAfter: TObjectList<TASTNode> read FCommentsAfter write FCommentsAfter;

    /// Creates a copy of the token with another token type.
    ///  The caller has to destroy the resulting object again!
    function WithTokenType(ATokenType: TTokenType): TToken;

    function IsComment: Boolean;

    function Clone: TASTNode; override;
  end;

implementation

uses
  TypInfo;

{ TToken }

function TToken.Clone: TASTNode;
begin
  Result := WithTokenType(TokenType);
end;

constructor TToken.Create(ATokenType: TTokenType; ALocation: TLocation; AText,
  AParsedText: string);
begin
  inherited Create;
  FTokenType := ATokenType;
  FLocation := ALocation;
  FText := AText;
  FParsedText := AParsedText;
  FLineBreaksBefore := 0;
  FCommentsBefore := TObjectList<TASTNode>.Create;
  FLineBreaksAfter := 0;
  FCommentsAfter := TObjectList<TASTNode>.Create;

  // Create a new TLocation instance at the end position of the token
  FEndLocation := TLocation.Create(FLocation.FileName, FLocation.FileSource,
    FLocation.Offset + Length(FText));
end;

destructor TToken.Destroy;
begin
  FLocation.Free;
  FEndLocation.Free;
  FCommentsBefore.Free;
  FCommentsAfter.Free;
  inherited;
end;

function TToken.GetEndLocation: TLocation;
begin
  Result := FEndLocation;
end;

function TToken.GetLocation: TLocation;
begin
  Result := FLocation;
end;

function TToken.InspectTo(AIndentCount: Integer): string;
var
  AType: string;
begin
  AType := GetEnumName(TypeInfo(TTokenType), Integer(TokenType));
  Result := Copy(AType, 3, Length(AType) - 2) +
    ' |' + Text + '|';
  if (ParsedText <> '') then
    Result := Result + ', parsed=|' + ParsedText + '|';
end;

function TToken.IsComment: Boolean;
begin
  Result := (TokenType = TTSingleLineComment) or (TokenType = TTCurlyBraceComment) or (TokenType = TTParenStarComment);
end;

function TToken.WithTokenType(ATokenType: TTokenType): TToken;
var
  I: Integer;
begin
  Result := TToken.Create(ATokenType, Location.Clone, Text, ParsedText);
  Result.LineBreaksBefore := FLineBreaksBefore;
  Result.LineBreaksAfter := FLineBreaksAfter;

  for I := 0 to FCommentsBefore.Count - 1 do
    Result.CommentsBefore.Add(FCommentsBefore[I].Clone);

  for I := 0 to FCommentsAfter.Count - 1 do
    Result.CommentsAfter.Add(FCommentsAfter[I].Clone);
end;

end.
