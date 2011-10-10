unit UTestConstraint;

interface

uses
  UTest;

type
  TTestConstraint = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestFactor }

class function TTestConstraint.GetName: string;
begin
  Result := 'Constraint';
end;

class procedure TTestConstraint.TestAll;
begin
  OK('constructor', TTestParser.ParsesAs('constructor',
    'ConstructorKeyword |constructor|', RTConstraint));
  OK('record', TTestParser.ParsesAs('record',
    'RecordKeyword |record|', RTConstraint));
  OK('class', TTestParser.ParsesAs('class',
    'ClassKeyword |class|', RTConstraint));

  OK('TSomething', TTestParser.ParsesAs('TSomething',
    'Identifier |TSomething|', RTConstraint));

  try
    TTestParser.ParsesAs('not', 'NotKeyword |not|', RTConstraint);
    OK(False, 'not exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'not exception');
  else
    OK(False, 'not exception');
  end;
end;

end.
