unit UTestLexScanner;

interface

uses
  UTokenType;

type
  TTestLexScanner = class
  private
    class function TestBlankSource: Boolean;
    class function TestOnlyWhitespace: Boolean;
    class function TestTwoTimesSign: Boolean;
    class function TestLeadingWhitespaceIsIgnored: Boolean;
    class function TestSingleLineCommentAtEof: Boolean;
    class function TestSingleLineCommentFollowedByCrlf: Boolean;
    class function TestSingleLineCommentFollowedByLf: Boolean;
    class function TestTwoSingleLineComments: Boolean;
    class function TestCurlyBraceComment: Boolean;
    class function TestCurlyBraceCommentWithEmbeddedNewline: Boolean;
    class function TestTwoCurlyBraceComments: Boolean;
    class function TestParenStarComment: Boolean;
    class function TestParenStarCommentWithEmbeddedNewline: Boolean;
    class function TestTwoParenStarComments: Boolean;
    class function TestCurlyBraceCompilerDirective: Boolean;
    class function TestCurlyBraceCompilerDirectiveTrimsTrailing: Boolean;
    class function TestParenStarCompilerDirective: Boolean;
    class function TestParenStarCompilerDirectiveTrimsTrailing: Boolean;
    class function TestDigit: Boolean;
    class function TestInteger: Boolean;
    class function TestFloat: Boolean;
    class function TestFloatWithNoDigitsAfterDecimalPoint: Boolean;
    class function TestScientificNotation: Boolean;
    class function TestScientificNotationWithCapitalLetter: Boolean;
    class function TestNegativeExponent: Boolean;
    class function TestExplicitlyPositiveExponent: Boolean;
    class function TestExplicitlyPositiveNumberLexesAsUnaryOperator: Boolean;
    class function TestNegativeNumberLexesAsUnaryOperator: Boolean;
    class function TestHex: Boolean;
    class function TestEmptyString: Boolean;
    class function TestSimpleString: Boolean;
    class function TestStringWithEmbeddedApostrophe: Boolean;
    class function TestCharacter: Boolean;
    class function TestHexCharacter: Boolean;
    class function TestMixed: Boolean;
    class function TestDoubleQuotedCharacter: Boolean;
    class function TestIdentifier: Boolean;
    class function TestLeadingUnderscore: Boolean;
    class function TestEmbeddedUnderscore: Boolean;
    class function TestEmbeddedDigits: Boolean;
    class function TestAmpersandIdentifier: Boolean;
    class function TestAmpersandSemikeyword: Boolean;
    class function TestAmpersandKeyword: Boolean;
    class function TestSemikeywordsAreCaseInsensitive: Boolean;
    class function TestAbsoluteSemikeyword: Boolean;
    class function TestAbstractSemikeyword: Boolean;
    class function TestAssemblerSemikeyword: Boolean;
    class function TestAssemblySemikeyword: Boolean;
    class function TestAtSemikeyword: Boolean;
    class function TestAutomatedSemikeyword: Boolean;
    class function TestCdeclSemikeyword: Boolean;
    class function TestContainsSemikeyword: Boolean;
    class function TestDefaultSemikeyword: Boolean;
    class function TestDeprecatedSemikeyword: Boolean;
    class function TestDispIdSemikeyword: Boolean;
    class function TestDynamicSemikeyword: Boolean;
    class function TestExportSemikeyword: Boolean;
    class function TestExternalSemikeyword: Boolean;
    class function TestFarSemikeyword: Boolean;
    class function TestFinalSemikeyword: Boolean;
    class function TestForwardSemikeyword: Boolean;
    class function TestHelperSemikeyword: Boolean;
    class function TestImplementsSemikeyword: Boolean;
    class function TestIndexSemikeyword: Boolean;
    class function TestLocalSemikeyword: Boolean;
    class function TestMessageSemikeyword: Boolean;
    class function TestNameSemikeyword: Boolean;
    class function TestNearSemikeyword: Boolean;
    class function TestNoDefaultSemikeyword: Boolean;
    class function TestOnSemikeyword: Boolean;
    class function TestOperatorSemikeyword: Boolean;
    class function TestOutSemikeyword: Boolean;
    class function TestOverloadSemikeyword: Boolean;
    class function TestOverrideSemikeyword: Boolean;
    class function TestPackageSemikeyword: Boolean;
    class function TestPascalSemikeyword: Boolean;
    class function TestPlatformSemikeyword: Boolean;
    class function TestPrivateSemikeyword: Boolean;
    class function TestProtectedSemikeyword: Boolean;
    class function TestPublicSemikeyword: Boolean;
    class function TestPublishedSemikeyword: Boolean;
    class function TestReadSemikeyword: Boolean;
    class function TestReadOnlySemikeyword: Boolean;
    class function TestRegisterSemikeyword: Boolean;
    class function TestReintroduceSemikeyword: Boolean;
    class function TestRequiresSemikeyword: Boolean;
    class function TestResidentSemikeyword: Boolean;
    class function TestSafecallSemikeyword: Boolean;
    class function TestSealedSemikeyword: Boolean;
    class function TestStdcallSemikeyword: Boolean;
    class function TestStoredSemikeyword: Boolean;
    class function TestStrictSemikeyword: Boolean;
    class function TestVarArgsSemikeyword: Boolean;
    class function TestVirtualSemikeyword: Boolean;
    class function TestWriteSemikeyword: Boolean;
    class function TestWriteOnlySemikeyword: Boolean;
    class function TestKeywordsAreCaseInsensitive: Boolean;
    class function TestAndKeyword: Boolean;
    class function TestArrayKeyword: Boolean;
    class function TestAsKeyword: Boolean;
    class function TestAsmKeyword: Boolean;
    class function TestBeginKeyword: Boolean;
    class function TestCaseKeyword: Boolean;
    class function TestClassKeyword: Boolean;
    class function TestConstKeyword: Boolean;
    class function TestConstructorKeyword: Boolean;
    class function TestDestructorKeyword: Boolean;
    class function TestDispInterfaceKeyword: Boolean;
    class function TestDivKeyword: Boolean;
    class function TestDoKeyword: Boolean;
    class function TestDownToKeyword: Boolean;
    class function TestElseKeyword: Boolean;
    class function TestEndKeyword: Boolean;
    class function TestExceptKeyword: Boolean;
    class function TestExportsKeyword: Boolean;
    class function TestFileKeyword: Boolean;
    class function TestFinalizationKeyword: Boolean;
    class function TestFinallyKeyword: Boolean;
    class function TestForKeyword: Boolean;
    class function TestFunctionKeyword: Boolean;
    class function TestGotoKeyword: Boolean;
    class function TestIfKeyword: Boolean;
    class function TestImplementationKeyword: Boolean;
    class function TestInKeyword: Boolean;
    class function TestInheritedKeyword: Boolean;
    class function TestInitializationKeyword: Boolean;
    class function TestInlineKeyword: Boolean;
    class function TestInterfaceKeyword: Boolean;
    class function TestIsKeyword: Boolean;
    class function TestLabelKeyword: Boolean;
    class function TestLibraryKeyword: Boolean;
    class function TestModKeyword: Boolean;
    class function TestNilKeyword: Boolean;
    class function TestNotKeyword: Boolean;
    class function TestObjectKeyword: Boolean;
    class function TestOfKeyword: Boolean;
    class function TestOrKeyword: Boolean;
    class function TestPackedKeyword: Boolean;
    class function TestProcedureKeyword: Boolean;
    class function TestProgramKeyword: Boolean;
    class function TestPropertyKeyword: Boolean;
    class function TestRaiseKeyword: Boolean;
    class function TestRecordKeyword: Boolean;
    class function TestRepeatKeyword: Boolean;
    class function TestResourceStringKeyword: Boolean;
    class function TestSetKeyword: Boolean;
    class function TestShlKeyword: Boolean;
    class function TestShrKeyword: Boolean;
    class function TestStringKeyword: Boolean;
    class function TestThenKeyword: Boolean;
    class function TestThreadVarKeyword: Boolean;
    class function TestToKeyword: Boolean;
    class function TestTryKeyword: Boolean;
    class function TestTypeKeyword: Boolean;
    class function TestUnitKeyword: Boolean;
    class function TestUntilKeyword: Boolean;
    class function TestUsesKeyword: Boolean;
    class function TestVarKeyword: Boolean;
    class function TestWhileKeyword: Boolean;
    class function TestWithKeyword: Boolean;
    class function TestXorKeyword: Boolean;
    class function TestColonEquals: Boolean;
    class function TestEqualSign: Boolean;
    class function TestGreaterThan: Boolean;
    class function TestLessThan: Boolean;
    class function TestLessOrEqual: Boolean;
    class function TestGreaterOrEqual: Boolean;
    class function TestNotEqual: Boolean;
    class function TestAtSign: Boolean;
    class function TestCaret: Boolean;
    class function TestCloseBracket: Boolean;
    class function TestCloseParenthesis: Boolean;
    class function TestColon: Boolean;
    class function TestComma: Boolean;
    class function TestDivideBySign: Boolean;
    class function TestDot: Boolean;
    class function TestDotDot: Boolean;
    class function TestMinusSign: Boolean;
    class function TestOpenBracket: Boolean;
    class function TestOpenParenthesis: Boolean;
    class function TestPlusSign: Boolean;
    class function TestSemicolon: Boolean;
    class function TestTimesSign: Boolean;

    class function TestBlank(ASource: string): Boolean;
    class function TestOneToken(ASource: string; ATokenType: TTokenType; AText: string):
      Boolean;
    class function TestOneTokenPlusParsed(ASource: string; ATokenType:
      TTokenType; AText: string; AParsedText: string): Boolean;
    class function TestTwoTokens(ASource: string; ATokenType1, ATokenType2:
      TTokenType; AText1, AText2: string): Boolean;

  public
    class function Test: Boolean;
  end;

