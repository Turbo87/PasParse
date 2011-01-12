unit UTestEnumeratedTypeElement;

interface

uses
  UTest;

type
  TTestEnumeratedTypeElement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestEnumeratedTypeElement }

class function TTestEnumeratedTypeElement.GetName: string;
begin
  Result := 'EnumeratedTypeElement';
end;

class procedure TTestEnumeratedTypeElement.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo',
    'EnumeratedTypeElementNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  EqualSignNode: (none)' + #13#10 +
    '  ValueNode: (none)', RTEnumeratedTypeElement));

  OK('Foo = 42', TTestParser.ParsesAs('Foo = 42',
    'EnumeratedTypeElementNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  ValueNode: Number |42|', RTEnumeratedTypeElement));
end;

end.
