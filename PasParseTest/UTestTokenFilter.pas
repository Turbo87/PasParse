unit UTestTokenFilter;

interface

uses
  UTest;

type
  TTestTokenFilter = class(TTest)
  private
    class function LexesAndFiltersAs(ASource: string;
      AExpectedTokens: array of string): Boolean;

  protected
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  ULexScanner, UToken, UTokenFilter, UCompilerDefines, Contnrs;

{ TTestTokenFilter }

class function TTestTokenFilter.GetName: string;
begin
  Result := 'TokenFilter';
end;

class function TTestTokenFilter.LexesAndFiltersAs(ASource: string;
  AExpectedTokens: array of string): Boolean;
var
  ALexScanner: TLexScanner;
  ATokens, AFilteredTokens: TObjectList;
  ACompilerDefines: TCompilerDefines;
  ATokenFilter: TTokenFilter;
  AToken: TToken;
  I: Integer;
begin
  ACompilerDefines := nil;
  ATokenFilter := nil;
  ALexScanner := TLexScanner.Create(ASource, '');
  try
    ATokens := ALexScanner.Tokens;

    ACompilerDefines := TCompilerDefines.Create;
    ACompilerDefines.DefineSymbol('TRUE');
    ACompilerDefines.UndefineSymbol('FALSE');
    ACompilerDefines.DefineDirectiveAsTrue('IF True');
    ACompilerDefines.DefineDirectiveAsFalse('IF False');

    ATokenFilter := TTokenFilter.Create(ATokens, ACompilerDefines, nil);
    AFilteredTokens := ATokenFilter.Tokens;
    ATokens.Free;

    Result := (AFilteredTokens.Count = Length(AExpectedTokens));
    if Result then
    begin
      try
        for I := 0 to AFilteredTokens.Count - 1 do
        begin
          AToken := AFilteredTokens[I] as TToken;
          Result := (AToken <> nil) and (AToken.Inspect = AExpectedTokens[I]);
        end;
      finally
        AFilteredTokens.Free;
      end;
    end;
  finally
    ACompilerDefines.Free;
    ATokenFilter.Free;
    ALexScanner.Free;
  end;
end;

class procedure TTestTokenFilter.TestAll;
begin
  OK('PassThrough', LexesAndFiltersAs('Foo', ['Identifier |Foo|']));
  OK('SingleLineCommentIsIgnored', LexesAndFiltersAs('// Foo', []));
  OK('CurlyBraceCommentIsIgnored', LexesAndFiltersAs('{ Foo }', []));
  OK('ParenStarCommentIsIgnored', LexesAndFiltersAs('(* Foo *)', []));

//  OK('ParserUsesFilter',
//    LexesAndFiltersAs(r = ParserTestCase.CreateParser('// Foo');
//  Assert.That(parser.AtEof, Is.True);
//
//  OK('SingleLetterCompilerDirectivesAreIgnored',
//    LexesAndFiltersAs('{$R+}', []));
//  Assert.That('{$A8}', []));
//
//  OK('CPlusPlusBuilderCompilerDirectivesAreIgnored',
//    LexesAndFiltersAs('{$EXTERNALSYM Foo}', []));
//  Assert.That('{$HPPEMIT '#pragma Foo'}', []));
//  Assert.That('{$NODEFINE Foo}', []));
//  Assert.That('{$NOINCLUDE Foo}', []));
//
  OK('IfDefTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ENDIF}2', [
      'Number |0|',
      'Number |1|',
      'Number |2|']));

  OK('IfDefFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ENDIF}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueTrue',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefTrueFalse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|']));

  OK('IfDefFalseTrue',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseFalse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfDefFalseUnknown',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF UNKNOWN}2{$ENDIF}3{$ENDIF}4', [
      'Number |0|',
      'Number |4|']));

  OK('IfEnd',
    LexesAndFiltersAs('0{$IF False}1{$IFEND}2', [
      'Number |0|',
      'Number |2|']));

  OK('IfDefTrueWithElse',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |1|',
      'Number |3|']));

  OK('IfDefFalseWithElse',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$ELSE}2{$ENDIF}3', [
      'Number |0|',
      'Number |2|',
      'Number |3|']));

  OK('IfDefTrueTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |2|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefTrueFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF TRUE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |1|',
      'Number |3|',
      'Number |4|',
      'Number |6|']));

  OK('IfDefFalseTrueWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF TRUE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfDefFalseFalseWithElses',
    LexesAndFiltersAs('0{$IFDEF FALSE}1{$IFDEF FALSE}2{$ELSE}3{$ENDIF}4{$ELSE}5{$ENDIF}6', [
      'Number |0|',
      'Number |5|',
      'Number |6|']));

  OK('IfTrueElseIfTrue',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfTrueElseIfFalse',
    LexesAndFiltersAs('0{$IF True}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |1|',
      'Number |4|']));

  OK('IfFalseElseIfTrue',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF True}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |2|',
      'Number |4|']));

  OK('IfFalseElseIfFalse',
    LexesAndFiltersAs('0{$IF False}1{$ELSEIF False}2{$ELSE}3{$IFEND}4', [
      'Number |0|',
      'Number |3|',
      'Number |4|']));



//  try
//    LexesAndFiltersAs('''abc', ['StringLiteral |''abc|']);
//    OK(False, 'TestNeverEndingString');
//  except
//    on ETestException do;
//    on ELexException do
//      OK(True, 'TestNeverEndingString');
//  else
//    OK(False, 'TestNeverEndingString');
//  end;
end;

end.

