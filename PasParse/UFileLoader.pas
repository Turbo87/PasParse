unit UFileLoader;

interface

uses
  UIFileLoader;

type
  TFileLoader = class(IFileLoader)
  public
    function ExpandFileName(ACurrentDirectory, AFileName: string): string; override;
    function Load(AFileName: string): string; override;
    function Exists(AFileName: string): Boolean; override;
  end;

implementation

uses
  SysUtils, Classes;

{ TFileLoader }

function TFileLoader.Exists(AFileName: string): Boolean;
begin
  Result := FileExists(AFileName);
end;

function TFileLoader.ExpandFileName(ACurrentDirectory,
  AFileName: string): string;
begin
  Result := ACurrentDirectory + '\' + AFileName;
end;

function TFileLoader.Load(AFileName: string): string;
var
  AReader: TStreamReader;
begin
  if not FileExists(AFileName) then
    raise EInOutError.Create('File not found: ' + AFileName)
  else
  begin
    AReader := TStreamReader.Create(AFileName, True);
    Result := AReader.ReadToEnd;
    AReader.Free;
  end;
end;

end.
