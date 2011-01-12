unit UTestRaiseStatement;

interface

uses
  UTest;

type
  TTestRaiseStatement = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestRaiseStatement }

class function TTestRaiseStatement.GetName: string;
begin
  Result := 'RaiseStatement';
end;

class procedure TTestRaiseStatement.TestAll;
begin
  OK('raise', TTestParser.ParsesAs('raise',
    'RaiseStatementNode' + #13#10 +
    '  RaiseKeywordNode: RaiseKeyword |raise|' + #13#10 +
    '  ExceptionNode: (none)' + #13#10 +
    '  AtSemikeywordNode: (none)' + #13#10 +
    '  AddressNode: (none)', RTRaiseStatement));

  OK('raise E', TTestParser.ParsesAs('raise E',
    'RaiseStatementNode' + #13#10 +
    '  RaiseKeywordNode: RaiseKeyword |raise|' + #13#10 +
    '  ExceptionNode: Identifier |E|' + #13#10 +
    '  AtSemikeywordNode: (none)' + #13#10 +
    '  AddressNode: (none)', RTRaiseStatement));
  // TODO
  {
  OK('raise Exception.Create(''Foo'')',
    TTestParser.ParsesAs('raise Exception.Create(''Foo'')',
    'RaiseStatementNode' + #13#10 +
    '  RaiseKeywordNode: RaiseKeyword |raise|' + #13#10 +
    '  ExceptionNode: ParametrizedNode' + #13#10 +
    '    LeftNode: BinaryOperationNode' + #13#10 +
    '      LeftNode: Identifier |Exception|' + #13#10 +
    '      OperatorNode: Dot |.|' + #13#10 +
    '      RightNode: Identifier |Create|' + #13#10 +
    '    OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '    ParameterListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: StringLiteral |''Foo''|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseDelimiterNode: CloseParenthesis |)|' + #13#10 +
    '  AtSemikeywordNode: (none)' + #13#10 +
    '  AddressNode: (none)', RTRaiseStatement));
  }
  OK('raise E at Address', TTestParser.ParsesAs('raise E at Address',
    'RaiseStatementNode' + #13#10 +
    '  RaiseKeywordNode: RaiseKeyword |raise|' + #13#10 +
    '  ExceptionNode: Identifier |E|' + #13#10 +
    '  AtSemikeywordNode: AtSemikeyword |at|' + #13#10 +
    '  AddressNode: Identifier |Address|', RTRaiseStatement));
end;

end.
