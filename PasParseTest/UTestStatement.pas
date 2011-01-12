unit UTestStatement;

interface

uses
  UTest;

type
  TTestStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestStatement }

class function TTestStatement.GetName: string;
begin
  Result := 'Statement';
end;

class procedure TTestStatement.TestAll;
begin
  OK('Foo', TTestParser.ParsesAs('Foo', 'Identifier |Foo|', RTStatement));

  OK('Foo:', TTestParser.ParsesAs('Foo:',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: (none)', RTStatement));

  OK('Foo: Bar', TTestParser.ParsesAs('Foo: Bar',
    'LabeledStatementNode' + #13#10 +
    '  LabelIdNode: Identifier |Foo|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  StatementNode: Identifier |Bar|', RTStatement));
end;

end.
