unit UTestAlternator;

interface

uses
  UTest;

type
  TTestAlternator = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UAlternator, UInvalidOperationException, UTokenSet;

{ TTestAlternator }

class function TTestAlternator.GetName: string;
begin
  Result := 'Alternator';
end;

class procedure TTestAlternator.TestAll;
var
  AAlternator: TAlternator;
  ATokenSet1, ATokenSet2, ATokenSet3: TTokenSet;
begin
  AAlternator := TAlternator.Create;

  try
    AAlternator.DisplayText;
    OK(False, 'DisplayTextWithNoAlternates exception');
  except
    on ETestException do;
    on EInvalidOperationException do
      OK(True, 'DisplayTextWithNoAlternates exception');
  else
    OK(False, 'DisplayTextWithNoAlternates exception');
  end;

  ATokenSet1 := TTokenSet.Create('foo');
  AAlternator.AddToken(ATokenSet1);
  OK('foo', AAlternator.DisplayText = 'foo');

  ATokenSet2 := TTokenSet.Create('bar');
  AAlternator.AddToken(ATokenSet2);
  OK('foo or bar', AAlternator.DisplayText = 'foo or bar');

  ATokenSet3 := TTokenSet.Create('baz');
  AAlternator.AddToken(ATokenSet3);
  OK('foo, bar or baz', AAlternator.DisplayText = 'foo, bar or baz');

  ATokenSet1.Free;
  ATokenSet2.Free;
  ATokenSet3.Free;

  AAlternator.Free;
end;

end.

