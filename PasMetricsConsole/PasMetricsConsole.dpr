program PasMetricsConsole;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Classes,
  UFileLoader,
  UCompilerDefines,
  UASTNode,
  UMaintainabilityIndex,
  UParser,
  URuleType,
  ULexException,
  UParseException,
  Generics.Collections,
  UFileVisitor in 'UFileVisitor.pas',
  UFileListVisitor in 'UFileListVisitor.pas';

type
  TStyle = (
    sASCII,
    sCSV,
    sHTML
  );

  TResult = class(TObject)
    FPath: string;
    FMI: TMaintainabilityIndex;
    FError: string;

    constructor Create(const APath: string; const AMI: TMaintainabilityIndex; const AError: string);
  end;

var
  FFileName: string;
  FFile: TextFile;
  FStyle: TStyle;

  FFiles: Integer;
  FLOCpro: Integer;
  FMcCabe: Integer;
  FMI: Extended;

procedure ParseParameters(out ADirectory: string; out ARecursive: Boolean);
var
  I: Integer;
  AFormat: string;
begin
  ADirectory := '';
  ARecursive := False;

  for I := 1 to ParamCount do
  begin
    if ParamStr(I) = '-r' then
      ARecursive := True
    else if (ParamStr(I)[1] = '-') and (ParamStr(I)[2] = 'o') then
    begin
      if (ParamStr(I)[3] = '=') then
        FFileName := Copy(ParamStr(I), 4, Length(ParamStr(I)) - 3);
    end
    else if (ParamStr(I)[1] = '-') and (ParamStr(I)[2] = 'f') then
    begin
      if (ParamStr(I)[3] = '=') then
        AFormat := UpperCase(Copy(ParamStr(I), 4, Length(ParamStr(I)) - 3));

      if (AFormat = 'CSV') then
        FStyle := sCSV
      else if (AFormat = 'HTML') then
        FStyle := sHTML
      else
        FStyle := sASCII;
    end
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
  AVisitor: TFileListVisitor;
  AFile: string;
begin
  AVisitor := TFileListVisitor.Create;
  AVisitor.VisitFilesFiltered(ADirectory, AFilter, ARecursive);

  for AFile in AVisitor.Files do
  begin
    if Copy(AFile, length(AFile) - 5, 6) <> '.dproj' then
      AFiles.Add(AFile);
  end;

  AVisitor.Free;
end;

function GetHeader: string;
begin
  case FStyle of
    sCSV: Result := 'File,MI,McCabe,LOCpro';
    sHTML: Result := '<html><head><title>PasMetrics</title>' +
      '<style>html { FONT-FAMILY: Arial; }</style></head>' +
      '<body><table cellspacing="0" cellpadding="3">' +
      '<tr style="COLOR: white; BACKGROUND: #555555; FONT-WEIGHT: bold;">' +
      '<td>File</td><td colspan="2">Maintainability Index</td>' +
      '<td>McCabe</td><td>LOCpro</td></tr>';
    else Result := '';
  end;
end;

function GetSummary: string;
var
  AFormat: string;
begin
  case FStyle of
    sCSV: AFormat := '%d,%.1f,%.0f,%d';
    sHTML: AFormat := '<tr style="COLOR: white; BACKGROUND: #555555; ' +
      'FONT-WEIGHT: bold;"><td>Summary: %d Files</td>' +
      '<td colspan="2">avg. %.1f</td><td>avg. %.0f</td>' +
      '<td>%d (avg. %.1f)</td></tr>';
    else AFormat := 'Summary: %d Files - avg. MI: %.1f - ' +
      'avg. McCabe: %.0f - LOCpro: %d (avg. %.1f)';
  end;
  Result := Format(AFormat, [FFiles, FMI / FFiles, FMcCabe / FFiles,
                             FLOCpro, FLOCpro / FFiles]);
end;

function GetFooter: string;
begin
  case FStyle of
    sHTML: Result := '</table></body></html>';
    else Result := '';
  end;
  Result := GetSummary + Result;
end;

function GetResultFormat(AMI: Extended): string;
var
  AColor: string;
begin
  if FStyle = sHTML then
  begin
    if AMI <= 5 then
      AColor := 'red'
    else if AMI <= 20 then
      AColor := 'yellow'
    else
      AColor := 'green';
  end;

  case FStyle of
    sCSV: Result := '%s,%.0f,%d,%d';
    sHTML: Result := '<tr><td>%s</td><td>%.0f</td><td><div style="WIDTH: ' +
      Format('%.0f', [AMI]) + 'px; BACKGROUND: ' + AColor + ';">&nbsp;</div>' +
      '</td><td>%d</td><td>%d</td></tr>';
    else Result := '%s - MI: %.0f - McCabe: %d - LOCpro: %d';
  end;
