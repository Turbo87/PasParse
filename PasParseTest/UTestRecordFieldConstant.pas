unit UTestRecordFieldConstant;

interface

uses
  UTest;

type
  TTestRecordFieldConstant = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestRecordFieldConstant }

class function TTestRecordFieldConstant.GetName: string;
begin
  Result := 'RecordFieldConstant';
end;

class procedure TTestRecordFieldConstant.TestAll;
begin
  OK('Foo: 42', TTestParser.ParsesAs('Foo: 42',
    'RecordFieldConstantNode' + #13#10 +
    '  NameNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ValueNode: Number |42|', RTRecordFieldConstant));
  
  OK('Foo.Bar: 42', TTestParser.ParsesAs('Foo.Bar: 42',
    'RecordFieldConstantNode' + #13#10 +
    '  NameNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |Bar|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ValueNode: Number |42|', RTRecordFieldConstant));
end;

end.
