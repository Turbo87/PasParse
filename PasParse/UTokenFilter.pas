unit UTokenFilter;

interface

uses
  UDictionary, UCompilerDefines, UIFileLoader, UToken, ULocation, Contnrs;

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
    FTokens: TObjectList;
    FCompilerDefines: TCompilerDefines;
    FFileLoader: IFileLoader;
    FDirectiveTypes: TDictionary;

    function Filter(AIfDefStack: TStack; ATokens: TObjectList): TObjectList;
    function GetTokens: TObjectList;

    function FirstWordOf(AString: string): string;
    function GetDirectiveType(AFirstWord: string): TDirectiveType;
    procedure HandleCompilerDirective(AIfDefStack: TStack; AToken: TToken);
    procedure HandleIf(AIfDefStack: TStack; ADirective: string; ALocation: TLocation); 
    procedure HandleElseIf(AIfDefStack: TStack; ADirective: string; ALocation: TLocation);
    procedure HandleElse(AIfDefStack: TStack);

  public
    constructor Create(ATokens: TObjectList; ACompilerDefines: TCompilerDefines;
      AFileLoader: IFileLoader);
    destructor Destroy; override;

    property Tokens: TObjectList read GetTokens;
  end;

implementation

uses
  UTokenType, ULexException, SysUtils;

{ TTokenFilter }

constructor TTokenFilter.Create(ATokens: TObjectList;
  ACompilerDefines: TCompilerDefines; AFileLoader: IFileLoader);
