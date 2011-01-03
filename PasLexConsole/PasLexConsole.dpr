program PasLexConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, ULexScanner, UToken, UTokenType, TypInfo;

procedure LoadFile(const AFileName : string);
var
  AFileHandle: TextFile;
  ALine: string;
  AContent: string;
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  AssignFile(AFileHandle, AFileName);
  Reset(AFileHandle);
  while not Eof(AFileHandle) do
  begin
    ReadLn(AFileHandle, ALine);
    AContent := AContent + ALine + #13#10;
  end;
  CloseFile(AFileHandle);

  ALexScanner := TLexScanner.Create(AContent, AFileName);
  repeat
    AToken := ALexScanner.NextToken;
    if AToken = nil then
      Break;

    WriteLn(
      GetEnumName(TypeInfo(TTokenType), Integer(AToken.TokenType)) + ': ''' +
      AToken.Text + '''');

    AToken.Destroy;
  until False;
end;

begin
  try
    if ParamCount < 1 then
      Writeln('Missing parameter!')
    else
    begin
      WriteLn('Loading file: ''' + ParamStr(1) + '''');
      LoadFile(ParamStr(1));
    end;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
