program PasMetricsConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils, Classes, UFileLoader, UCompilerDefines, UASTNode,
  UMaintainabilityIndex, UParser, URuleType, ULexException, UParseException;

procedure ParseParameters(out ADirectory: string; out ARecursive: Boolean);
var
  I: Integer;
begin
  ADirectory := '';
  ARecursive := False;

  for I := 1 to ParamCount do
  begin
    if ParamStr(I) = '-r' then
      ARecursive := True
    else
    begin
      ADirectory := ParamStr(I);
      break;
    end;
  end;

  if ADirectory = '' then
    ADirectory := GetCurrentDir;

end;

procedure FindFiles(AFiles: TStringList; ADirectory, AFilter: string;
  ARecursive: Boolean);
var
  SR: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if ADirectory[length(ADirectory)] <> '\' then
    ADirectory := ADirectory + '\';

  IsFound := FindFirst(ADirectory + AFilter, faAnyFile - faDirectory, SR) = 0;
  while IsFound do
  begin
    AFiles.Add(ADirectory + SR.Name);
    IsFound := FindNext(SR) = 0;
  end;
  FindClose(SR);

  if ARecursive then
  begin
    // Build a list of subdirectories
    DirList := TStringList.Create;
    IsFound := FindFirst(ADirectory + '*', faAnyFile, SR) = 0;
    while IsFound do
    begin
      if ((SR.Attr and faDirectory) <> 0) and (SR.Name[1] <> '.') then
        DirList.Add(ADirectory + SR.Name);

      IsFound := FindNext(SR) = 0;
    end;
    FindClose(SR);

    // Scan the list of subdirectories
    for i := 0 to DirList.Count - 1 do
      FindFiles(AFiles, DirList[i], AFilter, True);

    DirList.Free;
  end;
end;

procedure OutputResult(AFilePath, ABaseDir: string; AMI: TMaintainabilityIndex);
begin
  WriteLn(Format('%s - MI: %.0f - LOCpro: %d',
    [ExtractRelativePath(ABaseDir, AFilePath), AMI.Value, AMI.LOCCounter.LOCProgram]));
end;

procedure OutputWarning(AFilePath, ABaseDir, AWarning: string);
begin
  WriteLn(Format('%s'#13#10'### Warning: %s',
    [ExtractRelativePath(ABaseDir, AFilePath), AWarning]));
end;

procedure AnalyzeFile(AFilePath, ABaseDir: string);
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
  AMI: TMaintainabilityIndex;
begin
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFilePath);
    // Create empty compiler defines
    ACompilerDefines := TCompilerDefines.Create;
    try
      try
      // Create the parser
      AParser := TParser.CreateFromText(AContent, '', ACompilerDefines, AFileLoader);
      try
        // Try to parse a unit from the file content
        ANode := AParser.ParseRule(RTGoal);
        try
          AMI := TMaintainabilityIndex.Create;
          AMI.Calculate(ANode);
          OutputResult(AFilePath, ABaseDir, AMI);
          AMI.Free;
        finally
          ANode.Free;
        end;
      finally
        AParser.Free;
      end;
      except
        on E: Exception do
          OutputWarning(AFilePath, ABaseDir, E.Message);
      end;
    finally
      ACompilerDefines.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

procedure Main;
var
  ADirectory: string;
  ARecursive: Boolean;
  AFiles: TStringList;
  i: integer;
begin
  ParseParameters(ADirectory, ARecursive);

  AFiles := TStringList.Create;
  FindFiles(AFiles, ADirectory, '*.pas', ARecursive);
  FindFiles(AFiles, ADirectory, '*.dpr', ARecursive);
  FindFiles(AFiles, ADirectory, '*.dpk', ARecursive);

  for i := 0 to AFiles.Count - 1 do
  begin
    AnalyzeFile(AFiles[i], ADirectory);
  end;

  AFiles.Free;
end;

begin
  try
    Main;
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

