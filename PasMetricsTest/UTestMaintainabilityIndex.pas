unit UTestMaintainabilityIndex;

interface

uses
  UTest, UMaintainabilityIndex;

type
  TTestMaintainabilityIndex = class(TTest)
  private
    class function TestFile(AFileName: string): TMaintainabilityIndex;

  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UFileLoader, UCompilerDefines, UParser, UASTNode, URuleType;

{ TTestMaintainabilityIndex }

class function TTestMaintainabilityIndex.GetName: string;
begin
  Result := 'MaintainabilityIndex';
end;

class procedure TTestMaintainabilityIndex.TestAll;
var
  AMaintainabilityIndex: TMaintainabilityIndex;
begin
  AMaintainabilityIndex := TestFile('data/UToken.pas.txt');
  ok(Abs((AMaintainabilityIndex.Value / 61.849262777) - 1) < 0.0001);
  AMaintainabilityIndex.Free;

  AMaintainabilityIndex := TestFile('data/UParser.pas.txt');
  ok(Abs((AMaintainabilityIndex.Value / 24.761077124) - 1) < 0.0001);
  AMaintainabilityIndex.Free;
end;

class function TTestMaintainabilityIndex.TestFile(AFileName: string): TMaintainabilityIndex;
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
        ANode := AParser.ParseRule(RTGoal);
        try
          Result := TMaintainabilityIndex.Create;
          Result.Calculate(ANode);
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

