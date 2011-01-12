unit UTestOpenArray;

interface

uses
  UTest;

type
  TTestOpenArray = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestOpenArray }

class function TTestOpenArray.GetName: string;
begin
  Result := 'OpenArray';
end;

class procedure TTestOpenArray.TestAll;
begin
  OK('array of TFoo', TTestParser.ParsesAs('array of TFoo',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TFoo|', RTOpenArray));

  OK('array of Foo.TBar', TTestParser.ParsesAs('array of Foo.TBar',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: BinaryOperationNode' + #13#10 +
    '    LeftNode: Identifier |Foo|' + #13#10 +
    '    OperatorNode: Dot |.|' + #13#10 +
    '    RightNode: Identifier |TBar|', RTOpenArray));

  OK('array of string', TTestParser.ParsesAs('array of string',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: StringKeyword |string|', RTOpenArray));

  OK('array of file', TTestParser.ParsesAs('array of file',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: FileKeyword |file|', RTOpenArray));

  OK('array of const', TTestParser.ParsesAs('array of const',
    'OpenArrayNode' + #13#10 +
    '  ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: ConstKeyword |const|', RTOpenArray));
end;

end.
