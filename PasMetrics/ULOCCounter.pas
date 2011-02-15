unit ULOCCounter;

interface

uses
  UVisitor, UASTNode;

type
  TLOCCounter = class(TVisitor)
  private
    FString: string;
    FPosition, FLength: Integer;

  protected
    FPhysical, FProgram, FComments, FBlank: Integer;

    function ReadLine: string;
    function IsEOF: Boolean;

  public
    constructor Create;

    procedure Reset;
    procedure Visit(ANode: TASTNode); override;
    procedure Count(AString: string);

    property LOCPhysical: Integer read FPhysical;
    property LOCProgram: Integer read FProgram;
    property LOCComments: Integer read FComments;
    property LOCBlank: Integer read FBlank;
  end;

implementation

uses
  SysUtils;

{ TLOCCounter }

procedure TLOCCounter.Count(AString: string);
var
  ALine: string;
  AInSingleLineComment, AInParenStarComment, AInCurlyBracesComment: Boolean;
  AIsProgramLine, AIsCommentLine: Boolean;
  APosition, ALength: Integer;
begin
  FString := AString;
  FLength := Length(FString);
  FPosition := 1;

  AInParenStarComment := False;
  AInCurlyBracesComment := False;

  while not IsEOF do
  begin
    AIsProgramLine := False;
    AIsCommentLine := AInParenStarComment or AInCurlyBracesComment;
    AInSingleLineComment := False;

    ALine := ReadLine;
    Inc(FPhysical);

    // If we are not inside a multi-line comment
    // then a blank line is counted as a blank line
    if (not AIsCommentLine) and (Trim(ALine) = '') then
    begin
      Inc(FBlank);
      continue;
    end;

    ALength := Length(ALine);
    for APosition := 1 to ALength do
    begin
      // Look for starting comment with {
      if (not AInParenStarComment) and
         (ALine[APosition] = '{') then
      begin
        AIsCommentLine := True;
        AInCurlyBracesComment := True;
      end;

      // Look for starting comment with (*
      if (not AInCurlyBracesComment) and
         (APosition < ALength) and
         (ALine[APosition] = '(') and
         (ALine[APosition + 1] = '*') then
      begin
        AIsCommentLine := True;
        AInParenStarComment := True;
      end;

      // Look for starting comment with //
      if (APosition < ALength) and
         (ALine[APosition] = '/') and
         (ALine[APosition + 1] = '/') then
      begin
        AIsCommentLine := True;
        AInSingleLineComment := True;
      end;

      // No comment started yet means program line here if not blank
      if (not AInParenStarComment) and
         (not AInCurlyBracesComment) and
         (not AInSingleLineComment) and
         (Trim(ALine[APosition]) <> '') then
        AIsProgramLine := True;

      // Look for closing comment with }
      if (AInCurlyBracesComment) and
         (ALine[APosition] = '}') then
        AInCurlyBracesComment := False;

      // Look for closing comment with *)
      if (AInParenStarComment) and
         (APosition > 1) and
         (ALine[APosition - 1] = '*') and
         (ALine[APosition] = ')') then
        AInParenStarComment := False;
    end;

    // Increase program line counter
    if AIsProgramLine then
      Inc(FProgram);
    // Increase comment line counter
    if AIsCommentLine then
      Inc(FComments);
  end;
end;

constructor TLOCCounter.Create;
begin
  Reset;
end;

function TLOCCounter.IsEOF: Boolean;
begin
  Result := (FPosition >= FLength);
end;

function TLOCCounter.ReadLine: string;
var
  AStartPosition, ALength: Integer;
begin
  // Save position of first character in the line
  AStartPosition := FPosition;
  // Reset line length
  ALength := 0;
  // Iterate through all remaining characters
  while FPosition <= FLength do
  begin
    // Find line-breaks with single #10 (unix)
    if FString[FPosition] = #10 then
    begin
      Inc(FPosition);
      break;
    end;

    // Find line-breaks with #13#10 (windows)
    if (FPosition < FLength) and
       (FString[FPosition] = #13) and
       (FString[FPosition + 1] = #10) then
    begin
      Inc(FPosition);
      Inc(FPosition);
      break;
    end;

    Inc(ALength);
    Inc(FPosition);
  end;
  // Return line without line-breaks
  Result := Copy(FString, AStartPosition, ALength);
end;

procedure TLOCCounter.Reset;
begin
  // Reset counters
  FPhysical := 0;
  FProgram := 0;
  FComments := 0;
  FBlank := 0;

  // Reset string
  FString := '';
  FPosition := 0;
  FLength := 0;
end;

procedure TLOCCounter.Visit(ANode: TASTNode);
begin
  Count(ANode.ToCode);
end;

end.
