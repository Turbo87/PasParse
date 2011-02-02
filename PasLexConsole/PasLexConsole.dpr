program PasLexConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, ULexScanner, UToken, UTokenType, UFileLoader, TypInfo;

procedure LoadFile(const AFileName: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFileName);
    // Create the lexer
    ALexScanner := TLexScanner.Create(AContent, AFileName);
    try
      // Read tokens
      repeat
        AToken := ALexScanner.NextToken;
        // Last token reached?
        if AToken = nil then
          Break;

        // Write token type and token text to stdout
        WriteLn(
          GetEnumName(TypeInfo(TTokenType), Integer(AToken.TokenType)) + ': ''' +
          AToken.Text + '''');

        AToken.Destroy;
      until False;

    finally
      ALexScanner.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

begin
  try
    // No file given as parameter
    if ParamCount < 1 then
      raise Exception.Create('missing file parameter');

    // Lex given filename
    LoadFile(ParamStr(1));
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

