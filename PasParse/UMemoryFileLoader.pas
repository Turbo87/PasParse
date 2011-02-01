unit UMemoryFileLoader;

interface

uses
  UIFileLoader, UDictionary, Classes;

type
  TMemoryFileLoader = class(IFileLoader)
  private
    FFileNames: TStringList;
    FFileContents: TStringList;
    function GetFile(AFileName: string): string;
    procedure SetFile(AFileName: string; const Value: string);

  public
    constructor Create;
    destructor Destroy; override;

    function ExpandFileName(ACurrentDirectory, AFileName: string): string; override;
    function Load(AFileName: string): string; override;

    property Files[AFileName: string]: string read GetFile write SetFile; default;
  end;

implementation

uses
  SysUtils;

{ TMemoryFileLoader }

constructor TMemoryFileLoader.Create;
begin
  inherited;
  FFileNames := TStringList.Create;
  FFileContents := TStringList.Create;
end;

destructor TMemoryFileLoader.Destroy;
begin
  FFileNames.Free;
  FFileContents.Free;
  inherited;
end;

function TMemoryFileLoader.ExpandFileName(ACurrentDirectory,
  AFileName: string): string;
begin
  Result := AFileName;
end;

function TMemoryFileLoader.GetFile(AFileName: string): string;
var
  AIndex: Integer;
begin
  AIndex := FFileNames.IndexOf(AFileName);
  if (AIndex >= 0) and (AIndex < FFileContents.Count) then
    Result := FFileContents.Strings[AIndex]
  else
    raise EInOutError.Create('File not found: ' + AFileName);
end;

function TMemoryFileLoader.Load(AFileName: string): string;
begin
  Result := Files[AFileName];
end;

procedure TMemoryFileLoader.SetFile(AFileName: string; const Value: string);
var
  AIndex: Integer;
begin
  AIndex := FFileNames.IndexOf(AFileName);
  if (AIndex >= 0) and (AIndex < FFileContents.Count) then
    FFileContents.Strings[AIndex] := Value
  else
  begin
    FFileNames.Add(AFileName);
    FFileContents.Add(Value);
  end;
end;

end.
