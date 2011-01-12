unit UTestExportsSpecifier;

interface

uses
  UTest;

type
  TTestExportsSpecifier = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestExportsSpecifier }

class function TTestExportsSpecifier.GetName: string;
begin
  Result := 'ExportsSpecifier';
end;

class procedure TTestExportsSpecifier.TestAll;
begin
  OK('index 42', TTestParser.ParsesAs('index 42',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '  ValueNode: Number |42|', RTExportsSpecifier));

  OK('name ''Foo''', TTestParser.ParsesAs('name ''Foo''',
    'ExportsSpecifierNode' + #13#10 +
    '  KeywordNode: NameSemikeyword |name|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo''|', RTExportsSpecifier));
end;

end.
