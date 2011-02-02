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
  try
    AContent := AFileLoader.Load(AFileName);
    ACompilerDefines := TCompilerDefines.Create;
    try
      AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, AFileLoader);
      try
        ANode := AParser.ParseRule(RTUnit);
        try
          Write(ANode.Inspect);
        finally
          ANode.Free;
        end;
      finally
        AParser.Free;
      end;
    finally
      ACompilerDefines.Free;
    end;
  finally
    AFileLoader.Free;
  end;
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

