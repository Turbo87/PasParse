unit UTestDirective;

interface

uses
  UTest;

type
  TTestDirective = class(TTest)
  private
    class function SimpleDirective(AKeyword: string): string;
    
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType, UParseException;

{ TTestDirective }

class function TTestDirective.GetName: string;
begin
  Result := 'Directive';
end;

class function TTestDirective.SimpleDirective(AKeyword: string): string;
begin
  Result := 'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ' + AKeyword + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode';
end;

class procedure TTestDirective.TestAll;
begin
  OK('abstract', TTestParser.ParsesAs('abstract',
    SimpleDirective('AbstractSemikeyword |abstract|'), RTDirective));
  OK('assembler', TTestParser.ParsesAs('assembler',
    SimpleDirective('AssemblerSemikeyword |assembler|'), RTDirective));
  OK('cdecl', TTestParser.ParsesAs('cdecl',
    SimpleDirective('CdeclSemikeyword |cdecl|'), RTDirective));

  try
    TTestParser.ParsesAs('dispid', '', RTDirective);
    OK(False, 'dispid exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'dispid exception');
  else
    OK(False, 'dispid exception');
  end;

  OK('dispid 42', TTestParser.ParsesAs('dispid 42',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: DispIdSemikeyword |dispid|' + #13#10 +
    '  ValueNode: Number |42|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('dynamic', TTestParser.ParsesAs('dynamic',
    SimpleDirective('DynamicSemikeyword |dynamic|'), RTDirective));
  OK('export', TTestParser.ParsesAs('export',
    SimpleDirective('ExportSemikeyword |export|'), RTDirective));

  OK('external', TTestParser.ParsesAs('external',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('external ''Foo.dll''', TTestParser.ParsesAs('external ''Foo.dll''',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('external ''Foo.dll'' index 42 name ''Bar''',
    TTestParser.ParsesAs('external ''Foo.dll'' index 42 name ''Bar''',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: StringLiteral |''Foo.dll''|' + #13#10 +
    '  DataNode: ListNode' + #13#10 +
    '    Items[0]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: IndexSemikeyword |index|' + #13#10 +
    '      ValueNode: Number |42|' + #13#10 +
    '    Items[1]: ExportsSpecifierNode' + #13#10 +
    '      KeywordNode: NameSemikeyword |name|' + #13#10 +
    '      ValueNode: StringLiteral |''Bar''|', RTDirective));

  OK('far', TTestParser.ParsesAs('far',
    SimpleDirective('FarSemikeyword |far|'), RTDirective));
  OK('final', TTestParser.ParsesAs('final',
    SimpleDirective('FinalSemikeyword |final|'), RTDirective));
  OK('forward', TTestParser.ParsesAs('forward',
    SimpleDirective('ForwardSemikeyword |forward|'), RTDirective));
  OK('inline', TTestParser.ParsesAs('inline',
    SimpleDirective('InlineKeyword |inline|'), RTDirective));
  OK('local', TTestParser.ParsesAs('local',
    SimpleDirective('LocalSemikeyword |local|'), RTDirective));

  try
    TTestParser.ParsesAs('message', '', RTDirective);
    OK(False, 'message exception');
  except
    on ETestException do;
    on EParseException do
      OK(True, 'message exception');
  else
    OK(False, 'message exception');
  end;

  OK('message WM_ULTIMATEANSWER',
    TTestParser.ParsesAs('message WM_ULTIMATEANSWER',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: (none)' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('near', TTestParser.ParsesAs('near',
    SimpleDirective('NearSemikeyword |near|'), RTDirective));
  OK('overload', TTestParser.ParsesAs('overload',
    SimpleDirective('OverloadSemikeyword |overload|'), RTDirective));
  OK('override', TTestParser.ParsesAs('override',
    SimpleDirective('OverrideSemikeyword |override|'), RTDirective));
  OK('pascal', TTestParser.ParsesAs('pascal',
    SimpleDirective('PascalSemikeyword |pascal|'), RTDirective));
  OK('register', TTestParser.ParsesAs('register',
    SimpleDirective('RegisterSemikeyword |register|'), RTDirective));
  OK('reintroduce', TTestParser.ParsesAs('reintroduce',
    SimpleDirective('ReintroduceSemikeyword |reintroduce|'), RTDirective));
  OK('safecall', TTestParser.ParsesAs('safecall',
    SimpleDirective('SafecallSemikeyword |safecall|'), RTDirective));
  OK('static', TTestParser.ParsesAs('static',
    SimpleDirective('StaticSemikeyword |static|'), RTDirective));
  OK('stdcall', TTestParser.ParsesAs('stdcall',
    SimpleDirective('StdcallSemikeyword |stdcall|'), RTDirective));
  OK('varargs', TTestParser.ParsesAs('varargs',
    SimpleDirective('VarArgsSemikeyword |varargs|'), RTDirective));
  OK('virtual', TTestParser.ParsesAs('virtual',
    SimpleDirective('VirtualSemikeyword |virtual|'), RTDirective));
  OK('platform', TTestParser.ParsesAs('platform',
    SimpleDirective('PlatformSemikeyword |platform|'), RTDirective));
  OK('deprecated', TTestParser.ParsesAs('deprecated',
    SimpleDirective('DeprecatedSemikeyword |deprecated|'), RTDirective));
  OK('library', TTestParser.ParsesAs('library',
    SimpleDirective('LibraryKeyword |library|'), RTDirective));

  OK('; abstract', TTestParser.ParsesAs('; abstract',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: AbstractSemikeyword |abstract|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('; message WM_ULTIMATEANSWER',
    TTestParser.ParsesAs('; message WM_ULTIMATEANSWER',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: MessageSemikeyword |message|' + #13#10 +
    '  ValueNode: Identifier |WM_ULTIMATEANSWER|' + #13#10 +
    '  DataNode: ListNode', RTDirective));

  OK('; external', TTestParser.ParsesAs('; external',
    'DirectiveNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|' + #13#10 +
    '  KeywordNode: ExternalSemikeyword |external|' + #13#10 +
    '  ValueNode: (none)' + #13#10 +
    '  DataNode: ListNode', RTDirective));
end;

end.
