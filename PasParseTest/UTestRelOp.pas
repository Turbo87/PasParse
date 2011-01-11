unit UTestRelOp;

interface

uses
  UTest;

type
  TTestRelOp = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestRelOp }

class function TTestRelOp.GetName: string;
begin
  Result := 'RelOp';
end;

class procedure TTestRelOp.TestAll;
begin
  OK('=', TTestParser.ParsesAs('=', 'EqualSign |=|', RTRelOp));
  OK('>', TTestParser.ParsesAs('>', 'GreaterThan |>|', RTRelOp));
  OK('<', TTestParser.ParsesAs('<', 'LessThan |<|', RTRelOp));
  OK('<=', TTestParser.ParsesAs('<=', 'LessOrEqual |<=|', RTRelOp));
  OK('>=', TTestParser.ParsesAs('>=', 'GreaterOrEqual |>=|', RTRelOp));
  OK('<>', TTestParser.ParsesAs('<>', 'NotEqual |<>|', RTRelOp));
  OK('in', TTestParser.ParsesAs('in', 'InKeyword |in|', RTRelOp));
  OK('is', TTestParser.ParsesAs('is', 'IsKeyword |is|', RTRelOp));
  OK('as', TTestParser.ParsesAs('as', 'AsKeyword |as|', RTRelOp));
end;

end.