end;

function GetWarningFormat: string;
begin
  case FStyle of
    sCSV: Result := '%s,%s';
    sHTML: Result := '<tr><td>%s</td><td colspan="4" style="COLOR: white; ' +
      'BACKGROUND: red; FONT-WEIGHT: bold;">%s</td></tr>';
    else Result := '%s'#13#10'### Warning: %s';
  end;
end;

procedure OutputResult(AFilePath, ABaseDir: string; AMI: TMaintainabilityIndex);
begin
  WriteLn(FFile, Format(GetResultFormat(AMI.Value),
    [ExtractRelativePath(ABaseDir, AFilePath), AMI.Value, AMI.McCabe.Count, AMI.LOCCounter.LOCProgram]));
end;

procedure OutputWarning(AFilePath, ABaseDir, AWarning: string);
begin
  WriteLn(FFile, Format(GetWarningFormat,
    [ExtractRelativePath(ABaseDir, AFilePath), AWarning]));
end;

function CalculateMI(AFilePath: string): TMaintainabilityIndex;
var
  AFileLoader: TFileLoader;
  AContent: string;
  ACompilerDefines: TCompilerDefines;
  AParser: TParser;
  ANode: TASTNode;
begin
  // Create FileLoader to load the specified file
  AFileLoader := TFileLoader.Create;
  try
    // Load the file content
    AContent := AFileLoader.Load(AFilePath);
    // Create empty compiler defines
    ACompilerDefines := TCompilerDefines.Create;
    try
      // Create the parser
      AParser := TParser.CreateFromText(AContent, AFilePath, ACompilerDefines, AFileLoader);
      try
        // Try to parse a unit from the file content
        ANode := AParser.ParseRule(RTGoal);
        try
          Result := TMaintainabilityIndex.Create;
          Result.Calculate(ANode);
        finally
          ANode.Free;
        end;
      finally
        AParser.Free;
      end;
    finally
      ACompilerDefines.Free;
    end;
  finally
    AFileLoader.Free;
  end;
end;

function AnalyzeFile(AFilePath: string): TResult;
var
  AMI: TMaintainabilityIndex;
begin
  try
    AMI := CalculateMI(AFilePath);
    Result := TResult.Create(AFilePath, AMI, '');
  except
    on E: Exception do
    begin
      Result := TResult.Create(AFilePath, nil, E.Message);
    end;
  end;

end;

procedure Main;
var
  ADirectory: string;
  ARecursive: Boolean;
  AFiles: TStringList;
  i: integer;
  AResults: TList<TResult>;
  AResult: TResult;
begin
  FStyle := sASCII;
  FFileName := '';
  ParseParameters(ADirectory, ARecursive);
  Assign(FFile, FFileName);
  Rewrite(FFile);

  if GetHeader <> '' then
    WriteLn(FFile, GetHeader);

  AFiles := TStringList.Create;
  FindFiles(AFiles, ADirectory, '*.pas', ARecursive);
  FindFiles(AFiles, ADirectory, '*.dpr', ARecursive);
  FindFiles(AFiles, ADirectory, '*.dpk', ARecursive);

  AResults := TList<TResult>.Create;
  for i := 0 to AFiles.Count - 1 do
    AResults.Add(AnalyzeFile(AFiles[i]));

  for AResult in AResults do
  begin
    if AResult.FMI <> nil then
    begin
      OutputResult(AResult.FPath, ADirectory, AResult.FMI);

      Inc(FFiles);
      FLOCpro := FLOCpro + AResult.FMI.LOCCounter.LOCProgram;
      FMcCabe := FMcCabe + AResult.FMI.McCabe.Count;
      FMI := FMI + AResult.FMI.Value;
      AResult.FMI.Free;
    end;
    
    if AResult.FError <> '' then
      OutputWarning(AResult.FPath, ADirectory, AResult.FError);
  end;

  if GetFooter <> '' then
    WriteLn(FFile, GetFooter);

  CloseFile(FFile);
  for AResult in AResults do
    AResult.Free;

  AResults.Free;
  AFiles.Free;
end;

{ TResult }

constructor TResult.Create(const APath: string; const AMI: TMaintainabilityIndex; const AError: string);
begin
  FPath := APath;
  FMI := AMI;
  FError := AError;
end;

begin
  try
    Main;
  except
    on E: Exception do
      Writeln(E.Classname, ': ', E.Message);
  end;
end.

