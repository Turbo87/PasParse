unit UTestVisitor;

interface

uses
  UTest, UVisitor, UGeneratedNodes;

type
  TSimpleVisitor = class(TVisitor)
  private
    FCounter: Integer;
  public
    constructor Create;
    procedure Visit(ANode: TBlockNode); override;
    property Count: Integer read FCounter;
  end;

  TTestVisitor = class(TTest)
  public
    class function TestVisitor: Boolean; 

    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UFileLoader, UCompilerDefines, UParser, UASTNode, URuleType, SysUtils;

{ TTestBlock }

class function TTestVisitor.GetName: string;
begin
  Result := 'Visitor';
end;

class procedure TTestVisitor.TestAll;
begin
  inherited;
  try
    OK(TestVisitor, 'TestVisitor');
  except
    on ETestException do
    else
      OK(False, 'TestVisitor');
  end;
end;

class function TTestVisitor.TestVisitor: Boolean;
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
  AVisitor: TSimpleVisitor;
begin
  // Create MemoryFileLoader to load a testfile
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load('data/UToken.pas.txt');
    // Create empty compiler defines
    ACompilerDefines := TCompilerDefines.Create;
    try
      // Create the parser
      AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, AFileLoader);
      try
        // Try to parse a unit from the file content
        ANode := AParser.ParseRule(RTUnit);
        try
          AVisitor := TSimpleVisitor.Create;
          try
            ANode.Accept(AVisitor);
            Result := (AVisitor.Count = 7);
          finally
            AVisitor.Free;
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

{ TSimpleVisitor }

constructor TSimpleVisitor.Create;
begin
  FCounter := 0;
end;

procedure TSimpleVisitor.Visit(ANode: TBlockNode);
begin
  inherited;
  Inc(FCounter);
end;

end.
