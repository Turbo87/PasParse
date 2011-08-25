unit UTokenFilter;

interface

uses
  Generics.Collections, UCompilerDefines, UIFileLoader, UToken, ULocation, Contnrs;

type
  TDirectiveType = (
    DTUnrecognized,
    DTIgnored,
    DTPossibleInclude,
    DTInclude,
    DTDefine,
    DTUndefine,
    DTIf,
    DTElse,
    DTElseIf,
    DTEndIf
  );

  TIfDefTruth = (
    IDTForeverFalse,
    IDTInitiallyFalse,
    IDTTrue
  );

  TTokenFilter = class
  private
    FTokens: TObjectList<TToken>;
    FCompilerDefines: TCompilerDefines;
    FFileLoader: IFileLoader;
    FDirectiveTypes: TDictionary<string, TDirectiveType>;

    function Filter(AIfDefStack: TStack<TIfDefTruth>; ATokens: TObjectList<TToken>): TObjectList<TToken>;
    function GetTokens: TObjectList<TToken>;

    function FirstWordOf(AString: string): string;
    function GetDirectiveType(AFirstWord: string): TDirectiveType;
    procedure HandleCompilerDirective(AIfDefStack: TStack<TIfDefTruth>; AToken: TToken; ATokens: TObjectList<TToken>);
    procedure HandleIf(AIfDefStack: TStack<TIfDefTruth>; ADirective: string; ALocation: TLocation);
    procedure HandleElseIf(AIfDefStack: TStack<TIfDefTruth>; ADirective: string; ALocation: TLocation);
    procedure HandleElse(AIfDefStack: TStack<TIfDefTruth>);
    procedure HandleInclude(AIfDefStack: TStack<TIfDefTruth>; ATokens: TObjectList<TToken>; ADirectory, AFileName: string);

  public
    constructor Create(ATokens: TObjectList<TToken>; ACompilerDefines: TCompilerDefines;
      AFileLoader: IFileLoader);
    destructor Destroy; override;

    property Tokens: TObjectList<TToken> read GetTokens;
  end;

implementation

uses
  UTokenType, ULexException, ULexScanner, SysUtils;

{ TTokenFilter }

constructor TTokenFilter.Create(ATokens: TObjectList<TToken>;
  ACompilerDefines: TCompilerDefines; AFileLoader: IFileLoader);
