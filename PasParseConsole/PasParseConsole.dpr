program PasParseConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, UParser, UCompilerDefines, UASTNode, URuleType;

procedure ParseFile(const AFileName : string);
var
  AFileHandle: TextFile;
  ALine: string;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  Writeln('Parsing file: ' + ParamStr(1));

  AssignFile(AFileHandle, AFileName);
  Reset(AFileHandle);
  while not Eof(AFileHandle) do
  begin
    ReadLn(AFileHandle, ALine);
    AContent := AContent + ALine + #13#10;
  end;
  CloseFile(AFileHandle);

  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, nil);
  ANode := AParser.ParseRule(RTUnit);
  Write(ANode.Inspect);
end;

begin
  try
    if ParamCount < 1 then
      raise Exception.Create('missing file parameter');

    ParseFile(ParamStr(1));
    Readln;
  except
    on E:Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.
