unit UTestParticle;

interface

uses
  UTest;

type
  TTestParticle = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestParticle }

class function TTestParticle.GetName: string;
begin
  Result := 'Particle';
end;

class procedure TTestParticle.TestAll;
begin
  OK('nil', TTestParser.ParsesAs('nil', 'NilKeyword |nil|', RTParticle));
  OK('''Foo''', TTestParser.ParsesAs('''Foo''',
    'StringLiteral |''Foo''|', RTParticle));
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTParticle));
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTParticle));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTParticle));

  // TODO

  OK('string', TTestParser.ParsesAs('string', 'StringKeyword |string|', RTParticle));
  OK('file', TTestParser.ParsesAs('file', 'FileKeyword |file|', RTParticle));
end;

end.
