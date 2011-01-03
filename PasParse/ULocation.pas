unit ULocation;

interface

type
  TLocation = record
  private
    FFileName: string;
    FFileSource: string;
    FOffset: Integer;

    function GetDirectory: string;

  public
    class function Create(AFileName, AFileSource: string; AOffset: Integer): TLocation; static;

    property Directory: string read GetDirectory;
    property FileName: string read FFileName;
    property FileSource: string read FFileSource;
    property Offset: Integer read FOffset;
  end;

implementation

{ TLocation }

class function TLocation.Create(AFileName, AFileSource: string; AOffset: Integer): TLocation;
begin
  Result.FFileName := AFileName;
  Result.FFileSource := AFileSource;
  Result.FOffset := AOffset;
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
