unit UTestMcCabe;

interface

uses
  UTest;

type
  TTestMcCabe = class(TTest)
  private
    class function TestFile(AFileName: string; AExpected: Integer): Boolean;

  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UMcCabe, UFileLoader, UCompilerDefines, UParser, UASTNode, URuleType;

{ TTestMcCabe }

class function TTestMcCabe.GetName: string;
begin
  Result := 'McCabe';
end;

class procedure TTestMcCabe.TestAll;
begin
  ok(TestFile('data/UToken.pas.txt', 8));
  ok(TestFile('data/UParser.pas.txt', 43));
end;

class function TTestMcCabe.TestFile(AFileName: string;
  AExpected: Integer): Boolean;
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
  AMcCabe: TMcCabe;
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
        ANode := AParser.ParseRule(RTGoal);
        try
          AMcCabe := TMcCabe.Create;
          try
            AMcCabe.Calculate(ANode);
            Result := (AMcCabe.Count = AExpected);
          finally
            AMcCabe.Free;
          end;
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

end.

