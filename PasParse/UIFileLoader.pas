unit UIFileLoader;

interface

type
  IFileLoader = class
  public
    function ExpandFileName(ACurrentDirectory, AFileName: string): string; virtual; abstract;
    function Load(AFileName: string): string; virtual; abstract;
    function LoadFromParentDirs(AFilePath: string): string;
    function Exists(AFileName: string): Boolean; virtual; abstract;
  end;

implementation

uses
  SysUtils;

{ IFileLoader }

function IFileLoader.LoadFromParentDirs(AFilePath: string): string;
var
  ADirectory, AFileName: string;
begin
  if Exists(AFilePath) then
    Result := Load(AFilePath)
  else
  begin
    // Extract current filename and directory
    AFileName := ExtractFileName(AFilePath);
    ADirectory := ExtractFileDir(AFilePath);

    repeat
      // Extract parent directory
      ADirectory := ExtractFileDir(ADirectory);
      AFilePath := ExpandFileName(ADirectory, AFileName);
      if Exists(AFilePath) then
        Break;
    until (ADirectory = '') or (ADirectory = '/') or
      (Copy(ADirectory, Length(ADirectory), 1) = '\');

    Result := Load(AFilePath);
  end;
end;


end.
