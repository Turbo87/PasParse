unit UTestPortabilityDirective;

interface

uses
  UTest;

type
  TTestPortabilityDirective = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestPortabilityDirective }

class function TTestPortabilityDirective.GetName: string;
begin
  Result := 'PortabilityDirective';
end;

class procedure TTestPortabilityDirective.TestAll;
begin
  OK('platform', TTestParser.ParsesAs('platform',
    'PlatformSemikeyword |platform|', RTPortabilityDirective));
  OK('deprecated', TTestParser.ParsesAs('deprecated',
    'DeprecatedSemikeyword |deprecated|', RTPortabilityDirective));
  OK('library', TTestParser.ParsesAs('library',
    'LibraryKeyword |library|', RTPortabilityDirective));
  OK('experimental', TTestParser.ParsesAs('experimental',
    'ExperimentalSemikeyword |experimental|', RTPortabilityDirective));
end;

end.
