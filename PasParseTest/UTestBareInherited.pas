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
  UTestParser, URuleType;

{ TTestBareInherited }

class function TTestBareInherited.GetName: string;
begin
  Result := 'BareInherited';
end;

class procedure TTestBareInherited.TestAll;
begin
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTBareInherited));
end;

end.
