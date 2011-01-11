unit UTestAddOp;

interface

uses
  UTest;

type
  TTestAddOp = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestAddOp }

class function TTestAddOp.GetName: string;
begin
  Result := 'AddOp';
end;

class procedure TTestAddOp.TestAll;
begin
  OK('+', TTestParser.ParsesAs('+', 'PlusSign |+|', RTAddOp));
  OK('-', TTestParser.ParsesAs('-', 'MinusSign |-|', RTAddOp));
  OK('or', TTestParser.ParsesAs('or', 'OrKeyword |or|', RTAddOp));
  OK('xor', TTestParser.ParsesAs('xor', 'XorKeyword |xor|', RTAddOp));
end;

end.
