unit UTestMemoryFileLoader;

interface

uses
  UTest;

type
  TTestMemoryFileLoader = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UMemoryFileLoader, SysUtils;

{ TTestMemoryFileLoader }

class function TTestMemoryFileLoader.GetName: string;
begin
  Result := 'MemoryFileLoader';
end;

class procedure TTestMemoryFileLoader.TestAll;
var
  ALoader: TMemoryFileLoader;
begin
  ALoader := TMemoryFileLoader.Create;

  try
    ALoader.Load('Foo.pas');
    OK(False, 'Load exception');
  except
    on ETestException do;
    on EInOutError do
      OK(True, 'Load exception');
  else
    OK(False, 'Load exception');
  end;

  OK(not ALoader.Exists('Foo.pas'), 'not Exists()');

  ALoader['Foo.pas'] := 'Bar';
  OK(ALoader.Load('Foo.pas') = 'Bar', 'Load()');
  OK(ALoader['Foo.pas'] = 'Bar', '[]');

  OK(ALoader.Exists('Foo.pas'), 'Exists()');

  ALoader['FOO.PAS'] := 'Baz';
  OK(ALoader['Foo.pas'] = 'Baz', 'CaseInvariant');

  ALoader.Free;
end;

end.
