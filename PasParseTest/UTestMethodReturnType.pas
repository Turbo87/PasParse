unit UTestMethodReturnType;

interface

uses
  UTest;

type
  TTestMethodReturnType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestMethodReturnType }

class function TTestMethodReturnType.GetName: string;
begin
  Result := 'MethodReturnType';
end;

class procedure TTestMethodReturnType.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTMethodReturnType));

  OK('Foo.TBar', TTestParser.ParsesAs('Foo.TBar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |TBar|', RTMethodReturnType));

  OK('string', TTestParser.ParsesAs('string',
    'StringKeyword |string|', RTMethodReturnType));
end;

end.