begin
  inherited Create;
  FTokens := ATokens;
  FCompilerDefines := ACompilerDefines;
  FFileLoader := AFileLoader;

  FDirectiveTypes := TDictionary.Create;
  FDirectiveTypes['IF'] := TObject(DTIf);
  FDirectiveTypes['IFDEF'] := TObject(DTIf);
  FDirectiveTypes['IFNDEF'] := TObject(DTIf);
  FDirectiveTypes['IFOPT'] := TObject(DTIf);
  FDirectiveTypes['IFNOPT'] := TObject(DTIf);
  FDirectiveTypes['ELSE'] := TObject(DTElse);
  FDirectiveTypes['ELSEIF'] := TObject(DTElseIf);
  FDirectiveTypes['ENDIF'] := TObject(DTEndIf);
  FDirectiveTypes['IFEND'] := TObject(DTEndIf);
  // Delphi compiler directives
  FDirectiveTypes['ALIGN'] := TObject(DTIgnored);
  FDirectiveTypes['APPTYPE'] := TObject(DTIgnored);
  FDirectiveTypes['ASSERTIONS'] := TObject(DTIgnored);
  FDirectiveTypes['AUTOBOX'] := TObject(DTIgnored);
  FDirectiveTypes['BOOLEVAL'] := TObject(DTIgnored);
  FDirectiveTypes['DEBUGINFO'] := TObject(DTIgnored);
  FDirectiveTypes['DEFINE'] := TObject(DTDefine);
  FDirectiveTypes['DEFINITIONINFO'] := TObject(DTIgnored);
  FDirectiveTypes['DENYPACKAGEUNIT'] := TObject(DTIgnored);
  FDirectiveTypes['DESCRIPTION'] := TObject(DTIgnored);
  FDirectiveTypes['DESIGNONLY'] := TObject(DTIgnored);
  FDirectiveTypes['ENDREGION'] := TObject(DTIgnored);
  FDirectiveTypes['EXTENDEDSYNTAX'] := TObject(DTIgnored);
  FDirectiveTypes['EXTENSION'] := TObject(DTIgnored);
  FDirectiveTypes['FINITEFLOAT'] := TObject(DTIgnored);
  FDirectiveTypes['HINTS'] := TObject(DTIgnored);
  FDirectiveTypes['I'] := TObject(DTPossibleInclude);
  FDirectiveTypes['IMAGEBASE'] := TObject(DTIgnored);
  FDirectiveTypes['IMPLICITBUILD'] := TObject(DTIgnored);
  FDirectiveTypes['IMPORTEDDATA'] := TObject(DTIgnored);
  FDirectiveTypes['INCLUDE'] := TObject(DTInclude);
  FDirectiveTypes['INLINE'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['IOCHECKS'] := TObject(DTIgnored);
  FDirectiveTypes['LIBPREFIX'] := TObject(DTIgnored);
  FDirectiveTypes['LIBSUFFIX'] := TObject(DTIgnored);
  FDirectiveTypes['LIBVERSION'] := TObject(DTIgnored);
  FDirectiveTypes['LINK'] := TObject(DTIgnored);
  FDirectiveTypes['LOCALSYMBOLS'] := TObject(DTIgnored);
  FDirectiveTypes['LONGSTRINGS'] := TObject(DTIgnored);
  FDirectiveTypes['MAXSTACKSIZE'] := TObject(DTIgnored);
  FDirectiveTypes['MESSAGE'] := TObject(DTIgnored);
  FDirectiveTypes['METHODINFO'] := TObject(DTIgnored);
  FDirectiveTypes['MINENUMSIZE'] := TObject(DTIgnored);
  FDirectiveTypes['MINSTACKSIZE'] := TObject(DTIgnored);
  FDirectiveTypes['OBJEXPORTALL'] := TObject(DTIgnored);
  FDirectiveTypes['OPENSTRINGS'] := TObject(DTIgnored);
  FDirectiveTypes['OPTIMIZATION'] := TObject(DTIgnored);
  FDirectiveTypes['OVERFLOWCHECKS'] := TObject(DTIgnored);
  FDirectiveTypes['RANGECHECKS'] := TObject(DTIgnored);
  FDirectiveTypes['REALCOMPATIBILITY'] := TObject(DTIgnored);
  FDirectiveTypes['REFERENCEINFO'] := TObject(DTIgnored);
  FDirectiveTypes['REGION'] := TObject(DTIgnored);
  FDirectiveTypes['RESOURCE'] := TObject(DTIgnored);
  FDirectiveTypes['RESOURCERESERVE'] := TObject(DTIgnored);
  FDirectiveTypes['RUNONLY'] := TObject(DTIgnored);
  FDirectiveTypes['SAFEDIVIDE'] := TObject(DTIgnored);
  FDirectiveTypes['SETPEFLAGS'] := TObject(DTIgnored);
  FDirectiveTypes['SOPREFIX'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['SOSUFFIX'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['SOVERSION'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['STACKCHECKS'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['STACKFRAMES'] := TObject(DTIgnored);
  FDirectiveTypes['TYPEDADDRESS'] := TObject(DTIgnored);
  FDirectiveTypes['TYPEINFO'] := TObject(DTIgnored);
  FDirectiveTypes['UNDEF'] := TObject(DTUndefine);
  FDirectiveTypes['UNSAFECODE'] := TObject(DTIgnored);
  FDirectiveTypes['VARPROPSETTER'] := TObject(DTIgnored); // undocumented
  FDirectiveTypes['VARSTRINGCHECKS'] := TObject(DTIgnored);
  FDirectiveTypes['WARN'] := TObject(DTIgnored);
  FDirectiveTypes['WARNINGS'] := TObject(DTIgnored);
  FDirectiveTypes['WEAKPACKAGEUNIT'] := TObject(DTIgnored);
  FDirectiveTypes['WRITEABLECONST'] := TObject(DTIgnored);
  // Directives for generation of C++Builder .hpp files
  FDirectiveTypes['EXTERNALSYM'] := TObject(DTIgnored);
  FDirectiveTypes['HPPEMIT'] := TObject(DTIgnored);
  FDirectiveTypes['NODEFINE'] := TObject(DTIgnored);
  FDirectiveTypes['NOINCLUDE'] := TObject(DTIgnored);
end;

destructor TTokenFilter.Destroy;
begin
  FDirectiveTypes.Free;
  inherited;
end;

function TTokenFilter.Filter(AIfDefStack: TStack; ATokens: TObjectList): TObjectList;
var
  AToken: TToken;
  I: Integer;
begin
  Result := TObjectList.Create;

  try
    for I := 0 to ATokens.Count - 1 do
    begin
      AToken := ATokens[I] as TToken;
      case AToken.TokenType of
        TTSingleLineComment,
        TTCurlyBraceComment,
        TTParenStarComment:
          ; // Do nothing

        TTCompilerDirective:
          HandleCompilerDirective(AIfDefStack, AToken);

        else
          if AIfDefStack.Peek = TObject(IDTTrue) then
            Result.Add(AToken.Clone);
      end;
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
  if FDirectiveTypes.Contains(AFirstWord) then
    Result := TDirectiveType(FDirectiveTypes[AFirstWord])
  else if Length(AFirstWord) = 1 then
    Result := DTIgnored
  else
    Result := DTUnrecognized;
end;

function TTokenFilter.GetTokens: TObjectList;
var
  AIfDefStack: TStack;
begin
  AIfDefStack := TStack.Create;
  AIfDefStack.Push(TObject(IDTTrue));
  try
    Result := Filter(AIfDefStack, FTokens);
  finally
    AIfDefStack.Free;
  end;
end;

procedure TTokenFilter.HandleCompilerDirective(AIfDefStack: TStack;
  AToken: TToken);
var
  ADirective, AFirstWord, AParameter: string;
begin
  ADirective := AToken.ParsedText;
  AFirstWord := FirstWordOf(ADirective);
  AParameter := Trim(Copy(ADirective, Length(AFirstWord) + 1,
    Length(ADirective) - Length(AFirstWord)));

  case GetDirectiveType(AFirstWord) of
    DTUnrecognized:
      if AIfDefStack.Peek = TObject(IDTTrue) then
        raise ELexException.Create('Unrecognized compiler directive ''' +
          AFirstWord + '''', AToken.Location.Clone);

    DTDefine:
      if AIfDefStack.Peek = TObject(IDTTrue) then
        FCompilerDefines.DefineSymbol(AParameter);

    DTUndefine:
      if AIfDefStack.Peek = TObject(IDTTrue) then
        FCompilerDefines.UndefineSymbol(AParameter);

    DTIf:
      HandleIf(AIfDefStack, ADirective, AToken.Location);

    DTElseIf:
      HandleElseIf(AIfDefStack, ADirective, AToken.Location);

    DTElse:
      HandleElse(AIfDefStack);

    DTEndIf:
      AIfDefStack.Pop;
  end;
end;

procedure TTokenFilter.HandleElse(AIfDefStack: TStack);
var
  ATruth: TIfDefTruth;
begin
  ATruth := TIfDefTruth(AIfDefStack.Pop);
  if ATruth = IDTInitiallyFalse then
    AIfDefStack.Push(TObject(IDTTrue))
  else
    AIfDefStack.Push(TObject(IDTForeverFalse));
end;

procedure TTokenFilter.HandleElseIf(AIfDefStack: TStack; ADirective: string;
  ALocation: TLocation);
var
  ATruth: TIfDefTruth;
  ATrimmedDirective: string;
begin
  ATruth := TIfDefTruth(AIfDefStack.Pop);
  if (ATruth = IDTTrue) or (ATruth = IDTForeverFalse) then
    AIfDefStack.Push(TObject(IDTForeverFalse))
  else
  begin
    ATrimmedDirective := Copy(ADirective, 5, Length(ADirective) - 4);
    if FCompilerDefines.IsTrue(ATrimmedDirective, ALocation) then
      AIfDefStack.Push(TObject(IDTTrue))
    else
      AIfDefStack.Push(TObject(IDTInitiallyFalse));
  end;
end;

procedure TTokenFilter.HandleIf(AIfDefStack: TStack; ADirective: string;
  ALocation: TLocation);
begin
  if TIfDefTruth(AIfDefStack.Peek) = IDTTrue then
  begin
    if FCompilerDefines.IsTrue(ADirective, ALocation) then
      AIfDefStack.Push(TObject(IDTTrue))
    else
      AIfDefStack.Push(TObject(IDTInitiallyFalse));
  end
  else
    AIfDefStack.Push(TObject(IDTForeverFalse));
end;

end.
