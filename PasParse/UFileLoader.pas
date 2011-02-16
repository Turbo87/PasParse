unit UFileLoader;

interface

uses
  UIFileLoader;

type
  TFileLoader = class(IFileLoader)
  public
    function ExpandFileName(ACurrentDirectory, AFileName: string): string; override;
    function Load(AFileName: string): string; override;
  end;

implementation

uses
  SysUtils;

{ TFileLoader }

function TFileLoader.ExpandFileName(ACurrentDirectory,
  AFileName: string): string;
begin
  Result := ACurrentDirectory + '\' + AFileName;
end;

function TFileLoader.Load(AFileName: string): string;
var
  AFile: TextFile;
  AChar: char;
begin
  if not FileExists(AFileName) then
    raise EInOutError.Create('File not found: ' + AFileName)
  else
  begin
    Result := '';

    // Open File
    AssignFile(AFile, AFileName);
    Reset(AFile);

    // Read File
    while not Eof(AFile) do
    begin
      Read(AFile, AChar);
      Result := Result + AChar;

      if Result = #239#187#191 then
        Result := '';
    end;

    // Close File
    Close(AFile);
  end;
end;

end.
