unit UTestLexScanner;

interface

uses
  UTokenType, UTest;

type
  TTestLexScanner = class(TTest)
  private
    class function TestBlank(ASource: string): Boolean;
    class function TestOneToken(ASource: string; ATokenType: TTokenType; AText: string):
      Boolean;
    class function TestOneTokenPlusParsed(ASource: string; ATokenType:
      TTokenType; AText: string; AParsedText: string): Boolean;
    class function TestTwoTokens(ASource: string; ATokenType1, ATokenType2:
      TTokenType; AText1, AText2: string): Boolean;

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

class function TTestLexScanner.TestBlank(ASource: string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil);
  FreeAndNil(AToken);

  FreeAndNil(ALexScanner);
end;

class function TTestLexScanner.TestOneToken(ASource: string;
  ATokenType: TTokenType; AText: string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = ATokenType) and
    (AToken.Text = AText);
  FreeAndNil(AToken);

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
  FreeAndNil(AToken);

  FreeAndNil(ALexScanner);
end;

class function TTestLexScanner.TestOneTokenPlusParsed(ASource: string;
  ATokenType: TTokenType; AText: string; AParsedText: string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = ATokenType) and
    (AToken.Text = AText) and (AToken.ParsedText = AParsedText);
  FreeAndNil(AToken);

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
  FreeAndNil(AToken);

  FreeAndNil(ALexScanner);
end;

class function TTestLexScanner.TestTwoTokens(ASource: string; ATokenType1,
  ATokenType2: TTokenType; AText1, AText2: string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = ATokenType1) and
    (AToken.Text = AText1);
  FreeAndNil(AToken);

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = ATokenType2) and
    (AToken.Text = AText2) and
    Result;
  FreeAndNil(AToken);

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
  FreeAndNil(AToken);

  FreeAndNil(ALexScanner);
end;

