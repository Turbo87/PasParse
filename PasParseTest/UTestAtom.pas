unit UTestAtom;

interface

uses
  UTest;

type
  TTestAtom = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestAtom }

class function TTestAtom.GetName: string;
begin
  Result := 'Atom';
end;

class procedure TTestAtom.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTAtom));
  OK('Absolute', TTestParser.ParsesAs('Absolute',
    'Identifier |Absolute|', RTAtom));

  OK('Foo.Bar', TTestParser.ParsesAs('Foo.Bar',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Foo|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Bar|', RTAtom));
  OK('Foo.Bar.Baz', TTestParser.ParsesAs('Foo.Bar.Baz',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  OperatorNode: Dot |.|' + #13#10 +
    '  RightNode: Identifier |Baz|', RTAtom));

  OK('Foo^', TTestParser.ParsesAs('Foo^',
    'PointerDereferenceNode' + #13#10 +
    '  OperandNode: Identifier |Foo|' + #13#10 +
    '  CaretNode: Caret |^|', RTAtom));
  OK('Foo^^', TTestParser.ParsesAs('Foo^^',
    'PointerDereferenceNode' + #13#10 +
    '  OperandNode: PointerDereferenceNode' + #13#10 +
    '    OperandNode: Identifier |Foo|' + #13#10 +
    '    CaretNode: Caret |^|' + #13#10 +
    '  CaretNode: Caret |^|', RTAtom));
    
  // TODO
end;

end.
