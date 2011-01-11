unit UTestParser;

interface

uses
  URuleType;

type
  TTestParser = class
  public
    class function ParsesAs(ASource, AGoal: string; ARuleType: TRuleType): Boolean;
  end;

implementation

uses
  UCompilerDefines, UASTNode, UParser, UInvalidOperationException;

{ TTestParser }

class function TTestParser.ParsesAs(ASource, AGoal: string;
  ARuleType: TRuleType): Boolean;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
  AActualString: string;
begin
  Result := False;
  ACompilerDefines := TCompilerDefines.Create;
  AParser := TParser.CreateFromText(ASource, '', ACompilerDefines, nil);
  try
    ANode := AParser.ParseRule(ARuleType);
    AActualString := ANode.Inspect;
    ANode.Free;

    try
      if not AParser.IsEOF then
        raise EInvalidOperationException.Create('Rule did not consume all input');

    finally
      Result := (AActualString = AGoal) and (not AParser.IsEOF);
    end;
  finally
    AParser.Free;
    ACompilerDefines.Free;
  end;
end;

end.
