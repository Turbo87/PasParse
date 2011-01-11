unit UTestLabelId;

interface

uses
  UTest;

type
  TTestLabelId = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestLabelId }

class function TTestLabelId.GetName: string;
begin
  Result := 'LabelId';
end;

class procedure TTestLabelId.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTLabelId));
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTLabelId));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTLabelId));
end;

end.