class procedure TTestLexScanner.TestAll;
begin
  OK('TestBlankSource', TestBlank(''));
  OK('TestOnlyWhitespace', TestBlank('  ' + #13#10 + '  '));
  OK('TestLeadingWhitespaceIsIgnored', TestOneToken('  ' + #13#10 + '  *', TTTimesSign, '*'));

  OK('TestTwoTimesSign', TestTwoTokens('**', TTTimesSign, TTTimesSign, '*', '*'));

  OK('TestSingleLineCommentAtEof', TestOneToken('// Foo', TTSingleLineComment, '// Foo'));
  OK('TestSingleLineCommentFollowedByCrlf', TestOneToken('// Foo' + #13#10, TTSingleLineComment, '// Foo'));
  OK('TestSingleLineCommentFollowedByLf', TestOneToken('// Foo' + #10, TTSingleLineComment, '// Foo'));
  OK('TestTwoSingleLineComments', TestTwoTokens('// Foo' + #13#10 + '// Bar', TTSingleLineComment, TTSingleLineComment, '// Foo', '// Bar'));
  OK('TestCurlyBraceComment', TestOneToken('{ Foo }', TTCurlyBraceComment, '{ Foo }'));
  OK('TestCurlyBraceCommentWithEmbeddedNewline', TestOneToken('{ Foo' + #13#10 + '  Bar }', TTCurlyBraceComment, '{ Foo' + #13#10 + '  Bar }'));
  OK('TestTwoCurlyBraceComments', TestTwoTokens('{Foo}{Bar}', TTCurlyBraceComment, TTCurlyBraceComment, '{Foo}', '{Bar}'));
  OK('TestParenStarComment', TestOneToken('(* Foo *)', TTParenStarComment, '(* Foo *)'));
  OK('TestParenStarCommentWithEmbeddedNewline', TestOneToken('(* Foo' + #13#10 + '   Bar *)', TTParenStarComment, '(* Foo' + #13#10 + '   Bar *)'));
  OK('TestTwoParenStarComments', TestTwoTokens('(*Foo*)(*Bar*)', TTParenStarComment, TTParenStarComment, '(*Foo*)', '(*Bar*)'));

  OK('TestCurlyBraceCommentNeverEnding', TestOneToken('{abc', TTCurlyBraceComment, '{abc'));
  OK('TestParenStarCommentNeverEnding', TestOneToken('(*abc', TTParenStarComment, '(*abc'));

  OK('TestCurlyBraceCompilerDirective', TestOneTokenPlusParsed('{$DEFINE FOO}', TTCompilerDirective, '{$DEFINE FOO}', 'DEFINE FOO'));
  OK('TestCurlyBraceCompilerDirectiveTrimsTrailing', TestOneTokenPlusParsed('{$DEFINE FOO }', TTCompilerDirective, '{$DEFINE FOO }', 'DEFINE FOO'));
  OK('TestParenStarCompilerDirective', TestOneTokenPlusParsed('(*$DEFINE FOO*)', TTCompilerDirective, '(*$DEFINE FOO*)', 'DEFINE FOO'));
  OK('TestParenStarCompilerDirectiveTrimsTrailing', TestOneTokenPlusParsed('(*$DEFINE FOO *)', TTCompilerDirective, '(*$DEFINE FOO *)', 'DEFINE FOO'));

  OK('TestDigit', TestOneToken('0', TTNumber, '0'));
  OK('TestInteger', TestOneToken('42', TTNumber, '42'));
  OK('TestFloat', TestOneToken('42.42', TTNumber, '42.42'));
  OK('TestFloatWithNoDigitsAfterDecimalPoint', TestOneToken('42.', TTNumber, '42.'));
  OK('TestScientificNotation', TestOneToken('42e42', TTNumber, '42e42'));
  OK('TestScientificNotationWithCapitalLetter', TestOneToken('42E42', TTNumber, '42E42'));
  OK('TestNegativeExponent', TestOneToken('42e-42', TTNumber, '42e-42'));
  OK('TestExplicitlyPositiveExponent', TestOneToken('42e+42', TTNumber, '42e+42'));
  OK('TestExplicitlyPositiveNumberLexesAsUnaryOperator', TestTwoTokens('+42', TTPlusSign, TTNumber, '+', '42'));
  OK('TestNegativeNumberLexesAsUnaryOperator', TestTwoTokens('-42', TTMinusSign, TTNumber, '-', '42'));
  OK('TestHex', TestOneToken('$2A', TTNumber, '$2A'));

  OK('TestEmptyString', TestOneToken('''''', TTStringLiteral, ''''''));
  OK('TestSimpleString', TestOneToken(''' abc ''', TTStringLiteral, ''' abc '''));
  OK('TestStringWithEmbeddedApostrophe', TestOneToken('''Bob''''s''', TTStringLiteral, '''Bob''''s'''));
  OK('TestCharacter', TestOneToken('#32', TTStringLiteral, '#32'));
  OK('TestHexCharacter', TestOneToken('#$1A', TTStringLiteral, '#$1A'));
  OK('TestMixed', TestOneToken('''Foo''#13#10''Bar''', TTStringLiteral, '''Foo''#13#10''Bar'''));
  // This is valid only in asm blocks, but valid nonetheless.
  OK('TestDoubleQuotedCharacter', TestOneToken('"''"', TTStringLiteral, '"''"'));

  OK('TestIdentifier', TestOneToken('Foo', TTIdentifier, 'Foo'));
  OK('TestLeadingUnderscore', TestOneToken('_Foo', TTIdentifier, '_Foo'));
  OK('TestEmbeddedUnderscore', TestOneToken('Foo_Bar', TTIdentifier, 'Foo_Bar'));
  OK('TestEmbeddedDigits', TestOneToken('Foo42', TTIdentifier, 'Foo42'));
  OK('TestAmpersandIdentifier', TestOneToken('&Foo', TTIdentifier, '&Foo'));
  OK('TestAmpersandSemikeyword', TestOneToken('&Absolute', TTIdentifier, '&Absolute'));
  OK('TestAmpersandKeyword', TestOneToken('&And', TTIdentifier, '&And'));

  OK('TestSemikeywordsAreCaseInsensitive', TestOneToken('Absolute', TTAbsoluteSemikeyword, 'Absolute'));
  OK('TestAbsoluteSemikeyword', TestOneToken('absolute', TTAbsoluteSemikeyword, 'absolute'));
  OK('TestAbstractSemikeyword', TestOneToken('abstract', TTAbstractSemikeyword, 'abstract'));
  OK('TestAssemblerSemikeyword', TestOneToken('assembler', TTAssemblerSemikeyword, 'assembler'));
  OK('TestAssemblySemikeyword', TestOneToken('assembly', TTAssemblySemikeyword, 'assembly'));
  OK('TestAtSemikeyword', TestOneToken('at', TTAtSemikeyword, 'at'));
  OK('TestAutomatedSemikeyword', TestOneToken('automated', TTAutomatedSemikeyword, 'automated'));
  OK('TestCdeclSemikeyword', TestOneToken('cdecl', TTCdeclSemikeyword, 'cdecl'));
  OK('TestContainsSemikeyword', TestOneToken('contains', TTContainsSemikeyword, 'contains'));
  OK('TestDefaultSemikeyword', TestOneToken('default', TTDefaultSemikeyword, 'default'));
  OK('TestDeprecatedSemikeyword', TestOneToken('deprecated', TTDeprecatedSemikeyword, 'deprecated'));
  OK('TestDispIdSemikeyword', TestOneToken('dispid', TTDispIdSemikeyword, 'dispid'));
  OK('TestDynamicSemikeyword', TestOneToken('dynamic', TTDynamicSemikeyword, 'dynamic'));
  OK('TestExportSemikeyword', TestOneToken('export', TTExportSemikeyword, 'export'));
  OK('TestExternalSemikeyword', TestOneToken('external', TTExternalSemikeyword, 'external'));
  OK('TestFarSemikeyword', TestOneToken('far', TTFarSemikeyword, 'far'));
  OK('TestFinalSemikeyword', TestOneToken('final', TTFinalSemikeyword, 'final'));
  OK('TestForwardSemikeyword', TestOneToken('forward', TTForwardSemikeyword, 'forward'));
  OK('TestHelperSemikeyword', TestOneToken('helper', TTHelperSemikeyword, 'helper'));
  OK('TestImplementsSemikeyword', TestOneToken('implements', TTImplementsSemikeyword, 'implements'));
  OK('TestIndexSemikeyword', TestOneToken('index', TTIndexSemikeyword, 'index'));
  OK('TestLocalSemikeyword', TestOneToken('local', TTLocalSemikeyword, 'local'));
  OK('TestMessageSemikeyword', TestOneToken('message', TTMessageSemikeyword, 'message'));
  OK('TestNameSemikeyword', TestOneToken('name', TTNameSemikeyword, 'name'));
  OK('TestNearSemikeyword', TestOneToken('near', TTNearSemikeyword, 'near'));
  OK('TestNoDefaultSemikeyword', TestOneToken('nodefault', TTNoDefaultSemikeyword, 'nodefault'));
  OK('TestOnSemikeyword', TestOneToken('on', TTOnSemikeyword, 'on'));
  OK('TestOperatorSemikeyword', TestOneToken('operator', TTOperatorSemikeyword, 'operator'));
  OK('TestOutSemikeyword', TestOneToken('out', TTOutSemikeyword, 'out'));
  OK('TestOverloadSemikeyword', TestOneToken('overload', TTOverloadSemikeyword, 'overload'));
  OK('TestOverrideSemikeyword', TestOneToken('override', TTOverrideSemikeyword, 'override'));
  OK('TestPackageSemikeyword', TestOneToken('package', TTPackageSemikeyword, 'package'));
  OK('TestPascalSemikeyword', TestOneToken('pascal', TTPascalSemikeyword, 'pascal'));
  OK('TestPlatformSemikeyword', TestOneToken('platform', TTPlatformSemikeyword, 'platform'));
  OK('TestPrivateSemikeyword', TestOneToken('private', TTPrivateSemikeyword, 'private'));
  OK('TestProtectedSemikeyword', TestOneToken('protected', TTProtectedSemikeyword, 'protected'));
  OK('TestPublicSemikeyword', TestOneToken('public', TTPublicSemikeyword, 'public'));
  OK('TestPublishedSemikeyword', TestOneToken('published', TTPublishedSemikeyword, 'published'));
  OK('TestReadSemikeyword', TestOneToken('read', TTReadSemikeyword, 'read'));
  OK('TestReadOnlySemikeyword', TestOneToken('readonly', TTReadOnlySemikeyword, 'readonly'));
  OK('TestRegisterSemikeyword', TestOneToken('register', TTRegisterSemikeyword, 'register'));
  OK('TestReintroduceSemikeyword', TestOneToken('reintroduce', TTReintroduceSemikeyword, 'reintroduce'));
  OK('TestRequiresSemikeyword', TestOneToken('requires', TTRequiresSemikeyword, 'requires'));
  OK('TestResidentSemikeyword', TestOneToken('resident', TTResidentSemikeyword, 'resident'));
  OK('TestSafecallSemikeyword', TestOneToken('safecall', TTSafecallSemikeyword, 'safecall'));
  OK('TestSealedSemikeyword', TestOneToken('sealed', TTSealedSemikeyword, 'sealed'));
  OK('TestStdcallSemikeyword', TestOneToken('stdcall', TTStdcallSemikeyword, 'stdcall'));
  OK('TestStoredSemikeyword', TestOneToken('stored', TTStoredSemikeyword, 'stored'));
  OK('TestStrictSemikeyword', TestOneToken('strict', TTStrictSemikeyword, 'strict'));
  OK('TestVarArgsSemikeyword', TestOneToken('varargs', TTVarArgsSemikeyword, 'varargs'));
  OK('TestVirtualSemikeyword', TestOneToken('virtual', TTVirtualSemikeyword, 'virtual'));
  OK('TestWriteSemikeyword', TestOneToken('write', TTWriteSemikeyword, 'write'));
  OK('TestWriteOnlySemikeyword', TestOneToken('writeonly', TTWriteOnlySemikeyword, 'writeonly'));

  OK('TestKeywordsAreCaseInsensitive', TestOneToken('And', TTAndKeyword, 'And'));
  OK('TestAndKeyword', TestOneToken('and', TTAndKeyword, 'and'));
  OK('TestArrayKeyword', TestOneToken('array', TTArrayKeyword, 'array'));
  OK('TestAsKeyword', TestOneToken('as', TTAsKeyword, 'as'));
  OK('TestAsmKeyword', TestOneToken('asm', TTAsmKeyword, 'asm'));
  OK('TestbeginKeyword', TestOneToken('begin', TTbeginKeyword, 'begin'));
  OK('TestCaseKeyword', TestOneToken('case', TTCaseKeyword, 'case'));
  OK('TestClassKeyword', TestOneToken('class', TTClassKeyword, 'class'));
  OK('TestConstKeyword', TestOneToken('const', TTConstKeyword, 'const'));
  OK('TestConstructorKeyword', TestOneToken('constructor', TTConstructorKeyword, 'constructor'));
  OK('TestDestructorKeyword', TestOneToken('destructor', TTDestructorKeyword, 'destructor'));
  OK('TestDispInterfaceKeyword', TestOneToken('dispinterface', TTDispInterfaceKeyword, 'dispinterface'));
  OK('TestDivKeyword', TestOneToken('div', TTDivKeyword, 'div'));
  OK('TestDoKeyword', TestOneToken('do', TTDoKeyword, 'do'));
  OK('TestDownToKeyword', TestOneToken('downto', TTDownToKeyword, 'downto'));
  OK('TestElseKeyword', TestOneToken('else', TTElseKeyword, 'else'));
  OK('TestEndKeyword', TestOneToken('end', TTEndKeyword, 'end'));
  OK('TestExceptKeyword', TestOneToken('except', TTExceptKeyword, 'except'));
  OK('TestExportsKeyword', TestOneToken('exports', TTExportsKeyword, 'exports'));
  OK('TestFileKeyword', TestOneToken('file', TTFileKeyword, 'file'));
  OK('TestFinalizationKeyword', TestOneToken('finalization', TTFinalizationKeyword, 'finalization'));
  OK('TestFinallyKeyword', TestOneToken('finally', TTFinallyKeyword, 'finally'));
  OK('TestForKeyword', TestOneToken('for', TTForKeyword, 'for'));
  OK('TestFunctionKeyword', TestOneToken('function', TTFunctionKeyword, 'function'));
  OK('TestGotoKeyword', TestOneToken('goto', TTGotoKeyword, 'goto'));
  OK('TestIfKeyword', TestOneToken('if', TTIfKeyword, 'if'));
  OK('TestImplementationKeyword', TestOneToken('implementation', TTImplementationKeyword, 'implementation'));
  OK('TestInKeyword', TestOneToken('in', TTInKeyword, 'in'));
  OK('TestInheritedKeyword', TestOneToken('inherited', TTInheritedKeyword, 'inherited'));
  OK('TestInitializationKeyword', TestOneToken('initialization', TTInitializationKeyword, 'initialization'));
  OK('TestInlineKeyword', TestOneToken('inline', TTInlineKeyword, 'inline'));
  OK('TestInterfaceKeyword', TestOneToken('interface', TTInterfaceKeyword, 'interface'));
  OK('TestIsKeyword', TestOneToken('is', TTIsKeyword, 'is'));
  OK('TestLabelKeyword', TestOneToken('label', TTLabelKeyword, 'label'));
  OK('TestLibraryKeyword', TestOneToken('library', TTLibraryKeyword, 'library'));
  OK('TestModKeyword', TestOneToken('mod', TTModKeyword, 'mod'));
  OK('TestNilKeyword', TestOneToken('nil', TTNilKeyword, 'nil'));
  OK('TestNotKeyword', TestOneToken('not', TTNotKeyword, 'not'));
  OK('TestObjectKeyword', TestOneToken('object', TTObjectKeyword, 'object'));
  OK('TestOfKeyword', TestOneToken('of', TTOfKeyword, 'of'));
  OK('TestOrKeyword', TestOneToken('or', TTOrKeyword, 'or'));
  OK('TestPackedKeyword', TestOneToken('packed', TTPackedKeyword, 'packed'));
  OK('TestProcedureKeyword', TestOneToken('procedure', TTProcedureKeyword, 'procedure'));
  OK('TestProgramKeyword', TestOneToken('program', TTProgramKeyword, 'program'));
  OK('TestPropertyKeyword', TestOneToken('property', TTPropertyKeyword, 'property'));
  OK('TestRaiseKeyword', TestOneToken('raise', TTRaiseKeyword, 'raise'));
  OK('TestRecordKeyword', TestOneToken('record', TTRecordKeyword, 'record'));
  OK('TestRepeatKeyword', TestOneToken('repeat', TTRepeatKeyword, 'repeat'));
  OK('TestResourceStringKeyword', TestOneToken('resourcestring', TTResourceStringKeyword, 'resourcestring'));
  OK('TestSetKeyword', TestOneToken('set', TTSetKeyword, 'set'));
  OK('TestShlKeyword', TestOneToken('shl', TTShlKeyword, 'shl'));
  OK('TestShrKeyword', TestOneToken('shr', TTShrKeyword, 'shr'));
  OK('TestStringKeyword', TestOneToken('string', TTStringKeyword, 'string'));
  OK('TestThenKeyword', TestOneToken('then', TTThenKeyword, 'then'));
  OK('TestThreadVarKeyword', TestOneToken('threadvar', TTThreadVarKeyword, 'threadvar'));
  OK('TestToKeyword', TestOneToken('to', TTToKeyword, 'to'));
  OK('TestTryKeyword', TestOneToken('try', TTTryKeyword, 'try'));
  OK('TestTypeKeyword', TestOneToken('type', TTTypeKeyword, 'type'));
  OK('TestUnitKeyword', TestOneToken('unit', TTUnitKeyword, 'unit'));
  OK('TestUntilKeyword', TestOneToken('until', TTUntilKeyword, 'until'));
  OK('TestUsesKeyword', TestOneToken('uses', TTUsesKeyword, 'uses'));
  OK('TestVarKeyword', TestOneToken('var', TTVarKeyword, 'var'));
  OK('TestWhileKeyword', TestOneToken('while', TTWhileKeyword, 'while'));
  OK('TestWithKeyword', TestOneToken('with', TTWithKeyword, 'with'));
  OK('TestXorKeyword', TestOneToken('xor', TTXorKeyword, 'xor'));

  OK('TestColonEquals', TestOneToken(':=', TTColonEquals, ':='));
  OK('TestEqualSign', TestOneToken('=', TTEqualSign, '='));
  OK('TestGreaterThan', TestOneToken('>', TTGreaterThan, '>'));
  OK('TestLessThan', TestOneToken('<', TTLessThan, '<'));
  OK('TestLessOrEqual', TestOneToken('<=', TTLessOrEqual, '<='));
  OK('TestGreaterOrEqual', TestOneToken('>=', TTGreaterOrEqual, '>='));
  OK('TestNotEqual', TestOneToken('<>', TTNotEqual, '<>'));

  OK('TestAtSign', TestOneToken('@', TTAtSign, '@'));
  OK('TestCaret', TestOneToken('^', TTCaret, '^'));
  OK('TestCloseBracket', TestOneToken(']', TTCloseBracket, ']'));
  OK('TestCloseParenthesis', TestOneToken(')', TTCloseParenthesis, ')'));
  OK('TestColon', TestOneToken(':', TTColon, ':'));
  OK('TestComma', TestOneToken(',', TTComma, ','));
  OK('TestDivideBySign', TestOneToken('/', TTDivideBySign, '/'));
  OK('TestDot', TestOneToken('.', TTDot, '.'));
  OK('TestDotDot', TestOneToken('..', TTDotDot, '..'));
  OK('TestMinusSign', TestOneToken('-', TTMinusSign, '-'));
  OK('TestOpenBracket', TestOneToken('[', TTOpenBracket, '['));
  OK('TestOpenParenthesis', TestOneToken('(', TTOpenParenthesis, '('));
  OK('TestPlusSign', TestOneToken('+', TTPlusSign, '+'));
  OK('TestSemicolon', TestOneToken(';', TTSemicolon, ';'));
  OK('TestTimesSign', TestOneToken('*', TTTimesSign, '*'));

  try
    TestOneToken('''abc', TTStringLiteral, '''abc');
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