implementation

uses
  ULexScanner, UToken;

{ TTestLexScanner }

class function TTestLexScanner.TestBlankSource: Boolean;
begin
  Result := TestBlank('');
end;

class function TTestLexScanner.TestOnlyWhitespace: Boolean;
begin
  Result := TestBlank('  ' + #13#10 + '  ');
end;

class function TTestLexScanner.TestLeadingWhitespaceIsIgnored: Boolean;
begin
  Result := TestOneToken('  ' + #13#10 + '  *', TTTimesSign, '*');
end;

class function TTestLexScanner.TestTwoTimesSign: Boolean;
begin
  Result := TestTwoTokens('**', TTTimesSign, TTTimesSign, '*', '*');
end;

class function TTestLexScanner.TestSingleLineCommentAtEof: Boolean;
begin
  Result := TestOneToken('// Foo', TTSingleLineComment, '// Foo');
end;

class function TTestLexScanner.TestSingleLineCommentFollowedByCrlf: Boolean;
begin
  Result := TestOneToken('// Foo' + #13#10, TTSingleLineComment, '// Foo');
end;

class function TTestLexScanner.TestSingleLineCommentFollowedByLf: Boolean;
begin
  Result := TestOneToken('// Foo' + #10, TTSingleLineComment, '// Foo');
end;

class function TTestLexScanner.TestTwoSingleLineComments: Boolean;
begin
  Result := TestTwoTokens('// Foo' + #13#10 + '// Bar', TTSingleLineComment, TTSingleLineComment, '// Foo', '// Bar');
end;

class function TTestLexScanner.TestCurlyBraceComment: Boolean;
begin
  Result := TestOneToken('{ Foo }', TTCurlyBraceComment, '{ Foo }');
end;

class function TTestLexScanner.TestCurlyBraceCommentWithEmbeddedNewline:
  Boolean;
begin
  Result := TestOneToken('{ Foo' + #13#10 + '  Bar }', TTCurlyBraceComment, '{ Foo' + #13#10 + '  Bar }');
end;

class function TTestLexScanner.TestTwoCurlyBraceComments: Boolean;
begin
  Result := TestTwoTokens('{Foo}{Bar}', TTCurlyBraceComment, TTCurlyBraceComment, '{Foo}', '{Bar}');
end;

class function TTestLexScanner.TestParenStarComment: Boolean;
begin
  Result := TestOneToken('(* Foo *)', TTParenStarComment, '(* Foo *)');
end;

class function TTestLexScanner.TestParenStarCommentWithEmbeddedNewline:
  Boolean;
begin
  Result := TestOneToken('(* Foo' + #13#10 + '   Bar *)', TTParenStarComment, '(* Foo' + #13#10 + '   Bar *)');
end;

class function TTestLexScanner.TestTwoParenStarComments: Boolean;
begin
  Result := TestTwoTokens('(*Foo*)(*Bar*)', TTParenStarComment, TTParenStarComment, '(*Foo*)', '(*Bar*)');
end;

class function TTestLexScanner.TestCurlyBraceCompilerDirective: Boolean;
begin
  Result := TestOneTokenPlusParsed('{$DEFINE FOO}', TTCompilerDirective, '{$DEFINE FOO}', 'DEFINE FOO');
end;

class function TTestLexScanner.TestCurlyBraceCompilerDirectiveTrimsTrailing:
  Boolean;
begin
  Result := TestOneTokenPlusParsed('{$DEFINE FOO }', TTCompilerDirective, '{$DEFINE FOO }', 'DEFINE FOO');
end;

class function TTestLexScanner.TestParenStarCompilerDirective: Boolean;
begin
  Result := TestOneTokenPlusParsed('(*$DEFINE FOO*)', TTCompilerDirective, '(*$DEFINE FOO*)', 'DEFINE FOO');
end;

class function TTestLexScanner.TestParenStarCompilerDirectiveTrimsTrailing:
  Boolean;
begin
  Result := TestOneTokenPlusParsed('(*$DEFINE FOO *)', TTCompilerDirective, '(*$DEFINE FOO *)', 'DEFINE FOO');
end;

class function TTestLexScanner.TestDigit: Boolean;
begin
  Result := TestOneToken('0', TTNumber, '0');
end;

class function TTestLexScanner.TestInteger: Boolean;
begin
  Result := TestOneToken('42', TTNumber, '42');
end;

class function TTestLexScanner.TestFloat: Boolean;
begin
  Result := TestOneToken('42.42', TTNumber, '42.42');
end;

class function TTestLexScanner.TestFloatWithNoDigitsAfterDecimalPoint: Boolean;
begin
  Result := TestOneToken('42.', TTNumber, '42.');
end;

class function TTestLexScanner.TestScientificNotation: Boolean;
begin
  Result := TestOneToken('42e42', TTNumber, '42e42');
end;

class function TTestLexScanner.TestScientificNotationWithCapitalLetter:
  Boolean;
begin
  Result := TestOneToken('42E42', TTNumber, '42E42');
end;

class function TTestLexScanner.TestNegativeExponent: Boolean;
begin
  Result := TestOneToken('42e-42', TTNumber, '42e-42');
end;

class function TTestLexScanner.TestExplicitlyPositiveExponent: Boolean;
begin
  Result := TestOneToken('42e+42', TTNumber, '42e+42');
end;

class function
  TTestLexScanner.TestExplicitlyPositiveNumberLexesAsUnaryOperator: Boolean;
begin
  Result := TestTwoTokens('+42', TTPlusSign, TTNumber, '+', '42');
end;

class function TTestLexScanner.TestNegativeNumberLexesAsUnaryOperator: Boolean;
begin
  Result := TestTwoTokens('-42', TTMinusSign, TTNumber, '-', '42');
end;

class function TTestLexScanner.TestHex: Boolean;
begin
  Result := TestOneToken('$2A', TTNumber, '$2A');
end;

class function TTestLexScanner.TestEmptyString: Boolean;
begin
  Result := TestOneToken('''''', TTStringLiteral, '''''');
end;

class function TTestLexScanner.TestSimpleString: Boolean;
begin
  Result := TestOneToken(''' abc ''', TTStringLiteral, ''' abc ''');
end;

class function TTestLexScanner.TestStringWithEmbeddedApostrophe: Boolean;
begin
  Result := TestOneToken('''Bob''''s''', TTStringLiteral, '''Bob''''s''');
end;

class function TTestLexScanner.TestCharacter: Boolean;
begin
  Result := TestOneToken('#32', TTStringLiteral, '#32');
end;

class function TTestLexScanner.TestHexCharacter: Boolean;
begin
  Result := TestOneToken('#$1A', TTStringLiteral, '#$1A');
end;

class function TTestLexScanner.TestMixed: Boolean;
begin
  Result := TestOneToken('''Foo''#13#10''Bar''', TTStringLiteral, '''Foo''#13#10''Bar''');
end;

class function TTestLexScanner.TestDoubleQuotedCharacter: Boolean;
begin
  // This is valid only in asm blocks, but valid nonetheless.
  Result := TestOneToken('"''"', TTStringLiteral, '"''"');
end;

class function TTestLexScanner.TestIdentifier: Boolean;
begin
  Result := TestOneToken('Foo', TTIdentifier, 'Foo');
end;

class function TTestLexScanner.TestLeadingUnderscore: Boolean;
begin
  Result := TestOneToken('_Foo', TTIdentifier, '_Foo');
end;

class function TTestLexScanner.TestEmbeddedUnderscore: Boolean;
begin
  Result := TestOneToken('Foo_Bar', TTIdentifier, 'Foo_Bar');
end;

class function TTestLexScanner.TestEmbeddedDigits: Boolean;
begin
  Result := TestOneToken('Foo42', TTIdentifier, 'Foo42');
end;

class function TTestLexScanner.TestAmpersandIdentifier: Boolean;
begin
  Result := TestOneToken('&Foo', TTIdentifier, '&Foo');
end;

class function TTestLexScanner.TestAmpersandSemikeyword: Boolean;
begin
  Result := TestOneToken('&Absolute', TTIdentifier, '&Absolute');
end;

class function TTestLexScanner.TestAmpersandKeyword: Boolean;
begin
  Result := TestOneToken('&And', TTIdentifier, '&And');
end;

class function TTestLexScanner.TestSemikeywordsAreCaseInsensitive: Boolean;
begin
  Result := TestOneToken('Absolute', TTAbsoluteSemikeyword, 'Absolute');
end;

class function TTestLexScanner.TestAbsoluteSemikeyword: Boolean;
begin
  Result := TestOneToken('absolute', TTAbsoluteSemikeyword, 'absolute');
end;

class function TTestLexScanner.TestAbstractSemikeyword: Boolean;
begin
  Result := TestOneToken('abstract', TTAbstractSemikeyword, 'abstract');
end;

class function TTestLexScanner.TestAssemblerSemikeyword: Boolean;
begin
  Result := TestOneToken('assembler', TTAssemblerSemikeyword, 'assembler');
end;

class function TTestLexScanner.TestAssemblySemikeyword: Boolean;
begin
  Result := TestOneToken('assembly', TTAssemblySemikeyword, 'assembly');
end;

class function TTestLexScanner.TestAtSemikeyword: Boolean;
begin
  Result := TestOneToken('at', TTAtSemikeyword, 'at');
end;

class function TTestLexScanner.TestAutomatedSemikeyword: Boolean;
begin
  Result := TestOneToken('automated', TTAutomatedSemikeyword, 'automated');
end;

class function TTestLexScanner.TestCdeclSemikeyword: Boolean;
begin
  Result := TestOneToken('cdecl', TTCdeclSemikeyword, 'cdecl');
end;

class function TTestLexScanner.TestContainsSemikeyword: Boolean;
begin
  Result := TestOneToken('contains', TTContainsSemikeyword, 'contains');
end;

class function TTestLexScanner.TestDefaultSemikeyword: Boolean;
begin
  Result := TestOneToken('default', TTDefaultSemikeyword, 'default');
end;

class function TTestLexScanner.TestDeprecatedSemikeyword: Boolean;
begin
  Result := TestOneToken('deprecated', TTDeprecatedSemikeyword, 'deprecated');
end;

class function TTestLexScanner.TestDispIdSemikeyword: Boolean;
begin
  Result := TestOneToken('dispid', TTDispIdSemikeyword, 'dispid');
end;

class function TTestLexScanner.TestDynamicSemikeyword: Boolean;
begin
  Result := TestOneToken('dynamic', TTDynamicSemikeyword, 'dynamic');
end;

class function TTestLexScanner.TestExportSemikeyword: Boolean;
begin
  Result := TestOneToken('export', TTExportSemikeyword, 'export');
end;

class function TTestLexScanner.TestExternalSemikeyword: Boolean;
begin
  Result := TestOneToken('external', TTExternalSemikeyword, 'external');
end;

class function TTestLexScanner.TestFarSemikeyword: Boolean;
begin
  Result := TestOneToken('far', TTFarSemikeyword, 'far');
end;

class function TTestLexScanner.TestFinalSemikeyword: Boolean;
begin
  Result := TestOneToken('final', TTFinalSemikeyword, 'final');
end;

class function TTestLexScanner.TestForwardSemikeyword: Boolean;
begin
  Result := TestOneToken('forward', TTForwardSemikeyword, 'forward');
end;

class function TTestLexScanner.TestHelperSemikeyword: Boolean;
begin
  Result := TestOneToken('helper', TTHelperSemikeyword, 'helper');
end;

class function TTestLexScanner.TestImplementsSemikeyword: Boolean;
begin
  Result := TestOneToken('implements', TTImplementsSemikeyword, 'implements');
end;

class function TTestLexScanner.TestIndexSemikeyword: Boolean;
begin
  Result := TestOneToken('index', TTIndexSemikeyword, 'index');
end;

class function TTestLexScanner.TestLocalSemikeyword: Boolean;
begin
  Result := TestOneToken('local', TTLocalSemikeyword, 'local');
end;

class function TTestLexScanner.TestMessageSemikeyword: Boolean;
begin
  Result := TestOneToken('message', TTMessageSemikeyword, 'message');
end;

class function TTestLexScanner.TestNameSemikeyword: Boolean;
begin
  Result := TestOneToken('name', TTNameSemikeyword, 'name');
end;

class function TTestLexScanner.TestNearSemikeyword: Boolean;
begin
  Result := TestOneToken('near', TTNearSemikeyword, 'near');
end;

class function TTestLexScanner.TestNoDefaultSemikeyword: Boolean;
begin
  Result := TestOneToken('nodefault', TTNoDefaultSemikeyword, 'nodefault');
end;

class function TTestLexScanner.TestOnSemikeyword: Boolean;
begin
  Result := TestOneToken('on', TTOnSemikeyword, 'on');
end;

class function TTestLexScanner.TestOperatorSemikeyword: Boolean;
begin
  Result := TestOneToken('operator', TTOperatorSemikeyword, 'operator');
end;

class function TTestLexScanner.TestOutSemikeyword: Boolean;
begin
  Result := TestOneToken('out', TTOutSemikeyword, 'out');
end;

class function TTestLexScanner.TestOverloadSemikeyword: Boolean;
begin
  Result := TestOneToken('overload', TTOverloadSemikeyword, 'overload');
end;

class function TTestLexScanner.TestOverrideSemikeyword: Boolean;
begin
  Result := TestOneToken('override', TTOverrideSemikeyword, 'override');
end;

class function TTestLexScanner.TestPackageSemikeyword: Boolean;
begin
  Result := TestOneToken('package', TTPackageSemikeyword, 'package');
end;

class function TTestLexScanner.TestPascalSemikeyword: Boolean;
begin
  Result := TestOneToken('pascal', TTPascalSemikeyword, 'pascal');
end;

class function TTestLexScanner.TestPlatformSemikeyword: Boolean;
begin
  Result := TestOneToken('platform', TTPlatformSemikeyword, 'platform');
end;

class function TTestLexScanner.TestPrivateSemikeyword: Boolean;
begin
  Result := TestOneToken('private', TTPrivateSemikeyword, 'private');
end;

class function TTestLexScanner.TestProtectedSemikeyword: Boolean;
begin
  Result := TestOneToken('protected', TTProtectedSemikeyword, 'protected');
end;

class function TTestLexScanner.TestPublicSemikeyword: Boolean;
begin
  Result := TestOneToken('public', TTPublicSemikeyword, 'public');
end;

class function TTestLexScanner.TestPublishedSemikeyword: Boolean;
begin
  Result := TestOneToken('published', TTPublishedSemikeyword, 'published');
end;

class function TTestLexScanner.TestReadSemikeyword: Boolean;
begin
  Result := TestOneToken('read', TTReadSemikeyword, 'read');
end;

class function TTestLexScanner.TestReadOnlySemikeyword: Boolean;
begin
  Result := TestOneToken('readonly', TTReadOnlySemikeyword, 'readonly');
end;

class function TTestLexScanner.TestRegisterSemikeyword: Boolean;
begin
  Result := TestOneToken('register', TTRegisterSemikeyword, 'register');
end;

class function TTestLexScanner.TestReintroduceSemikeyword: Boolean;
begin
  Result := TestOneToken('reintroduce', TTReintroduceSemikeyword, 'reintroduce');
end;

class function TTestLexScanner.TestRequiresSemikeyword: Boolean;
begin
  Result := TestOneToken('requires', TTRequiresSemikeyword, 'requires');
end;

class function TTestLexScanner.TestResidentSemikeyword: Boolean;
begin
  Result := TestOneToken('resident', TTResidentSemikeyword, 'resident');
end;

class function TTestLexScanner.TestSafecallSemikeyword: Boolean;
begin
  Result := TestOneToken('safecall', TTSafecallSemikeyword, 'safecall');
end;

class function TTestLexScanner.TestSealedSemikeyword: Boolean;
begin
  Result := TestOneToken('sealed', TTSealedSemikeyword, 'sealed');
end;

class function TTestLexScanner.TestStdcallSemikeyword: Boolean;
begin
  Result := TestOneToken('stdcall', TTStdcallSemikeyword, 'stdcall');
end;

class function TTestLexScanner.TestStoredSemikeyword: Boolean;
begin
  Result := TestOneToken('stored', TTStoredSemikeyword, 'stored');
end;

class function TTestLexScanner.TestStrictSemikeyword: Boolean;
begin
  Result := TestOneToken('strict', TTStrictSemikeyword, 'strict');
end;

class function TTestLexScanner.TestVarArgsSemikeyword: Boolean;
begin
  Result := TestOneToken('varargs', TTVarArgsSemikeyword, 'varargs');
end;

class function TTestLexScanner.TestVirtualSemikeyword: Boolean;
begin
  Result := TestOneToken('virtual', TTVirtualSemikeyword, 'virtual');
end;

class function TTestLexScanner.TestWriteSemikeyword: Boolean;
begin
  Result := TestOneToken('write', TTWriteSemikeyword, 'write');
end;

class function TTestLexScanner.TestWriteOnlySemikeyword: Boolean;
begin
  Result := TestOneToken('writeonly', TTWriteOnlySemikeyword, 'writeonly');
end;

class function TTestLexScanner.TestKeywordsAreCaseInsensitive: Boolean;
begin
  Result := TestOneToken('And', TTAndKeyword, 'And');
end;

class function TTestLexScanner.TestAndKeyword: Boolean;
begin
  Result := TestOneToken('and', TTAndKeyword, 'and');
end;

class function TTestLexScanner.TestArrayKeyword: Boolean;
begin
  Result := TestOneToken('array', TTArrayKeyword, 'array');
end;

class function TTestLexScanner.TestAsKeyword: Boolean;
begin
  Result := TestOneToken('as', TTAsKeyword, 'as');
end;

class function TTestLexScanner.TestAsmKeyword: Boolean;
begin
  Result := TestOneToken('asm', TTAsmKeyword, 'asm');
end;

class function TTestLexScanner.TestbeginKeyword: Boolean;
begin
  Result := TestOneToken('begin', TTbeginKeyword, 'begin');
end;

class function TTestLexScanner.TestCaseKeyword: Boolean;
begin
  Result := TestOneToken('case', TTCaseKeyword, 'case');
end;

class function TTestLexScanner.TestClassKeyword: Boolean;
begin
  Result := TestOneToken('class', TTClassKeyword, 'class');
end;

class function TTestLexScanner.TestConstKeyword: Boolean;
begin
  Result := TestOneToken('const', TTConstKeyword, 'const');
end;

class function TTestLexScanner.TestConstructorKeyword: Boolean;
begin
  Result := TestOneToken('constructor', TTConstructorKeyword, 'constructor');
end;

class function TTestLexScanner.TestDestructorKeyword: Boolean;
begin
  Result := TestOneToken('destructor', TTDestructorKeyword, 'destructor');
end;

class function TTestLexScanner.TestDispInterfaceKeyword: Boolean;
begin
  Result := TestOneToken('dispinterface', TTDispInterfaceKeyword, 'dispinterface');
end;

class function TTestLexScanner.TestDivKeyword: Boolean;
begin
  Result := TestOneToken('div', TTDivKeyword, 'div');
end;

class function TTestLexScanner.TestDoKeyword: Boolean;
begin
  Result := TestOneToken('do', TTDoKeyword, 'do');
end;

class function TTestLexScanner.TestDownToKeyword: Boolean;
begin
  Result := TestOneToken('downto', TTDownToKeyword, 'downto');
end;

class function TTestLexScanner.TestElseKeyword: Boolean;
begin
  Result := TestOneToken('else', TTElseKeyword, 'else');
end;

class function TTestLexScanner.TestEndKeyword: Boolean;
begin
  Result := TestOneToken('end', TTEndKeyword, 'end');
end;

class function TTestLexScanner.TestExceptKeyword: Boolean;
begin
  Result := TestOneToken('except', TTExceptKeyword, 'except');
end;

class function TTestLexScanner.TestExportsKeyword: Boolean;
begin
  Result := TestOneToken('exports', TTExportsKeyword, 'exports');
end;

class function TTestLexScanner.TestFileKeyword: Boolean;
begin
  Result := TestOneToken('file', TTFileKeyword, 'file');
end;

class function TTestLexScanner.TestFinalizationKeyword: Boolean;
begin
  Result := TestOneToken('finalization', TTFinalizationKeyword, 'finalization');
end;

class function TTestLexScanner.TestFinallyKeyword: Boolean;
begin
  Result := TestOneToken('finally', TTFinallyKeyword, 'finally');
end;

class function TTestLexScanner.TestForKeyword: Boolean;
begin
  Result := TestOneToken('for', TTForKeyword, 'for');
end;

class function TTestLexScanner.TestFunctionKeyword: Boolean;
begin
  Result := TestOneToken('function', TTFunctionKeyword, 'function');
end;

class function TTestLexScanner.TestGotoKeyword: Boolean;
begin
  Result := TestOneToken('goto', TTGotoKeyword, 'goto');
end;

class function TTestLexScanner.TestIfKeyword: Boolean;
begin
  Result := TestOneToken('if', TTIfKeyword, 'if');
end;

class function TTestLexScanner.TestImplementationKeyword: Boolean;
begin
  Result := TestOneToken('implementation', TTImplementationKeyword, 'implementation');
end;

class function TTestLexScanner.TestInKeyword: Boolean;
begin
  Result := TestOneToken('in', TTInKeyword, 'in');
end;

class function TTestLexScanner.TestInheritedKeyword: Boolean;
begin
  Result := TestOneToken('inherited', TTInheritedKeyword, 'inherited');
end;

class function TTestLexScanner.TestInitializationKeyword: Boolean;
begin
  Result := TestOneToken('initialization', TTInitializationKeyword, 'initialization');
end;

class function TTestLexScanner.TestInlineKeyword: Boolean;
begin
  Result := TestOneToken('inline', TTInlineKeyword, 'inline');
end;

class function TTestLexScanner.TestInterfaceKeyword: Boolean;
begin
  Result := TestOneToken('interface', TTInterfaceKeyword, 'interface');
end;

class function TTestLexScanner.TestIsKeyword: Boolean;
begin
  Result := TestOneToken('is', TTIsKeyword, 'is');
end;

class function TTestLexScanner.TestLabelKeyword: Boolean;
begin
  Result := TestOneToken('label', TTLabelKeyword, 'label');
end;

class function TTestLexScanner.TestLibraryKeyword: Boolean;
begin
  Result := TestOneToken('library', TTLibraryKeyword, 'library');
end;

class function TTestLexScanner.TestModKeyword: Boolean;
begin
  Result := TestOneToken('mod', TTModKeyword, 'mod');
end;

class function TTestLexScanner.TestNilKeyword: Boolean;
begin
  Result := TestOneToken('nil', TTNilKeyword, 'nil');
end;

class function TTestLexScanner.TestNotKeyword: Boolean;
begin
  Result := TestOneToken('not', TTNotKeyword, 'not');
end;

class function TTestLexScanner.TestObjectKeyword: Boolean;
begin
  Result := TestOneToken('object', TTObjectKeyword, 'object');
end;

class function TTestLexScanner.TestOfKeyword: Boolean;
begin
  Result := TestOneToken('of', TTOfKeyword, 'of');
end;

class function TTestLexScanner.TestOrKeyword: Boolean;
begin
  Result := TestOneToken('or', TTOrKeyword, 'or');
end;

class function TTestLexScanner.TestPackedKeyword: Boolean;
begin
  Result := TestOneToken('packed', TTPackedKeyword, 'packed');
end;

class function TTestLexScanner.TestProcedureKeyword: Boolean;
begin
  Result := TestOneToken('procedure', TTProcedureKeyword, 'procedure');
end;

class function TTestLexScanner.TestProgramKeyword: Boolean;
begin
  Result := TestOneToken('program', TTProgramKeyword, 'program');
end;

class function TTestLexScanner.TestPropertyKeyword: Boolean;
begin
  Result := TestOneToken('property', TTPropertyKeyword, 'property');
end;

class function TTestLexScanner.TestRaiseKeyword: Boolean;
begin
  Result := TestOneToken('raise', TTRaiseKeyword, 'raise');
end;

class function TTestLexScanner.TestRecordKeyword: Boolean;
begin
  Result := TestOneToken('record', TTRecordKeyword, 'record');
end;

class function TTestLexScanner.TestRepeatKeyword: Boolean;
begin
  Result := TestOneToken('repeat', TTRepeatKeyword, 'repeat');
end;

class function TTestLexScanner.TestResourceStringKeyword: Boolean;
begin
  Result := TestOneToken('resourcestring', TTResourceStringKeyword, 'resourcestring');
end;

class function TTestLexScanner.TestSetKeyword: Boolean;
begin
  Result := TestOneToken('set', TTSetKeyword, 'set');
end;

class function TTestLexScanner.TestShlKeyword: Boolean;
begin
  Result := TestOneToken('shl', TTShlKeyword, 'shl');
end;

class function TTestLexScanner.TestShrKeyword: Boolean;
begin
  Result := TestOneToken('shr', TTShrKeyword, 'shr');
end;

class function TTestLexScanner.TestStringKeyword: Boolean;
begin
  Result := TestOneToken('string', TTStringKeyword, 'string');
end;

class function TTestLexScanner.TestThenKeyword: Boolean;
begin
  Result := TestOneToken('then', TTThenKeyword, 'then');
end;

class function TTestLexScanner.TestThreadVarKeyword: Boolean;
begin
  Result := TestOneToken('threadvar', TTThreadVarKeyword, 'threadvar');
end;

class function TTestLexScanner.TestToKeyword: Boolean;
begin
  Result := TestOneToken('to', TTToKeyword, 'to');
end;

class function TTestLexScanner.TestTryKeyword: Boolean;
begin
  Result := TestOneToken('try', TTTryKeyword, 'try');
end;

class function TTestLexScanner.TestTypeKeyword: Boolean;
begin
  Result := TestOneToken('type', TTTypeKeyword, 'type');
end;

class function TTestLexScanner.TestUnitKeyword: Boolean;
begin
  Result := TestOneToken('unit', TTUnitKeyword, 'unit');
end;

class function TTestLexScanner.TestUntilKeyword: Boolean;
begin
  Result := TestOneToken('until', TTUntilKeyword, 'until');
end;

class function TTestLexScanner.TestUsesKeyword: Boolean;
begin
  Result := TestOneToken('uses', TTUsesKeyword, 'uses');
end;

class function TTestLexScanner.TestVarKeyword: Boolean;
begin
  Result := TestOneToken('var', TTVarKeyword, 'var');
end;

class function TTestLexScanner.TestWhileKeyword: Boolean;
begin
  Result := TestOneToken('while', TTWhileKeyword, 'while');
end;

class function TTestLexScanner.TestWithKeyword: Boolean;
begin
  Result := TestOneToken('with', TTWithKeyword, 'with');
end;

class function TTestLexScanner.TestXorKeyword: Boolean;
begin
  Result := TestOneToken('xor', TTXorKeyword, 'xor');
end;

class function TTestLexScanner.TestColonEquals: Boolean;
begin
  Result := TestOneToken(':=', TTColonEquals, ':=');
end;

class function TTestLexScanner.TestEqualSign: Boolean;
begin
  Result := TestOneToken('=', TTEqualSign, '=');
end;

class function TTestLexScanner.TestGreaterThan: Boolean;
begin
  Result := TestOneToken('>', TTGreaterThan, '>');
end;

class function TTestLexScanner.TestLessThan: Boolean;
begin
  Result := TestOneToken('<', TTLessThan, '<');
end;

class function TTestLexScanner.TestLessOrEqual: Boolean;
begin
  Result := TestOneToken('<=', TTLessOrEqual, '<=');
end;

class function TTestLexScanner.TestGreaterOrEqual: Boolean;
begin
  Result := TestOneToken('>=', TTGreaterOrEqual, '>=');
end;

class function TTestLexScanner.TestNotEqual: Boolean;
begin
  Result := TestOneToken('<>', TTNotEqual, '<>');
end;

class function TTestLexScanner.TestAtSign: Boolean;
begin
  Result := TestOneToken('@', TTAtSign, '@');
end;

class function TTestLexScanner.TestCaret: Boolean;
begin
  Result := TestOneToken('^', TTCaret, '^');
end;

class function TTestLexScanner.TestCloseBracket: Boolean;
begin
  Result := TestOneToken(']', TTCloseBracket, ']');
end;

class function TTestLexScanner.TestCloseParenthesis: Boolean;
begin
  Result := TestOneToken(')', TTCloseParenthesis, ')');
end;

class function TTestLexScanner.TestColon: Boolean;
begin
  Result := TestOneToken(':', TTColon, ':');
end;

class function TTestLexScanner.TestComma: Boolean;
begin
  Result := TestOneToken(',', TTComma, ',');
end;

class function TTestLexScanner.TestDivideBySign: Boolean;
begin
  Result := TestOneToken('/', TTDivideBySign, '/');
end;

class function TTestLexScanner.TestDot: Boolean;
begin
  Result := TestOneToken('.', TTDot, '.');
end;

class function TTestLexScanner.TestDotDot: Boolean;
begin
  Result := TestOneToken('..', TTDotDot, '..');
end;

class function TTestLexScanner.TestMinusSign: Boolean;
begin
  Result := TestOneToken('-', TTMinusSign, '-');
end;

class function TTestLexScanner.TestOpenBracket: Boolean;
begin
  Result := TestOneToken('[', TTOpenBracket, '[');
end;

class function TTestLexScanner.TestOpenParenthesis: Boolean;
begin
  Result := TestOneToken('(', TTOpenParenthesis, '(');
end;

class function TTestLexScanner.TestPlusSign: Boolean;
begin
  Result := TestOneToken('+', TTPlusSign, '+');
end;

class function TTestLexScanner.TestSemicolon: Boolean;
begin
  Result := TestOneToken(';', TTSemicolon, ';');
end;

class function TTestLexScanner.TestTimesSign: Boolean;
begin
  Result := TestOneToken('*', TTTimesSign, '*');
end;

class function TTestLexScanner.TestBlank(ASource: string): Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(ASource, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil);
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

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
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

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
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

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = ATokenType2) and
    (AToken.Text = AText2) and
    Result;

  AToken := ALexScanner.NextToken;
  Result := (AToken = nil) and Result;
end;

class function TTestLexScanner.Test: Boolean;
begin
  Result := TestBlankSource;
  Result := TestOnlyWhitespace and Result;
  Result := TestTwoTimesSign and Result;
  Result := TestLeadingWhitespaceIsIgnored and Result;
  Result := TestSingleLineCommentAtEof and Result;
  Result := TestSingleLineCommentFollowedByCrlf and Result;
  Result := TestSingleLineCommentFollowedByLf and Result;
  Result := TestTwoSingleLineComments and Result;
  Result := TestCurlyBraceComment and Result;
  Result := TestCurlyBraceCommentWithEmbeddedNewline and Result;
  Result := TestTwoCurlyBraceComments and Result;
  Result := TestParenStarComment and Result;
  Result := TestParenStarCommentWithEmbeddedNewline and Result;
  Result := TestTwoParenStarComments and Result;
  Result := TestCurlyBraceCompilerDirective and Result;
  Result := TestCurlyBraceCompilerDirectiveTrimsTrailing and Result;
  Result := TestParenStarCompilerDirective and Result;
  Result := TestParenStarCompilerDirectiveTrimsTrailing and Result;
  Result := TestDigit and Result;
  Result := TestInteger and Result;
  Result := TestFloat and Result;
  Result := TestFloatWithNoDigitsAfterDecimalPoint and Result;
  Result := TestScientificNotation and Result;
  Result := TestScientificNotationWithCapitalLetter and Result;
  Result := TestNegativeExponent and Result;
  Result := TestExplicitlyPositiveExponent and Result;
  Result := TestExplicitlyPositiveNumberLexesAsUnaryOperator and Result;
  Result := TestNegativeNumberLexesAsUnaryOperator and Result;
  Result := TestHex and Result;
  Result := TestEmptyString and Result;
  Result := TestSimpleString and Result;
  Result := TestStringWithEmbeddedApostrophe and Result;
  Result := TestCharacter and Result;
  Result := TestHexCharacter and Result;
  Result := TestMixed and Result;
  Result := TestDoubleQuotedCharacter and Result;
  Result := TestIdentifier and Result;
  Result := TestLeadingUnderscore and Result;
  Result := TestEmbeddedUnderscore and Result;
  Result := TestEmbeddedDigits and Result;
  Result := TestAmpersandIdentifier and Result;
  Result := TestAmpersandSemikeyword and Result;
  Result := TestAmpersandKeyword and Result;
  Result := TestSemikeywordsAreCaseInsensitive and Result;
  Result := TestAbsoluteSemikeyword and Result;
  Result := TestAbstractSemikeyword and Result;
  Result := TestAssemblerSemikeyword and Result;
  Result := TestAssemblySemikeyword and Result;
  Result := TestAtSemikeyword and Result;
  Result := TestAutomatedSemikeyword and Result;
  Result := TestCdeclSemikeyword and Result;
  Result := TestContainsSemikeyword and Result;
  Result := TestDefaultSemikeyword and Result;
  Result := TestDeprecatedSemikeyword and Result;
  Result := TestDispIdSemikeyword and Result;
  Result := TestDynamicSemikeyword and Result;
  Result := TestExportSemikeyword and Result;
  Result := TestExternalSemikeyword and Result;
  Result := TestFarSemikeyword and Result;
  Result := TestFinalSemikeyword and Result;
  Result := TestForwardSemikeyword and Result;
  Result := TestHelperSemikeyword and Result;
  Result := TestImplementsSemikeyword and Result;
  Result := TestIndexSemikeyword and Result;
  Result := TestLocalSemikeyword and Result;
  Result := TestMessageSemikeyword and Result;
  Result := TestNameSemikeyword and Result;
  Result := TestNearSemikeyword and Result;
  Result := TestNoDefaultSemikeyword and Result;
  Result := TestOnSemikeyword and Result;
  Result := TestOperatorSemikeyword and Result;
  Result := TestOutSemikeyword and Result;
  Result := TestOverloadSemikeyword and Result;
  Result := TestOverrideSemikeyword and Result;
  Result := TestPackageSemikeyword and Result;
  Result := TestPascalSemikeyword and Result;
  Result := TestPlatformSemikeyword and Result;
  Result := TestPrivateSemikeyword and Result;
  Result := TestProtectedSemikeyword and Result;
  Result := TestPublicSemikeyword and Result;
  Result := TestPublishedSemikeyword and Result;
  Result := TestReadSemikeyword and Result;
  Result := TestReadOnlySemikeyword and Result;
  Result := TestRegisterSemikeyword and Result;
  Result := TestReintroduceSemikeyword and Result;
  Result := TestRequiresSemikeyword and Result;
  Result := TestResidentSemikeyword and Result;
  Result := TestSafecallSemikeyword and Result;
  Result := TestSealedSemikeyword and Result;
  Result := TestStdcallSemikeyword and Result;
  Result := TestStoredSemikeyword and Result;
  Result := TestStrictSemikeyword and Result;
  Result := TestVarArgsSemikeyword and Result;
  Result := TestVirtualSemikeyword and Result;
  Result := TestWriteSemikeyword and Result;
  Result := TestWriteOnlySemikeyword and Result;
  Result := TestKeywordsAreCaseInsensitive and Result;
  Result := TestAndKeyword and Result;
  Result := TestArrayKeyword and Result;
  Result := TestAsKeyword and Result;
  Result := TestAsmKeyword and Result;
  Result := TestBeginKeyword and Result;
  Result := TestCaseKeyword and Result;
  Result := TestClassKeyword and Result;
  Result := TestConstKeyword and Result;
  Result := TestConstructorKeyword and Result;
  Result := TestDestructorKeyword and Result;
  Result := TestDispInterfaceKeyword and Result;
  Result := TestDivKeyword and Result;
  Result := TestDoKeyword and Result;
  Result := TestDownToKeyword and Result;
  Result := TestElseKeyword and Result;
  Result := TestEndKeyword and Result;
  Result := TestExceptKeyword and Result;
  Result := TestExportsKeyword and Result;
  Result := TestFileKeyword and Result;
  Result := TestFinalizationKeyword and Result;
  Result := TestFinallyKeyword and Result;
  Result := TestForKeyword and Result;
  Result := TestFunctionKeyword and Result;
  Result := TestGotoKeyword and Result;
  Result := TestIfKeyword and Result;
  Result := TestImplementationKeyword and Result;
  Result := TestInKeyword and Result;
  Result := TestInheritedKeyword and Result;
  Result := TestInitializationKeyword and Result;
  Result := TestInlineKeyword and Result;
  Result := TestInterfaceKeyword and Result;
  Result := TestIsKeyword and Result;
  Result := TestLabelKeyword and Result;
  Result := TestLibraryKeyword and Result;
  Result := TestModKeyword and Result;
  Result := TestNilKeyword and Result;
  Result := TestNotKeyword and Result;
  Result := TestObjectKeyword and Result;
  Result := TestOfKeyword and Result;
  Result := TestOrKeyword and Result;
  Result := TestPackedKeyword and Result;
  Result := TestProcedureKeyword and Result;
  Result := TestProgramKeyword and Result;
  Result := TestPropertyKeyword and Result;
  Result := TestRaiseKeyword and Result;
  Result := TestRecordKeyword and Result;
  Result := TestRepeatKeyword and Result;
  Result := TestResourceStringKeyword and Result;
  Result := TestSetKeyword and Result;
  Result := TestShlKeyword and Result;
  Result := TestShrKeyword and Result;
  Result := TestStringKeyword and Result;
  Result := TestThenKeyword and Result;
  Result := TestThreadVarKeyword and Result;
  Result := TestToKeyword and Result;
  Result := TestTryKeyword and Result;
  Result := TestTypeKeyword and Result;
  Result := TestUnitKeyword and Result;
  Result := TestUntilKeyword and Result;
  Result := TestUsesKeyword and Result;
  Result := TestVarKeyword and Result;
  Result := TestWhileKeyword and Result;
  Result := TestWithKeyword and Result;
  Result := TestXorKeyword and Result;
  Result := TestColonEquals and Result;
  Result := TestEqualSign and Result;
  Result := TestGreaterThan and Result;
  Result := TestLessThan and Result;
  Result := TestLessOrEqual and Result;
  Result := TestGreaterOrEqual and Result;
  Result := TestNotEqual and Result;
  Result := TestAtSign and Result;
  Result := TestCaret and Result;
  Result := TestCloseBracket and Result;
  Result := TestCloseParenthesis and Result;
  Result := TestColon and Result;
  Result := TestComma and Result;
  Result := TestDivideBySign and Result;
  Result := TestDot and Result;
  Result := TestDotDot and Result;
  Result := TestMinusSign and Result;
  Result := TestOpenBracket and Result;
  Result := TestOpenParenthesis and Result;
  Result := TestPlusSign and Result;
  Result := TestSemicolon and Result;
  Result := TestTimesSign and Result;
end;

end.

