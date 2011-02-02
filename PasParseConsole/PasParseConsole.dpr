program PasParseConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, UParser, UCompilerDefines, UFileLoader, UASTNode, URuleType;

procedure ParseFile(const AFileName: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  AFileLoader := TFileLoader.Create;
  AContent := AFileLoader.Load(AFileName);
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, AFileLoader);
  ANode := AParser.ParseRule(RTUnit);
  Write(ANode.Inspect);

  ANode.Free;
  AParser.Free;
  AFileLoader.Free;
  ACompilerDefines.Free;
end;

begin
  try
    if ParamCount < 1 then
      raise Exception.Create('missing file parameter');

    ParseFile(ParamStr(1));
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

