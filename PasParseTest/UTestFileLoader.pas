unit UTestFileLoader;

interface

uses
  UTest;

type
  TTestFileLoader = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UFileLoader, SysUtils;

{ TTestFileLoader }

class function TTestFileLoader.GetName: string;
begin
  Result := 'FileLoader';
end;

class procedure TTestFileLoader.TestAll;
var
  ALoader: TFileLoader;
begin
  ALoader := TFileLoader.Create;

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

  OK(ALoader.Load('data/FileLoaderTestWin.txt') =
    'foo' + #13#10 + 'bar' + #13#10 + 'baz', 'Load() with \r\n');

  OK(ALoader.Load('data/FileLoaderTestBOM.txt') =
    'foo' + #13#10 + 'bar' + #13#10 + 'baz', 'Load() with Byte Order Mark');

  OK(ALoader.Load('data/FileLoaderTestUnix.txt') =
    'foo' + #10 + 'bar' + #10 + 'baz', 'Load() with \n');

  OK(not ALoader.Exists('data/FileLoaderTestUnix.txt.xxx'), 'not Exists()');
  OK(ALoader.Exists('data/FileLoaderTestUnix.txt'), 'Exists()');

  OK(ALoader.LoadFromParentDirs('data\foo\bar\FileLoaderTestUnix.txt') <> '',
    'LoadFromParentDirs()');

  ALoader.Free;
end;

end.
