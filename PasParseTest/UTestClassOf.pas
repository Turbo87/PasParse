unit UTestClassOf;

interface

uses
  UTest;

type
  TTestClassOf = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestClassOf }

class function TTestClassOf.GetName: string;
begin
  Result := 'ClassOf';
end;

class procedure TTestClassOf.TestAll;
begin
  OK('class of TObject', TTestParser.ParsesAs('class of TObject',
    'ClassOfNode' + #13#10 +
    '  ClassKeywordNode: ClassKeyword |class|' + #13#10 +
    '  OfKeywordNode: OfKeyword |of|' + #13#10 +
    '  TypeNode: Identifier |TObject|', RTClassOfType));
end;

end.
