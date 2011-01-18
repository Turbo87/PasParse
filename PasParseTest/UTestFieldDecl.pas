unit UTestFieldDecl;

interface

uses
  UTest;

type
  TTestFieldDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParser, UCompilerDefines;

{ TTestFieldDecl }

class function TTestFieldDecl.GetName: string;
begin
  Result := 'FieldDecl';
end;

class procedure TTestFieldDecl.TestAll;
var
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
begin
  OK('Foo: Integer;', TTestParser.ParsesAs('Foo: Integer;',
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTFieldDecl));

  OK('Foo: Integer', TTestParser.ParsesAs('Foo: Integer',
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: (none)', RTFieldDecl));

  OK('Foo: Integer library deprecated;', 
    TTestParser.ParsesAs('Foo: Integer library deprecated;', 
    'FieldDeclNode' + #13#10 +
    '  NameListNode: ListNode' + #13#10 +
    '    Items[0]: DelimitedItemNode' + #13#10 +
    '      ItemNode: Identifier |Foo|' + #13#10 +
    '      DelimiterNode: (none)' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: LibraryKeyword |library|' + #13#10 +
    '    Items[1]: DeprecatedSemikeyword |deprecated|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTFieldDecl));

  ACompilerDefines := TCompilerDefines.Create;

  AParser := TParser.CreateFromText('public', '', ACompilerDefines, nil);
  OK('LookAhead: public', not AParser.CanParseRule(RTFieldDecl));
  AParser.Free;

  AParser := TParser.CreateFromText('strict private', '', ACompilerDefines, nil);
  OK('LookAhead: strict private', not AParser.CanParseRule(RTFieldDecl));
  AParser.Free;

  ACompilerDefines.Free;     
end;

end.
