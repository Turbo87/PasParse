unit UTestBareInherited;

interface

uses
  UTest;

type
  TTestBareInherited = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestBareInherited }

class function TTestBareInherited.GetName: string;
begin
  Result := 'BareInherited';
end;

class procedure TTestBareInherited.TestAll;
begin
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTBareInherited));

  try
    TTestParser.ParsesAs('inherited Foo',
      'InheritedKeyword |inherited|', RTBareInherited);
    OK(False, 'inherited Foo exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'inherited Foo exception');
  else
    OK(False, 'inherited Foo exception');
  end;
end;

end.
