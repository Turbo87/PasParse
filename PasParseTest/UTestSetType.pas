unit UTestSetType;

interface

uses
  UTest;

type
  TTestSetType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestSetType }

class function TTestSetType.GetName: string;
begin
  Result := 'SetType';
end;

class procedure TTestSetType.TestAll;
begin
  OK('set of Byte', TTestParser.ParsesAs('set of Byte',
    'SetOfNode' + #13#10 +
    '  SetKeywordNode: SetKeyword |set|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |Byte|', RTSetType));
end;

end.
