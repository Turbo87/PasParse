unit UTestLexScanner;

interface

uses
  UTest;

type
  TTestLexScanner = class(TTest)
  private
    class function LexesAs(ASource: string; ATokens: array of string): Boolean;

  protected
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  ULexScanner, UToken, SysUtils, ULexException;

{ TTestLexScanner }

class function TTestLexScanner.GetName: string;
begin
  Result := 'LexScanner';
end;

class function TTestLexScanner.LexesAs(ASource: string;
  ATokens: array of string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
  I: Integer;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  Result := True;

  try
    for I := 0 to Length(ATokens) - 1 do
    begin
      try
        AToken := ALexScanner.NextToken;
        Result := (AToken <> nil) and (AToken.Inspect = ATokens[I]);
      finally
        FreeAndNil(AToken);
      end;
    end;

    try
      AToken := ALexScanner.NextToken;
      Result := (AToken = nil) and Result;
    finally
     FreeAndNil(AToken);
    end;
  finally
    FreeAndNil(ALexScanner);
  end;
end;

class procedure TTestLexScanner.TestAll;
begin
  OK('BlankSource', LexesAs('', []));
  OK('OnlyWhitespace', LexesAs('  '#13#10'  ', []));
  OK('TwoTimesSigns', LexesAs('**', ['TimesSign |*|', 'TimesSign |*|']));
  OK('LeadingWhitespaceIsIgnored', LexesAs('  '#13#10'  *', ['TimesSign |*|']));

  // Comment tests
  OK('SingleLineCommentAtEof', LexesAs('// Foo', 
    ['SingleLineComment |// Foo|']));
  OK('SingleLineCommentFollowedByCrlf', LexesAs('// Foo'#13#10, 
    ['SingleLineComment |// Foo|']));
  OK('SingleLineCommentFollowedByLf', LexesAs('// Foo'#10, 
    ['SingleLineComment |// Foo|']));
  OK('TwoSingleLineComments', LexesAs('// Foo'#13#10'// Bar', 
    ['SingleLineComment |// Foo|', 'SingleLineComment |// Bar|']));
  OK('CurlyBraceComment', LexesAs('{ Foo }', 
    ['CurlyBraceComment |{ Foo }|']));
  OK('CurlyBraceCommentWithEmbeddedNewline', LexesAs('{ Foo'#13#10'  Bar }', 
    ['CurlyBraceComment |{ Foo'#13#10'  Bar }|']));
  OK('TwoCurlyBraceComments', LexesAs('{Foo}{Bar}', 
    ['CurlyBraceComment |{Foo}|', 'CurlyBraceComment |{Bar}|']));
  OK('ParenStarComment', LexesAs('(* Foo *)', 
    ['ParenStarComment |(* Foo *)|']));
  OK('ParenStarCommentWithEmbeddedNewline', LexesAs('(* Foo'#13#10'   Bar *)', 
    ['ParenStarComment |(* Foo'#13#10'   Bar *)|']));
  OK('TwoParenStarComments', LexesAs('(*Foo*)(*Bar*)', 
    ['ParenStarComment |(*Foo*)|', 'ParenStarComment |(*Bar*)|']));

  OK('TestCurlyBraceCommentNeverEnding', LexesAs('{abc', 
    ['CurlyBraceComment |{abc|']));
  OK('TestParenStarCommentNeverEnding', LexesAs('(*abc', 
    ['ParenStarComment |(*abc|']));

  // Compiler-directive tests
  OK('CurlyBraceCompilerDirective', LexesAs('{$DEFINE FOO}', 
    ['CompilerDirective |{$DEFINE FOO}|, parsed=|DEFINE FOO|']));
  OK('CurlyBraceCompilerDirectiveTrimsTrailing', LexesAs('{$DEFINE FOO }', 
    ['CompilerDirective |{$DEFINE FOO }|, parsed=|DEFINE FOO|']));
  OK('ParenStarCompilerDirective', LexesAs('(*$DEFINE FOO*)', 
    ['CompilerDirective |(*$DEFINE FOO*)|, parsed=|DEFINE FOO|']));
  OK('ParenStarCompilerDirectiveTrimsTrailing', LexesAs('(*$DEFINE FOO *)', 
    ['CompilerDirective |(*$DEFINE FOO *)|, parsed=|DEFINE FOO|']));

  // Number tests
  OK('Digit', LexesAs('0', ['Number |0|']));
  OK('Integer', LexesAs('42', ['Number |42|']));
  OK('Float', LexesAs('42.42', ['Number |42.42|']));
  OK('FloatWithNoDigitsAfterDecimalPoint', LexesAs('42.', ['Number |42.|']));
  OK('ScientificNotation', LexesAs('42e42', ['Number |42e42|']));
  OK('ScientificNotationWithCapitalLetter', LexesAs('42E42', ['Number |42E42|']));
  OK('NegativeExponent', LexesAs('42e-42', ['Number |42e-42|']));
  OK('ExplicitlyPositiveExponent', LexesAs('42e+42', ['Number |42e+42|']));
  OK('ExplicitlyPositiveNumberLexesAsUnaryOperator', 
    LexesAs('+42', ['PlusSign |+|', 'Number |42|']));
  OK('NegativeNumberLexesAsUnaryOperator', 
    LexesAs('-42', ['MinusSign |-|', 'Number |42|']));
  OK('Hex', LexesAs('$2A', ['Number |$2A|']));

  // String literal tests
  OK('EmptyString', LexesAs('''''', ['StringLiteral |''''|']));
  OK('SimpleString', LexesAs('''abc''', ['StringLiteral |''abc''|']));
  OK('StringWithEmbeddedApostrophe', LexesAs('''Bob''''s''', 
    ['StringLiteral |''Bob''''s''|']));
  OK('Character', LexesAs('#32', ['StringLiteral |#32|']));
  OK('HexCharacter', LexesAs('#$1A', ['StringLiteral |#$1A|']));
  OK('Mixed', LexesAs('''Foo''#13#10''Bar''', 
    ['StringLiteral |''Foo''#13#10''Bar''|']));
  // This is valid only in asm blocks, but valid nonetheless.
  OK('DoubleQuotedCharacter', LexesAs('"''"', 
    ['StringLiteral |"''"|']));

  // Identifier tests
  OK('Identifier', LexesAs('Foo', ['Identifier |Foo|']));
  OK('LeadingUnderscore', LexesAs('_Foo', ['Identifier |_Foo|']));
  OK('EmbeddedUnderscore', LexesAs('Foo_Bar', ['Identifier |Foo_Bar|']));
  OK('EmbeddedDigits', LexesAs('Foo42', ['Identifier |Foo42|']));
  OK('AmpersandIdentifier', LexesAs('&Foo', ['Identifier |&Foo|']));
  OK('AmpersandSemikeyword', LexesAs('&Absolute', ['Identifier |&Absolute|']));
  OK('AmpersandKeyword', LexesAs('&And', ['Identifier |&And|']));

  // Keyword tests
  OK('SemikeywordsAreCaseInsensitive', LexesAs('Absolute', ['AbsoluteSemikeyword |Absolute|']));
  OK('AbsoluteSemikeyword', LexesAs('absolute', ['AbsoluteSemikeyword |absolute|']));
  OK('AbstractSemikeyword', LexesAs('abstract', ['AbstractSemikeyword |abstract|']));
  OK('AssemblerSemikeyword', LexesAs('assembler', ['AssemblerSemikeyword |assembler|']));
  OK('AssemblySemikeyword', LexesAs('assembly', ['AssemblySemikeyword |assembly|']));
  OK('AtSemikeyword', LexesAs('at', ['AtSemikeyword |at|']));
  OK('AutomatedSemikeyword', LexesAs('automated', ['AutomatedSemikeyword |automated|']));
  OK('CdeclSemikeyword', LexesAs('cdecl', ['CdeclSemikeyword |cdecl|']));
  OK('ContainsSemikeyword', LexesAs('contains', ['ContainsSemikeyword |contains|']));
  OK('DefaultSemikeyword', LexesAs('default', ['DefaultSemikeyword |default|']));
  OK('DeprecatedSemikeyword', LexesAs('deprecated', ['DeprecatedSemikeyword |deprecated|']));
  OK('DispIdSemikeyword', LexesAs('dispid', ['DispIdSemikeyword |dispid|']));
  OK('DynamicSemikeyword', LexesAs('dynamic', ['DynamicSemikeyword |dynamic|']));
  OK('ExportSemikeyword', LexesAs('export', ['ExportSemikeyword |export|']));
  OK('ExternalSemikeyword', LexesAs('external', ['ExternalSemikeyword |external|']));
  OK('FarSemikeyword', LexesAs('far', ['FarSemikeyword |far|']));
  OK('FinalSemikeyword', LexesAs('final', ['FinalSemikeyword |final|']));
  OK('ForwardSemikeyword', LexesAs('forward', ['ForwardSemikeyword |forward|']));
  OK('HelperSemikeyword', LexesAs('helper', ['HelperSemikeyword |helper|']));
  OK('ImplementsSemikeyword', LexesAs('implements', ['ImplementsSemikeyword |implements|']));
  OK('IndexSemikeyword', LexesAs('index', ['IndexSemikeyword |index|']));
  OK('LocalSemikeyword', LexesAs('local', ['LocalSemikeyword |local|']));
  OK('MessageSemikeyword', LexesAs('message', ['MessageSemikeyword |message|']));
  OK('NameSemikeyword', LexesAs('name', ['NameSemikeyword |name|']));
  OK('NearSemikeyword', LexesAs('near', ['NearSemikeyword |near|']));
  OK('NoDefaultSemikeyword', LexesAs('nodefault', ['NoDefaultSemikeyword |nodefault|']));
  OK('OnSemikeyword', LexesAs('on', ['OnSemikeyword |on|']));
  OK('OperatorSemikeyword', LexesAs('operator', ['OperatorSemikeyword |operator|']));
  OK('OutSemikeyword', LexesAs('out', ['OutSemikeyword |out|']));
  OK('OverloadSemikeyword', LexesAs('overload', ['OverloadSemikeyword |overload|']));
  OK('OverrideSemikeyword', LexesAs('override', ['OverrideSemikeyword |override|']));
  OK('PackageSemikeyword', LexesAs('package', ['PackageSemikeyword |package|']));
  OK('PascalSemikeyword', LexesAs('pascal', ['PascalSemikeyword |pascal|']));
  OK('PlatformSemikeyword', LexesAs('platform', ['PlatformSemikeyword |platform|']));
  OK('PrivateSemikeyword', LexesAs('private', ['PrivateSemikeyword |private|']));
  OK('ProtectedSemikeyword', LexesAs('protected', ['ProtectedSemikeyword |protected|']));
  OK('PublicSemikeyword', LexesAs('public', ['PublicSemikeyword |public|']));
  OK('PublishedSemikeyword', LexesAs('published', ['PublishedSemikeyword |published|']));
  OK('ReadSemikeyword', LexesAs('read', ['ReadSemikeyword |read|']));
  OK('ReadOnlySemikeyword', LexesAs('readonly', ['ReadOnlySemikeyword |readonly|']));
  OK('RegisterSemikeyword', LexesAs('register', ['RegisterSemikeyword |register|']));
  OK('ReintroduceSemikeyword', LexesAs('reintroduce', ['ReintroduceSemikeyword |reintroduce|']));
  OK('RequiresSemikeyword', LexesAs('requires', ['RequiresSemikeyword |requires|']));
  OK('ResidentSemikeyword', LexesAs('resident', ['ResidentSemikeyword |resident|']));
  OK('SafecallSemikeyword', LexesAs('safecall', ['SafecallSemikeyword |safecall|']));
  OK('SealedSemikeyword', LexesAs('sealed', ['SealedSemikeyword |sealed|']));
  OK('StdcallSemikeyword', LexesAs('stdcall', ['StdcallSemikeyword |stdcall|']));
  OK('StoredSemikeyword', LexesAs('stored', ['StoredSemikeyword |stored|']));
  OK('StrictSemikeyword', LexesAs('strict', ['StrictSemikeyword |strict|']));
  OK('VarArgsSemikeyword', LexesAs('varargs', ['VarArgsSemikeyword |varargs|']));
  OK('VirtualSemikeyword', LexesAs('virtual', ['VirtualSemikeyword |virtual|']));
  OK('WriteSemikeyword', LexesAs('write', ['WriteSemikeyword |write|']));
  OK('WriteOnlySemikeyword', LexesAs('writeonly', ['WriteOnlySemikeyword |writeonly|']));

  OK('KeywordsAreCaseInsensitive', LexesAs('And', ['AndKeyword |And|']));
  OK('AndKeyword', LexesAs('and', ['AndKeyword |and|']));
  OK('ArrayKeyword', LexesAs('array', ['ArrayKeyword |array|']));
  OK('AsKeyword', LexesAs('as', ['AsKeyword |as|']));
  OK('AsmKeyword', LexesAs('asm', ['AsmKeyword |asm|']));
  OK('BeginKeyword', LexesAs('begin', ['BeginKeyword |begin|']));
  OK('CaseKeyword', LexesAs('case', ['CaseKeyword |case|']));
  OK('ClassKeyword', LexesAs('class', ['ClassKeyword |class|']));
  OK('ConstKeyword', LexesAs('const', ['ConstKeyword |const|']));
  OK('ConstructorKeyword', LexesAs('constructor', ['ConstructorKeyword |constructor|']));
  OK('DestructorKeyword', LexesAs('destructor', ['DestructorKeyword |destructor|']));
  OK('DispInterfaceKeyword', LexesAs('dispinterface', ['DispInterfaceKeyword |dispinterface|']));
  OK('DivKeyword', LexesAs('div', ['DivKeyword |div|']));
  OK('DoKeyword', LexesAs('do', ['DoKeyword |do|']));
  OK('DownToKeyword', LexesAs('downto', ['DownToKeyword |downto|']));
  OK('ElseKeyword', LexesAs('else', ['ElseKeyword |else|']));
  OK('EndKeyword', LexesAs('end', ['EndKeyword |end|']));
  OK('ExceptKeyword', LexesAs('except', ['ExceptKeyword |except|']));
  OK('ExportsKeyword', LexesAs('exports', ['ExportsKeyword |exports|']));
  OK('FileKeyword', LexesAs('file', ['FileKeyword |file|']));
  OK('FinalizationKeyword', LexesAs('finalization', ['FinalizationKeyword |finalization|']));
  OK('FinallyKeyword', LexesAs('finally', ['FinallyKeyword |finally|']));
  OK('ForKeyword', LexesAs('for', ['ForKeyword |for|']));
  OK('FunctionKeyword', LexesAs('function', ['FunctionKeyword |function|']));
  OK('GotoKeyword', LexesAs('goto', ['GotoKeyword |goto|']));
  OK('IfKeyword', LexesAs('if', ['IfKeyword |if|']));
  OK('ImplementationKeyword', LexesAs('implementation', ['ImplementationKeyword |implementation|']));
  OK('InKeyword', LexesAs('in', ['InKeyword |in|']));
  OK('InheritedKeyword', LexesAs('inherited', ['InheritedKeyword |inherited|']));
  OK('InitializationKeyword', LexesAs('initialization', ['InitializationKeyword |initialization|']));
  OK('InlineKeyword', LexesAs('inline', ['InlineKeyword |inline|']));
  OK('InterfaceKeyword', LexesAs('interface', ['InterfaceKeyword |interface|']));
  OK('IsKeyword', LexesAs('is', ['IsKeyword |is|']));
  OK('LabelKeyword', LexesAs('label', ['LabelKeyword |label|']));
  OK('LibraryKeyword', LexesAs('library', ['LibraryKeyword |library|']));
  OK('ModKeyword', LexesAs('mod', ['ModKeyword |mod|']));
  OK('NilKeyword', LexesAs('nil', ['NilKeyword |nil|']));
  OK('NotKeyword', LexesAs('not', ['NotKeyword |not|']));
  OK('ObjectKeyword', LexesAs('object', ['ObjectKeyword |object|']));
  OK('OfKeyword', LexesAs('of', ['OfKeyword |of|']));
  OK('OrKeyword', LexesAs('or', ['OrKeyword |or|']));
  OK('PackedKeyword', LexesAs('packed', ['PackedKeyword |packed|']));
  OK('ProcedureKeyword', LexesAs('procedure', ['ProcedureKeyword |procedure|']));
  OK('ProgramKeyword', LexesAs('program', ['ProgramKeyword |program|']));
  OK('PropertyKeyword', LexesAs('property', ['PropertyKeyword |property|']));
  OK('RaiseKeyword', LexesAs('raise', ['RaiseKeyword |raise|']));
  OK('RecordKeyword', LexesAs('record', ['RecordKeyword |record|']));
  OK('RepeatKeyword', LexesAs('repeat', ['RepeatKeyword |repeat|']));
  OK('ResourceStringKeyword', LexesAs('resourcestring', ['ResourceStringKeyword |resourcestring|']));
  OK('SetKeyword', LexesAs('set', ['SetKeyword |set|']));
  OK('ShlKeyword', LexesAs('shl', ['ShlKeyword |shl|']));
  OK('ShrKeyword', LexesAs('shr', ['ShrKeyword |shr|']));
  OK('StringKeyword', LexesAs('string', ['StringKeyword |string|']));
  OK('ThenKeyword', LexesAs('then', ['ThenKeyword |then|']));
  OK('ThreadVarKeyword', LexesAs('threadvar', ['ThreadVarKeyword |threadvar|']));
  OK('ToKeyword', LexesAs('to', ['ToKeyword |to|']));
  OK('TryKeyword', LexesAs('try', ['TryKeyword |try|']));
  OK('TypeKeyword', LexesAs('type', ['TypeKeyword |type|']));
  OK('UnitKeyword', LexesAs('unit', ['UnitKeyword |unit|']));
  OK('UntilKeyword', LexesAs('until', ['UntilKeyword |until|']));
  OK('UsesKeyword', LexesAs('uses', ['UsesKeyword |uses|']));
  OK('VarKeyword', LexesAs('var', ['VarKeyword |var|']));
  OK('WhileKeyword', LexesAs('while', ['WhileKeyword |while|']));
  OK('WithKeyword', LexesAs('with', ['WithKeyword |with|']));
  OK('XorKeyword', LexesAs('xor', ['XorKeyword |xor|']));

  // Equality / inequality / assignment tests
  OK('ColonEquals', LexesAs(':=', ['ColonEquals |:=|']));
  OK('EqualSign', LexesAs('=', ['EqualSign |=|']));
  OK('GreaterThan', LexesAs('>', ['GreaterThan |>|']));
  OK('LessThan', LexesAs('<', ['LessThan |<|']));
  OK('LessOrEqual', LexesAs('<=', ['LessOrEqual |<=|']));
  OK('GreaterOrEqual', LexesAs('>=', ['GreaterOrEqual |>=|']));
  OK('NotEqual', LexesAs('<>', ['NotEqual |<>|']));

  // Punctuation tests
  OK('AtSign', LexesAs('@', ['AtSign |@|']));
  OK('Caret', LexesAs('^', ['Caret |^|']));
  OK('CloseBracket', LexesAs(']', ['CloseBracket |]|']));
  OK('CloseParenthesis', LexesAs(')', ['CloseParenthesis |)|']));
  OK('Colon', LexesAs(':', ['Colon |:|']));
  OK('Comma', LexesAs(',', ['Comma |,|']));
  OK('DivideBySign', LexesAs('/', ['DivideBySign |/|']));
  OK('Dot', LexesAs('.', ['Dot |.|']));
  OK('DotDot', LexesAs('..', ['DotDot |..|']));
  OK('MinusSign', LexesAs('-', ['MinusSign |-|']));
  OK('OpenBracket', LexesAs('[', ['OpenBracket |[|']));
  OK('OpenParenthesis', LexesAs('(', ['OpenParenthesis |(|']));
  OK('PlusSign', LexesAs('+', ['PlusSign |+|']));
  OK('Semicolon', LexesAs(';', ['Semicolon |;|']));
  OK('TimesSign', LexesAs('*', ['TimesSign |*|']));

  try
    LexesAs('''abc', ['StringLiteral |''abc|']);
    OK(False, 'TestNeverEndingString');
  except
    on ETestException do;
    on ELexException do
      OK(True, 'TestNeverEndingString');
  else
    OK(False, 'TestNeverEndingString');
  end;
end;

end.

