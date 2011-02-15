unit UTestLOCCounter;

interface

uses
  UTest;

type
  TTestLOCCounter = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  ULOCCounter, UFileLoader;

{ TTestLOCCounter }

class function TTestLOCCounter.GetName: string;
begin
  Result := 'LOCCounter';
end;

class procedure TTestLOCCounter.TestAll;
var
  AFileLoader: TFileLoader;
  AContent: string;
  ALOCCounter: TLOCCounter;
begin
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load('data/UToken.pas.txt');
    ALOCCounter := TLOCCounter.Create;
    ALOCCounter.Count(AContent);
    try
      OK(ALOCCounter.LOCPhysical = 103);
      OK(ALOCCounter.LOCProgram = 73);
      OK(ALOCCounter.LOCComments = 9);
      OK(ALOCCounter.LOCBlank = 21);
    finally
      ALOCCounter.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

end.

