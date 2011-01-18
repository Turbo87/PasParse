unit UTestPointerType;

interface

uses
  UTest;

type
  TTestPointerType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestPointerType }

class function TTestPointerType.GetName: string;
begin
  Result := 'PointerType';
end;

class procedure TTestPointerType.TestAll;
begin
  OK('^TFoo', TTestParser.ParsesAs('^TFoo',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTPointerType));

  OK('^Foo.TBar', TTestParser.ParsesAs('^Foo.TBar',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |TBar|', RTPointerType));

  OK('^string', TTestParser.ParsesAs('^string',
    'PointerTypeNode' + #13#10 +
    '  CaretNode: Caret |^|' + #13#10 +
    '  TypeNode: StringKeyword |string|', RTPointerType));
end;

end.
