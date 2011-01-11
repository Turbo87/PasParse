unit UTestVisibility;

interface

uses
  UTest;

type
  TTestVisibility = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestVisibility }

class function TTestVisibility.GetName: string;
begin
  Result := 'Visibility';
end;

class procedure TTestVisibility.TestAll;
begin
  OK('private', TTestParser.ParsesAs('private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));

  OK('public', TTestParser.ParsesAs('public',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublicSemikeyword |public|', RTVisibility));

  OK('published', TTestParser.ParsesAs('published',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: (none)' + #13#10 +
    '  VisibilityKeywordNode: PublishedSemikeyword |published|', RTVisibility));

  OK('private', TTestParser.ParsesAs('strict private',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: PrivateSemikeyword |private|', RTVisibility));

  OK('protected', TTestParser.ParsesAs('strict protected',
    'VisibilityNode' + #13#10 +
    '  StrictSemikeywordNode: StrictSemikeyword |strict|' + #13#10 +
    '  VisibilityKeywordNode: ProtectedSemikeyword |protected|', RTVisibility));
end;

end.