begin
  inherited Create;
  FTokens := ATokens;
  FCompilerDefines := ACompilerDefines;
  FFileLoader := AFileLoader;

  FDirectiveTypes := TDictionary<string, TDirectiveType>.Create;
  FDirectiveTypes.AddOrSetValue('IF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFDEF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFNDEF', DTIf);
  FDirectiveTypes.AddOrSetValue('IFOPT', DTIf);
  FDirectiveTypes.AddOrSetValue('IFNOPT', DTIf);
  FDirectiveTypes.AddOrSetValue('ELSE', DTElse);
  FDirectiveTypes.AddOrSetValue('ELSEIF', DTElseIf);
  FDirectiveTypes.AddOrSetValue('ENDIF', DTEndIf);
  FDirectiveTypes.AddOrSetValue('IFEND', DTEndIf);
  // Delphi compiler directives
  FDirectiveTypes.AddOrSetValue('ALIGN', DTIgnored);
  FDirectiveTypes.AddOrSetValue('APPTYPE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('ASSERTIONS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('AUTOBOX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('BOOLEVAL', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DEBUGINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DEFINE', DTDefine);
  FDirectiveTypes.AddOrSetValue('DEFINITIONINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DENYPACKAGEUNIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DESCRIPTION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('DESIGNONLY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('ENDREGION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXTENDEDSYNTAX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('EXTENSION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('FINITEFLOAT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('HINTS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('I', DTPossibleInclude);
  FDirectiveTypes.AddOrSetValue('IMAGEBASE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('IMPLICITBUILD', DTIgnored);
  FDirectiveTypes.AddOrSetValue('IMPORTEDDATA', DTIgnored);
  FDirectiveTypes.AddOrSetValue('INCLUDE', DTInclude);
  FDirectiveTypes.AddOrSetValue('INLINE', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('IOCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBPREFIX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBSUFFIX', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LIBVERSION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LINK', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LOCALSYMBOLS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('LONGSTRINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MAXSTACKSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MESSAGE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('METHODINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MINENUMSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('MINSTACKSIZE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OBJEXPORTALL', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OPENSTRINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OPTIMIZATION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('OVERFLOWCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RANGECHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REALCOMPATIBILITY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REFERENCEINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('REGION', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RESOURCE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RESOURCERESERVE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('RUNONLY', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SAFEDIVIDE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SETPEFLAGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('SOPREFIX', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('SOSUFFIX', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('SOVERSION', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('STACKCHECKS', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('STACKFRAMES', DTIgnored);
  FDirectiveTypes.AddOrSetValue('TYPEDADDRESS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('TYPEINFO', DTIgnored);
  FDirectiveTypes.AddOrSetValue('UNDEF', DTUndefine);
  FDirectiveTypes.AddOrSetValue('UNSAFECODE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('VARPROPSETTER', DTIgnored); // undocumented
  FDirectiveTypes.AddOrSetValue('VARSTRINGCHECKS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WARN', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WARNINGS', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WEAKPACKAGEUNIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('WRITEABLECONST', DTIgnored);
  // Directives for generation of C++Builder .hpp files
  FDirectiveTypes.AddOrSetValue('EXTERNALSYM', DTIgnored);
  FDirectiveTypes.AddOrSetValue('HPPEMIT', DTIgnored);
  FDirectiveTypes.AddOrSetValue('NODEFINE', DTIgnored);
  FDirectiveTypes.AddOrSetValue('NOINCLUDE', DTIgnored);
end;

destructor TTokenFilter.Destroy;
begin
  FDirectiveTypes.Free;
  inherited;
end;

function TTokenFilter.Filter(AIfDefStack: TStack<TIfDefTruth>; ATokens: TObjectList<TToken>): TObjectList<TToken>;
var
  AToken: TToken;
  I: Integer;
begin
  Result := TObjectList<TToken>.Create;

  try
    I := 0;
    while I < ATokens.Count do
    begin
      AToken := ATokens[I];
      case AToken.TokenType of
        TTSingleLineComment,
        TTCurlyBraceComment,
        TTParenStarComment:
          ; // Do nothing

        TTCompilerDirective:
          HandleCompilerDirective(AIfDefStack, AToken, Result);

        else
          if AIfDefStack.Peek() = IDTTrue then
            Result.Add(AToken.Clone as TToken);
      end;
      Inc(I);
    end;
  except
    Result.Free;
    raise
  end;
end;

function TTokenFilter.FirstWordOf(AString: string): string;
var
  AChar: Char;
begin
  Result := '';
  for AChar in AString do
  begin
    if ((AChar <= 'Z') and (AChar >= 'A')) or
       ((AChar <= 'z') and (AChar >= 'a')) then
      Result := Result + AChar
    else
      Break;
  end;   
end;

function TTokenFilter.GetDirectiveType(AFirstWord: string): TDirectiveType;
begin
  if FDirectiveTypes.ContainsKey(AFirstWord) then
    Result := FDirectiveTypes[AFirstWord]
  else if Length(AFirstWord) = 1 then
    Result := DTIgnored
  else
    Result := DTUnrecognized;
end;

function TTokenFilter.GetTokens: TObjectList<TToken>;
var
  AIfDefStack: TStack<TIfDefTruth>;
begin
  AIfDefStack := TStack<TIfDefTruth>.Create;
  AIfDefStack.Push(IDTTrue);
  try
    Result := Filter(AIfDefStack, FTokens);
  finally
    AIfDefStack.Free;
  end;
end;

procedure TTokenFilter.HandleCompilerDirective(AIfDefStack: TStack<TIfDefTruth>;
  AToken: TToken; ATokens: TObjectList<TToken>);
var
  ADirective, AFirstWord, AParameter: string;
begin
  ADirective := AToken.ParsedText;
  AFirstWord := FirstWordOf(ADirective);
  AParameter := Trim(Copy(ADirective, Length(AFirstWord) + 1,
    Length(ADirective) - Length(AFirstWord)));

  case GetDirectiveType(AFirstWord) of
    DTUnrecognized:
      if AIfDefStack.Peek() = IDTTrue then
        raise ELexException.Create('Unrecognized compiler directive ''' +
          AFirstWord + '''', AToken.Location.Clone);

    DTInclude, DTPossibleInclude:
    begin
      if (GetDirectiveType(AFirstWord) = DTInclude) or
        ((AParameter[1] <> '+') and (AParameter[1] <> '-')) then
      begin
        HandleInclude(AIfDefStack, ATokens, AToken.Location.Directory, AParameter);
      end;
    end;

    DTDefine:
      if AIfDefStack.Peek() = IDTTrue then
        FCompilerDefines.DefineSymbol(AParameter);

    DTUndefine:
      if AIfDefStack.Peek() = IDTTrue then
        FCompilerDefines.UndefineSymbol(AParameter);

    DTIf:
      HandleIf(AIfDefStack, ADirective, AToken.Location);

    DTElseIf:
      HandleElseIf(AIfDefStack, ADirective, AToken.Location);

    DTElse:
      HandleElse(AIfDefStack);

    DTEndIf:
      AIfDefStack.Pop();
  end;
end;

procedure TTokenFilter.HandleElse(AIfDefStack: TStack<TIfDefTruth>);
var
  ATruth: TIfDefTruth;
begin
  ATruth := AIfDefStack.Pop();
  if ATruth = IDTInitiallyFalse then
    AIfDefStack.Push(IDTTrue)
  else
    AIfDefStack.Push(IDTForeverFalse);
end;

procedure TTokenFilter.HandleElseIf(AIfDefStack: TStack<TIfDefTruth>; ADirective: string;
  ALocation: TLocation);
var
  ATruth: TIfDefTruth;
  ATrimmedDirective: string;
begin
  ATruth := TIfDefTruth(AIfDefStack.Pop);
  if (ATruth = IDTTrue) or (ATruth = IDTForeverFalse) then
    AIfDefStack.Push(IDTForeverFalse)
  else
  begin
    ATrimmedDirective := Copy(ADirective, 5, Length(ADirective) - 4);
    if FCompilerDefines.IsTrue(ATrimmedDirective, ALocation) then
      AIfDefStack.Push(IDTTrue)
    else
      AIfDefStack.Push(IDTInitiallyFalse);
  end;
end;

procedure TTokenFilter.HandleIf(AIfDefStack: TStack<TIfDefTruth>; ADirective: string;
  ALocation: TLocation);
begin
  if AIfDefStack.Peek() = IDTTrue then
  begin
    if FCompilerDefines.IsTrue(ADirective, ALocation) then
      AIfDefStack.Push(IDTTrue)
    else
      AIfDefStack.Push(IDTInitiallyFalse);
  end
  else
    AIfDefStack.Push(IDTForeverFalse);
end;

procedure TTokenFilter.HandleInclude(AIfDefStack: TStack<TIfDefTruth>; ATokens: TObjectList<TToken>;
  ADirectory, AFileName: string);
var
  ASource: string;
  ALexer: TLexScanner;
  ALexTokens, ANewTokens: TObjectList<TToken>;
  I: Integer;
begin
  AFileName := FFileLoader.ExpandFileName(ADirectory, AFileName);
  ASource := FFileLoader.LoadFromParentDirs(AFileName);

  ALexer := TLexScanner.Create(ASource, AFileName);
  try
    ALexTokens := ALexer.Tokens;
    try
      ANewTokens := Filter(AIfDefStack, ALexTokens);

      for I := 0 to ANewTokens.Count - 1 do
        ATokens.Add(ANewTokens[I]);

      ANewTokens.OwnsObjects := False;
      ANewTokens.Free;
    finally
      ALexTokens.Free;
    end;
  finally
    ALexer.Free;
  end;
end;

end.
