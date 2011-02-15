unit UTestHalstead;

interface

uses
  UTest, UHalstead;

type
  TTestHalstead = class(TTest)
  private
    class function TestFile(AFileName: string): THalstead;

  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UFileLoader, UCompilerDefines, UParser, UASTNode, URuleType;

{ TTestHalstead }

class function TTestHalstead.GetName: string;
begin
  Result := 'Halstead';
end;

class procedure TTestHalstead.TestAll;
var
  AHalstead: THalstead;
begin
  AHalstead := TestFile('data/UToken.pas.txt');
  ok(AHalstead.Operators = 12);
  ok(AHalstead.TotalOperators = 50);
  ok(AHalstead.Operands = 23);
  ok(AHalstead.TotalOperands = 314);
  AHalstead.Free;
end;

class function TTestHalstead.TestFile(AFileName: string): THalstead;
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  Result := nil;

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
          Result := THalstead.Create;
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

