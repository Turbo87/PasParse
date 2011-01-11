unit ULocation;

interface

type
  TLocation = class
  private
    FFileName: string;
    FFileSource: string;
    FOffset: Integer;

    function GetDirectory: string;

  public
    constructor Create(AFileName, AFileSource: string; AOffset: Integer);

    property Directory: string read GetDirectory;
    property FileName: string read FFileName;
    property FileSource: string read FFileSource;
    property Offset: Integer read FOffset;

    function Clone: TLocation;
  end;

implementation

{ TLocation }

function TLocation.Clone: TLocation;
begin
  Result := TLocation.Create(FFileName, FFileSource, FOffset);
end;

constructor TLocation.Create(AFileName, AFileSource: string; AOffset: Integer);
begin
  FFileName := AFileName;
  FFileSource := AFileSource;
  FOffset := AOffset;
end;

function TLocation.GetDirectory: string;
begin
  if FFileName = '' then
    Result := ''
  else
    // TODO
    Result := FFileName
end;

end.
