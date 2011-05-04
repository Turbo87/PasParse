program PasLexConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, ULexScanner, UToken, UTokenType, UFileLoader, TypInfo, Contnrs;

procedure LoadFile(const AFileName: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  ALexScanner: TLexScanner;
  ATokens: TObjectList;
  AToken: TToken;
  I: Integer;
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
      ATokens := ALexScanner.Tokens;
      try
        for I := 0 to ATokens.Count - 1 do
        begin
          AToken := (ATokens[I] as TToken);
          // Last token reached?
          if AToken = nil then
            Break;

          // Write token type and token text to stdout
          AContent := GetEnumName(TypeInfo(TTokenType), Integer(AToken.TokenType)) + ': ''' + AToken.Text + '''';
          if (AToken.LineBreaksBefore > 0) or (AToken.LineBreaksAfter > 0) then
            AContent := AContent + ' (Before: ' + IntToStr(AToken.LineBreaksBefore) + ' - After: ' + IntToStr(AToken.LineBreaksAfter) + ')';
          WriteLn(AContent);
        end;
      finally
        ATokens.Free;
      end;
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

