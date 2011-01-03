unit UTestLexScanner;

interface

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

  public
    class function Test: Boolean;
  end;

implementation

uses
  ULexScanner, UToken, UTokenType;

{ TTestLexScanner }

class function TTestLexScanner.TestBlankSource: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('', '');

  AToken := ALexScanner.NextToken;
  Result := AToken = nil;
end;

class function TTestLexScanner.TestOnlyWhitespace: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('  ' + #13#10 + '  ', '');

  AToken := ALexScanner.NextToken;
  Result := AToken = nil;
end;

class function TTestLexScanner.TestLeadingWhitespaceIsIgnored: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('  ' + #13#10 + '  *', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTTimesSign) and
    (AToken.Text = '*');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTwoTimesSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('**', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTTimesSign) and
    (AToken.Text = '*');

  AToken := ALexScanner.NextToken;
  Result := Result and
    (AToken <> nil) and
    (AToken.TokenType = TTTimesSign) and
    (AToken.Text = '*');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSingleLineCommentAtEof: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('// Foo', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTSingleLineComment) and
    (AToken.Text = '// Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSingleLineCommentFollowedByCrlf: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('// Foo' + #13#10, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTSingleLineComment) and
    (AToken.Text = '// Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSingleLineCommentFollowedByLf: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('// Foo' + #10, '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTSingleLineComment) and
    (AToken.Text = '// Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTwoSingleLineComments: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('// Foo' + #13#10 + '// Bar', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTSingleLineComment) and
    (AToken.Text = '// Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and
    (AToken <> nil) and
    (AToken.TokenType = TTSingleLineComment) and
    (AToken.Text = '// Bar');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCurlyBraceComment: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('{ Foo }', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCurlyBraceComment) and
    (AToken.Text = '{ Foo }');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCurlyBraceCommentWithEmbeddedNewline:
  Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('{ Foo' + #13#10 + '  Bar }', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCurlyBraceComment) and
    (AToken.Text = '{ Foo' + #13#10 + '  Bar }');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTwoCurlyBraceComments: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('{Foo}{Bar}', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCurlyBraceComment) and
    (AToken.Text = '{Foo}');

  AToken := ALexScanner.NextToken;
  Result := Result and
    (AToken <> nil) and
    (AToken.TokenType = TTCurlyBraceComment) and
    (AToken.Text = '{Bar}');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestParenStarComment: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(* Foo *)', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTParenStarComment) and
    (AToken.Text = '(* Foo *)');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestParenStarCommentWithEmbeddedNewline:
  Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(* Foo' + #13#10 + '   Bar *)', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTParenStarComment) and
    (AToken.Text = '(* Foo' + #13#10 + '   Bar *)');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTwoParenStarComments: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(*Foo*)(*Bar*)', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTParenStarComment) and
    (AToken.Text = '(*Foo*)');

  AToken := ALexScanner.NextToken;
  Result := Result and
    (AToken <> nil) and
    (AToken.TokenType = TTParenStarComment) and
    (AToken.Text = '(*Bar*)');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCurlyBraceCompilerDirective: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('{$DEFINE FOO}', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCompilerDirective) and
    (AToken.Text = '{$DEFINE FOO}') and
    (AToken.ParsedText = 'DEFINE FOO');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCurlyBraceCompilerDirectiveTrimsTrailing:
  Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('{$DEFINE FOO }', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCompilerDirective) and
    (AToken.Text = '{$DEFINE FOO }') and
    (AToken.ParsedText = 'DEFINE FOO');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestParenStarCompilerDirective: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(*$DEFINE FOO*)', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCompilerDirective) and
    (AToken.Text = '(*$DEFINE FOO*)') and
    (AToken.ParsedText = 'DEFINE FOO');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestParenStarCompilerDirectiveTrimsTrailing:
  Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(*$DEFINE FOO *)', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTCompilerDirective) and
    (AToken.Text = '(*$DEFINE FOO *)') and
    (AToken.ParsedText = 'DEFINE FOO');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDigit: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('0', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '0');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInteger: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFloat: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42.42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42.42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFloatWithNoDigitsAfterDecimalPoint: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42.', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42.');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestScientificNotation: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42e42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42e42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestScientificNotationWithCapitalLetter:
  Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42E42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42E42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNegativeExponent: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42e-42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42e-42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestExplicitlyPositiveExponent: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('42e+42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42e+42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function
  TTestLexScanner.TestExplicitlyPositiveNumberLexesAsUnaryOperator: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('+42', '');
  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTPlusSign) and
    (AToken.Text = '+');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNegativeNumberLexesAsUnaryOperator: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('-42', '');
  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTMinusSign) and
    (AToken.Text = '-');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestHex: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('$2A', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTNumber) and
    (AToken.Text = '$2A');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestEmptyString: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('''''', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '''''');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSimpleString: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(''' abc ''', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = ''' abc ''');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestStringWithEmbeddedApostrophe: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('''Bob''''s''', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '''Bob''''s''');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCharacter: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('#32', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '#32');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestHexCharacter: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('#$1A', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '#$1A');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestMixed: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('''Foo''#13#10''Bar''', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '''Foo''#13#10''Bar''');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDoubleQuotedCharacter: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  // This is valid only in asm blocks, but valid nonetheless.
  ALexScanner := TLexScanner.Create('"''"', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and
    (AToken.TokenType = TTStringLiteral) and
    (AToken.Text = '"''"');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestIdentifier: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('Foo', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = 'Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLeadingUnderscore: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('_Foo', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = '_Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestEmbeddedUnderscore: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('Foo_Bar', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = 'Foo_Bar');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestEmbeddedDigits: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('Foo42', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = 'Foo42');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAmpersandIdentifier: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('&Foo', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = '&Foo');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAmpersandSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('&Absolute', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = '&Absolute');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAmpersandKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('&And', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIdentifier) and
    (AToken.Text = '&And');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSemikeywordsAreCaseInsensitive: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('Absolute', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAbsoluteSemikeyword) and
    (AToken.Text = 'Absolute');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAbsoluteSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('absolute', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAbsoluteSemikeyword) and
    (AToken.Text = 'absolute');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAbstractSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('abstract', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAbstractSemikeyword) and
    (AToken.Text = 'abstract');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAssemblerSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('assembler', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAssemblerSemikeyword) and
    (AToken.Text = 'assembler');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAssemblySemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('assembly', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAssemblySemikeyword) and
    (AToken.Text = 'assembly');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAtSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('at', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAtSemikeyword) and
    (AToken.Text = 'at');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAutomatedSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('automated', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAutomatedSemikeyword) and
    (AToken.Text = 'automated');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCdeclSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('cdecl', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTCdeclSemikeyword) and
    (AToken.Text = 'cdecl');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestContainsSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('contains', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTContainsSemikeyword) and
    (AToken.Text = 'contains');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDefaultSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('default', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDefaultSemikeyword) and
    (AToken.Text = 'default');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDeprecatedSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('deprecated', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDeprecatedSemikeyword)
    and (AToken.Text = 'deprecated');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDispIdSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('dispid', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDispIdSemikeyword) and
    (AToken.Text = 'dispid');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDynamicSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('dynamic', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDynamicSemikeyword) and
    (AToken.Text = 'dynamic');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestExportSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('export', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTExportSemikeyword) and
    (AToken.Text = 'export');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestExternalSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('external', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTExternalSemikeyword) and
    (AToken.Text = 'external');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFarSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('far', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFarSemikeyword) and
    (AToken.Text = 'far');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFinalSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('final', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFinalSemikeyword) and
    (AToken.Text = 'final');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestForwardSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('forward', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTForwardSemikeyword) and
    (AToken.Text = 'forward');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestHelperSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('helper', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTHelperSemikeyword) and
    (AToken.Text = 'helper');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestImplementsSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('implements', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTImplementsSemikeyword)
    and (AToken.Text = 'implements');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestIndexSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('index', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIndexSemikeyword) and
    (AToken.Text = 'index');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLocalSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('local', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTLocalSemikeyword) and
    (AToken.Text = 'local');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestMessageSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('message', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTMessageSemikeyword) and
    (AToken.Text = 'message');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNameSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('name', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNameSemikeyword) and
    (AToken.Text = 'name');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNearSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('near', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNearSemikeyword) and
    (AToken.Text = 'near');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNoDefaultSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('nodefault', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNoDefaultSemikeyword) and
    (AToken.Text = 'nodefault');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOnSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('on', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOnSemikeyword) and
    (AToken.Text = 'on');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOperatorSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('operator', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOperatorSemikeyword) and
    (AToken.Text = 'operator');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOutSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('out', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOutSemikeyword) and
    (AToken.Text = 'out');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOverloadSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('overload', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOverloadSemikeyword) and
    (AToken.Text = 'overload');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOverrideSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('override', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOverrideSemikeyword) and
    (AToken.Text = 'override');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPackageSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('package', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPackageSemikeyword) and
    (AToken.Text = 'package');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPascalSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('pascal', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPascalSemikeyword) and
    (AToken.Text = 'pascal');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPlatformSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('platform', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPlatformSemikeyword) and
    (AToken.Text = 'platform');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPrivateSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('private', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPrivateSemikeyword) and
    (AToken.Text = 'private');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestProtectedSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('protected', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTProtectedSemikeyword) and
    (AToken.Text = 'protected');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPublicSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('public', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPublicSemikeyword) and
    (AToken.Text = 'public');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPublishedSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('published', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPublishedSemikeyword) and
    (AToken.Text = 'published');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestReadSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('read', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTReadSemikeyword) and
    (AToken.Text = 'read');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestReadOnlySemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('readonly', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTReadOnlySemikeyword) and
    (AToken.Text = 'readonly');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestRegisterSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('register', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTRegisterSemikeyword) and
    (AToken.Text = 'register');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestReintroduceSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('reintroduce', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTReintroduceSemikeyword)
    and (AToken.Text = 'reintroduce');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestRequiresSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('requires', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTRequiresSemikeyword) and
    (AToken.Text = 'requires');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestResidentSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('resident', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTResidentSemikeyword) and
    (AToken.Text = 'resident');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSafecallSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('safecall', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTSafecallSemikeyword) and
    (AToken.Text = 'safecall');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSealedSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('sealed', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTSealedSemikeyword) and
    (AToken.Text = 'sealed');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestStdcallSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('stdcall', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTStdcallSemikeyword) and
    (AToken.Text = 'stdcall');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestStoredSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('stored', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTStoredSemikeyword) and
    (AToken.Text = 'stored');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestStrictSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('strict', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTStrictSemikeyword) and
    (AToken.Text = 'strict');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestVarArgsSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('varargs', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTVarArgsSemikeyword) and
    (AToken.Text = 'varargs');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestVirtualSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('virtual', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTVirtualSemikeyword) and
    (AToken.Text = 'virtual');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestWriteSemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('write', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTWriteSemikeyword) and
    (AToken.Text = 'write');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestWriteOnlySemikeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('writeonly', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTWriteOnlySemikeyword) and
    (AToken.Text = 'writeonly');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestKeywordsAreCaseInsensitive: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('And', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAndKeyword) and
    (AToken.Text = 'And');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAndKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('and', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAndKeyword) and
    (AToken.Text = 'and');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestArrayKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('array', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTArrayKeyword) and
    (AToken.Text = 'array');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAsKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('as', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAsKeyword) and
    (AToken.Text = 'as');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAsmKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('asm', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAsmKeyword) and
    (AToken.Text = 'asm');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestbeginKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('begin', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTbeginKeyword) and
    (AToken.Text = 'begin');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCaseKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('case', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTCaseKeyword) and
    (AToken.Text = 'case');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestClassKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('class', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTClassKeyword) and
    (AToken.Text = 'class');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestConstKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('const', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTConstKeyword) and
    (AToken.Text = 'const');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestConstructorKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('constructor', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTConstructorKeyword) and
    (AToken.Text = 'constructor');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDestructorKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('destructor', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDestructorKeyword) and
    (AToken.Text = 'destructor');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDispInterfaceKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('dispinterface', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDispInterfaceKeyword) and
    (AToken.Text = 'dispinterface');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDivKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('div', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDivKeyword) and
    (AToken.Text = 'div');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDoKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('do', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDoKeyword) and
    (AToken.Text = 'do');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDownToKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('downto', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDownToKeyword) and
    (AToken.Text = 'downto');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestElseKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('else', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTElseKeyword) and
    (AToken.Text = 'else');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestEndKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('end', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTEndKeyword) and
    (AToken.Text = 'end');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestExceptKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('except', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTExceptKeyword) and
    (AToken.Text = 'except');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestExportsKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('exports', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTExportsKeyword) and
    (AToken.Text = 'exports');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFileKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('file', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFileKeyword) and
    (AToken.Text = 'file');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFinalizationKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('finalization', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFinalizationKeyword) and
    (AToken.Text = 'finalization');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFinallyKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('finally', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFinallyKeyword) and
    (AToken.Text = 'finally');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestForKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('for', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTForKeyword) and
    (AToken.Text = 'for');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestFunctionKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('function', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTFunctionKeyword) and
    (AToken.Text = 'function');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestGotoKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('goto', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTGotoKeyword) and
    (AToken.Text = 'goto');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestIfKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('if', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIfKeyword) and
    (AToken.Text = 'if');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestImplementationKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('implementation', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTImplementationKeyword)
    and (AToken.Text = 'implementation');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('in', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTInKeyword) and
    (AToken.Text = 'in');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInheritedKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('inherited', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTInheritedKeyword) and
    (AToken.Text = 'inherited');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInitializationKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('initialization', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTInitializationKeyword)
    and (AToken.Text = 'initialization');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInlineKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('inline', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTInlineKeyword) and
    (AToken.Text = 'inline');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestInterfaceKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('interface', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTInterfaceKeyword) and
    (AToken.Text = 'interface');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestIsKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('is', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTIsKeyword) and
    (AToken.Text = 'is');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLabelKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('label', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTLabelKeyword) and
    (AToken.Text = 'label');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLibraryKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('library', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTLibraryKeyword) and
    (AToken.Text = 'library');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestModKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('mod', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTModKeyword) and
    (AToken.Text = 'mod');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNilKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('nil', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNilKeyword) and
    (AToken.Text = 'nil');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNotKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('not', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNotKeyword) and
    (AToken.Text = 'not');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestObjectKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('object', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTObjectKeyword) and
    (AToken.Text = 'object');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOfKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('of', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOfKeyword) and
    (AToken.Text = 'of');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOrKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('or', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOrKeyword) and
    (AToken.Text = 'or');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPackedKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('packed', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPackedKeyword) and
    (AToken.Text = 'packed');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestProcedureKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('procedure', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTProcedureKeyword) and
    (AToken.Text = 'procedure');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestProgramKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('program', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTProgramKeyword) and
    (AToken.Text = 'program');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPropertyKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('property', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPropertyKeyword) and
    (AToken.Text = 'property');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestRaiseKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('raise', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTRaiseKeyword) and
    (AToken.Text = 'raise');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestRecordKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('record', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTRecordKeyword) and
    (AToken.Text = 'record');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestRepeatKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('repeat', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTRepeatKeyword) and
    (AToken.Text = 'repeat');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestResourceStringKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('resourcestring', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTResourceStringKeyword)
    and (AToken.Text = 'resourcestring');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSetKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('set', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTSetKeyword) and
    (AToken.Text = 'set');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestShlKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('shl', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTShlKeyword) and
    (AToken.Text = 'shl');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestShrKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('shr', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTShrKeyword) and
    (AToken.Text = 'shr');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestStringKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('string', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTStringKeyword) and
    (AToken.Text = 'string');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestThenKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('then', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTThenKeyword) and
    (AToken.Text = 'then');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestThreadVarKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('threadvar', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTThreadVarKeyword) and
    (AToken.Text = 'threadvar');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestToKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('to', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTToKeyword) and
    (AToken.Text = 'to');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTryKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('try', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTTryKeyword) and
    (AToken.Text = 'try');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTypeKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('type', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTTypeKeyword) and
    (AToken.Text = 'type');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestUnitKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('unit', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTUnitKeyword) and
    (AToken.Text = 'unit');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestUntilKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('until', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTUntilKeyword) and
    (AToken.Text = 'until');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestUsesKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('uses', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTUsesKeyword) and
    (AToken.Text = 'uses');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestVarKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('var', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTVarKeyword) and
    (AToken.Text = 'var');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestWhileKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('while', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTWhileKeyword) and
    (AToken.Text = 'while');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestWithKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('with', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTWithKeyword) and
    (AToken.Text = 'with');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestXorKeyword: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('xor', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTXorKeyword) and
    (AToken.Text = 'xor');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestColonEquals: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(':=', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTColonEquals) and
    (AToken.Text = ':=');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestEqualSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('=', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTEqualSign) and
    (AToken.Text = '=');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestGreaterThan: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('>', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTGreaterThan) and
    (AToken.Text = '>');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLessThan: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('<', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTLessThan) and
    (AToken.Text = '<');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestLessOrEqual: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('<=', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTLessOrEqual) and
    (AToken.Text = '<=');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestGreaterOrEqual: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('>=', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTGreaterOrEqual) and
    (AToken.Text = '>=');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestNotEqual: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('<>', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTNotEqual) and
    (AToken.Text = '<>');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestAtSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('@', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTAtSign) and
    (AToken.Text = '@');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCaret: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('^', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTCaret) and
    (AToken.Text = '^');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCloseBracket: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(']', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTCloseBracket) and
    (AToken.Text = ']');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestCloseParenthesis: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(')', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTCloseParenthesis) and
    (AToken.Text = ')');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestColon: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(':', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTColon) and
    (AToken.Text = ':');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestComma: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(',', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTComma) and
    (AToken.Text = ',');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDivideBySign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('/', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDivideBySign) and
    (AToken.Text = '/');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDot: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('.', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDot) and
    (AToken.Text = '.');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestDotDot: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('..', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTDotDot) and
    (AToken.Text = '..');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestMinusSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('-', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTMinusSign) and
    (AToken.Text = '-');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOpenBracket: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('[', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOpenBracket) and
    (AToken.Text = '[');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestOpenParenthesis: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('(', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTOpenParenthesis) and
    (AToken.Text = '(');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestPlusSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('+', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTPlusSign) and
    (AToken.Text = '+');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestSemicolon: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create(';', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTSemicolon) and
    (AToken.Text = ';');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.TestTimesSign: Boolean;
var
  ALexScanner: TLexScanner;
  AToken: TToken;
begin
  ALexScanner := TLexScanner.Create('*', '');

  AToken := ALexScanner.NextToken;
  Result := (AToken <> nil) and (AToken.TokenType = TTTimesSign) and
    (AToken.Text = '*');

  AToken := ALexScanner.NextToken;
  Result := Result and (AToken = nil);
end;

class function TTestLexScanner.Test: Boolean;
begin
  Result := TestBlankSource;
  Result := Result and TestOnlyWhitespace;
  Result := Result and TestTwoTimesSign;
  Result := Result and TestLeadingWhitespaceIsIgnored;
  Result := Result and TestSingleLineCommentAtEof;
  Result := Result and TestSingleLineCommentFollowedByCrlf;
  Result := Result and TestSingleLineCommentFollowedByLf;
  Result := Result and TestTwoSingleLineComments;
  Result := Result and TestCurlyBraceComment;
  Result := Result and TestCurlyBraceCommentWithEmbeddedNewline;
  Result := Result and TestTwoCurlyBraceComments;
  Result := Result and TestParenStarComment;
  Result := Result and TestParenStarCommentWithEmbeddedNewline;
  Result := Result and TestTwoParenStarComments;
  Result := Result and TestCurlyBraceCompilerDirective;
  Result := Result and TestCurlyBraceCompilerDirectiveTrimsTrailing;
  Result := Result and TestParenStarCompilerDirective;
  Result := Result and TestParenStarCompilerDirectiveTrimsTrailing;
  Result := Result and TestDigit;
  Result := Result and TestInteger;
  Result := Result and TestFloat;
  Result := Result and TestFloatWithNoDigitsAfterDecimalPoint;
  Result := Result and TestScientificNotation;
  Result := Result and TestScientificNotationWithCapitalLetter;
  Result := Result and TestNegativeExponent;
  Result := Result and TestExplicitlyPositiveExponent;
  Result := Result and TestExplicitlyPositiveNumberLexesAsUnaryOperator;
  Result := Result and TestNegativeNumberLexesAsUnaryOperator;
  Result := Result and TestHex;
  Result := Result and TestEmptyString;
  Result := Result and TestSimpleString;
  Result := Result and TestStringWithEmbeddedApostrophe;
  Result := Result and TestCharacter;
  Result := Result and TestHexCharacter;
  Result := Result and TestMixed;
  Result := Result and TestDoubleQuotedCharacter;
  Result := Result and TestIdentifier;
  Result := Result and TestLeadingUnderscore;
  Result := Result and TestEmbeddedUnderscore;
  Result := Result and TestEmbeddedDigits;
  Result := Result and TestAmpersandIdentifier;
  Result := Result and TestAmpersandSemikeyword;
  Result := Result and TestAmpersandKeyword;
  Result := Result and TestSemikeywordsAreCaseInsensitive;
  Result := Result and TestAbsoluteSemikeyword;
  Result := Result and TestAbstractSemikeyword;
  Result := Result and TestAssemblerSemikeyword;
  Result := Result and TestAssemblySemikeyword;
  Result := Result and TestAtSemikeyword;
  Result := Result and TestAutomatedSemikeyword;
  Result := Result and TestCdeclSemikeyword;
  Result := Result and TestContainsSemikeyword;
  Result := Result and TestDefaultSemikeyword;
  Result := Result and TestDeprecatedSemikeyword;
  Result := Result and TestDispIdSemikeyword;
  Result := Result and TestDynamicSemikeyword;
  Result := Result and TestExportSemikeyword;
  Result := Result and TestExternalSemikeyword;
  Result := Result and TestFarSemikeyword;
  Result := Result and TestFinalSemikeyword;
  Result := Result and TestForwardSemikeyword;
  Result := Result and TestHelperSemikeyword;
  Result := Result and TestImplementsSemikeyword;
  Result := Result and TestIndexSemikeyword;
  Result := Result and TestLocalSemikeyword;
  Result := Result and TestMessageSemikeyword;
  Result := Result and TestNameSemikeyword;
  Result := Result and TestNearSemikeyword;
  Result := Result and TestNoDefaultSemikeyword;
  Result := Result and TestOnSemikeyword;
  Result := Result and TestOperatorSemikeyword;
  Result := Result and TestOutSemikeyword;
  Result := Result and TestOverloadSemikeyword;
  Result := Result and TestOverrideSemikeyword;
  Result := Result and TestPackageSemikeyword;
  Result := Result and TestPascalSemikeyword;
  Result := Result and TestPlatformSemikeyword;
  Result := Result and TestPrivateSemikeyword;
  Result := Result and TestProtectedSemikeyword;
  Result := Result and TestPublicSemikeyword;
  Result := Result and TestPublishedSemikeyword;
  Result := Result and TestReadSemikeyword;
  Result := Result and TestReadOnlySemikeyword;
  Result := Result and TestRegisterSemikeyword;
  Result := Result and TestReintroduceSemikeyword;
  Result := Result and TestRequiresSemikeyword;
  Result := Result and TestResidentSemikeyword;
  Result := Result and TestSafecallSemikeyword;
  Result := Result and TestSealedSemikeyword;
  Result := Result and TestStdcallSemikeyword;
  Result := Result and TestStoredSemikeyword;
  Result := Result and TestStrictSemikeyword;
  Result := Result and TestVarArgsSemikeyword;
  Result := Result and TestVirtualSemikeyword;
  Result := Result and TestWriteSemikeyword;
  Result := Result and TestWriteOnlySemikeyword;
  Result := Result and TestKeywordsAreCaseInsensitive;
  Result := Result and TestAndKeyword;
  Result := Result and TestArrayKeyword;
  Result := Result and TestAsKeyword;
  Result := Result and TestAsmKeyword;
  Result := Result and TestBeginKeyword;
  Result := Result and TestCaseKeyword;
  Result := Result and TestClassKeyword;
  Result := Result and TestConstKeyword;
  Result := Result and TestConstructorKeyword;
  Result := Result and TestDestructorKeyword;
  Result := Result and TestDispInterfaceKeyword;
  Result := Result and TestDivKeyword;
  Result := Result and TestDoKeyword;
  Result := Result and TestDownToKeyword;
  Result := Result and TestElseKeyword;
  Result := Result and TestEndKeyword;
  Result := Result and TestExceptKeyword;
  Result := Result and TestExportsKeyword;
  Result := Result and TestFileKeyword;
  Result := Result and TestFinalizationKeyword;
  Result := Result and TestFinallyKeyword;
  Result := Result and TestForKeyword;
  Result := Result and TestFunctionKeyword;
  Result := Result and TestGotoKeyword;
  Result := Result and TestIfKeyword;
  Result := Result and TestImplementationKeyword;
  Result := Result and TestInKeyword;
  Result := Result and TestInheritedKeyword;
  Result := Result and TestInitializationKeyword;
  Result := Result and TestInlineKeyword;
  Result := Result and TestInterfaceKeyword;
  Result := Result and TestIsKeyword;
  Result := Result and TestLabelKeyword;
  Result := Result and TestLibraryKeyword;
  Result := Result and TestModKeyword;
  Result := Result and TestNilKeyword;
  Result := Result and TestNotKeyword;
  Result := Result and TestObjectKeyword;
  Result := Result and TestOfKeyword;
  Result := Result and TestOrKeyword;
  Result := Result and TestPackedKeyword;
  Result := Result and TestProcedureKeyword;
  Result := Result and TestProgramKeyword;
  Result := Result and TestPropertyKeyword;
  Result := Result and TestRaiseKeyword;
  Result := Result and TestRecordKeyword;
  Result := Result and TestRepeatKeyword;
  Result := Result and TestResourceStringKeyword;
  Result := Result and TestSetKeyword;
  Result := Result and TestShlKeyword;
  Result := Result and TestShrKeyword;
  Result := Result and TestStringKeyword;
  Result := Result and TestThenKeyword;
  Result := Result and TestThreadVarKeyword;
  Result := Result and TestToKeyword;
  Result := Result and TestTryKeyword;
  Result := Result and TestTypeKeyword;
  Result := Result and TestUnitKeyword;
  Result := Result and TestUntilKeyword;
  Result := Result and TestUsesKeyword;
  Result := Result and TestVarKeyword;
  Result := Result and TestWhileKeyword;
  Result := Result and TestWithKeyword;
  Result := Result and TestXorKeyword;
  Result := Result and TestColonEquals;
  Result := Result and TestEqualSign;
  Result := Result and TestGreaterThan;
  Result := Result and TestLessThan;
  Result := Result and TestLessOrEqual;
  Result := Result and TestGreaterOrEqual;
  Result := Result and TestNotEqual;
  Result := Result and TestAtSign;
  Result := Result and TestCaret;
  Result := Result and TestCloseBracket;
  Result := Result and TestCloseParenthesis;
  Result := Result and TestColon;
  Result := Result and TestComma;
  Result := Result and TestDivideBySign;
  Result := Result and TestDot;
  Result := Result and TestDotDot;
  Result := Result and TestMinusSign;
  Result := Result and TestOpenBracket;
  Result := Result and TestOpenParenthesis;
  Result := Result and TestPlusSign;
  Result := Result and TestSemicolon;
  Result := Result and TestTimesSign;
end;

end.

