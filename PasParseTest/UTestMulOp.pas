unit UTestMulOp;

interface

uses
  UTest;

type
  TTestMulOp = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestMulOp }

class function TTestMulOp.GetName: string;
begin
  Result := 'MulOp';
end;

class procedure TTestMulOp.TestAll;
begin
  OK('*', TTestParser.ParsesAs('*', 'TimesSign |*|', RTMulOp));
  OK('/', TTestParser.ParsesAs('/', 'DivideBySign |/|', RTMulOp));
  OK('div', TTestParser.ParsesAs('div', 'DivKeyword |div|', RTMulOp));
  OK('mod', TTestParser.ParsesAs('mod', 'ModKeyword |mod|', RTMulOp));
  OK('and', TTestParser.ParsesAs('and', 'AndKeyword |and|', RTMulOp));
  OK('shl', TTestParser.ParsesAs('shl', 'ShlKeyword |shl|', RTMulOp));
  OK('shr', TTestParser.ParsesAs('shr', 'ShrKeyword |shr|', RTMulOp));
end;

end.
