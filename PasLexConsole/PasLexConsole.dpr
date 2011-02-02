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
  AFileLoader := TFileLoader.Create;
  try
    AContent := AFileLoader.Load(AFileName);
    ALexScanner := TLexScanner.Create(AContent, AFileName);
    try
      repeat
        AToken := ALexScanner.NextToken;
        if AToken = nil then
          Break;

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
    if ParamCount < 1 then
      raise Exception.Create('missing file parameter');

    LoadFile(ParamStr(1));
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

