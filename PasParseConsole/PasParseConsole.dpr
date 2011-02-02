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
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFileName);
    // Create empty compiler defines
    ACompilerDefines := TCompilerDefines.Create;
    try
      // Create the parser
      AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, AFileLoader);
      try
        // Try to parse a unit from the file content
        ANode := AParser.ParseRule(RTUnit);
        try
          // Write the tree to stdout
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
    // No file given as parameter
    if ParamCount < 1 then
      raise Exception.Create('missing file parameter');

    // Parse given filename
    ParseFile(ParamStr(1));
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

