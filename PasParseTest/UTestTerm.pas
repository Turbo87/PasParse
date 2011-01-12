unit UTestTerm;

interface

uses
  UTest;

type
  TTestTerm = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestTerm }

class function TTestTerm.GetName: string;
begin
  Result := 'Term';
end;

class procedure TTestTerm.TestAll;
begin
  OK('42', TTestParser.ParsesAs('42', 'Number |42|', RTTerm));

  OK('not 42', TTestParser.ParsesAs('not 42',
    'UnaryOperationNode' + #13#10 +
    '  OperatorNode: NotKeyword |not|' + #13#10 +
    '  OperandNode: Number |42|', RTTerm));

  OK('6 * 9', TTestParser.ParsesAs('6 * 9',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |6|' + #13#10 +
    '  OperatorNode: TimesSign |*|' + #13#10 +
    '  RightNode: Number |9|', RTTerm));

  OK('6 * 3 * 3', TTestParser.ParsesAs('6 * 3 * 3',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Number |6|' + #13#10 +
    '    OperatorNode: TimesSign |*|' + #13#10 +
    '    RightNode: Number |3|' + #13#10 +
    '  OperatorNode: TimesSign |*|' + #13#10 +
    '  RightNode: Number |3|', RTTerm));

  OK('84 / 2', TTestParser.ParsesAs('84 / 2',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Number |84|' + #13#10 +
    '  OperatorNode: DivideBySign |/|' + #13#10 +
    '  RightNode: Number |2|', RTTerm));

  OK('Absolute * Index', TTestParser.ParsesAs('Absolute * Index',
    'BinaryOperationNode' + #13#10 +
    '  LeftNode: Identifier |Absolute|' + #13#10 +
    '  OperatorNode: TimesSign |*|' + #13#10 +
    '  RightNode: Identifier |Index|', RTTerm));
end;

end.
