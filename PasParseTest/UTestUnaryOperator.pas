unit UTestUnaryOperator;

interface

uses
  UTest;

type
  TTestUnaryOperator = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestUnaryOperator }

class function TTestUnaryOperator.GetName: string;
begin
  Result := 'UnaryOperator';
end;

class procedure TTestUnaryOperator.TestAll;
begin
  OK('not', TTestParser.ParsesAs('not', 'NotKeyword |not|', RTUnaryOperator));
  OK('+', TTestParser.ParsesAs('+', 'PlusSign |+|', RTUnaryOperator));
  OK('-', TTestParser.ParsesAs('-', 'MinusSign |-|', RTUnaryOperator));
  OK('@', TTestParser.ParsesAs('@', 'AtSign |@|', RTUnaryOperator));
  OK('inherited', TTestParser.ParsesAs('inherited',
    'InheritedKeyword |inherited|', RTUnaryOperator));

  try
    TTestParser.ParsesAs('and', 'AndKeyword |and|', RTUnaryOperator);
    OK(False, 'and exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'and exception');
  else
    OK(False, 'and exception');
  end;
end;

end.
