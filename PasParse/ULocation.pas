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
  end;

implementation

{ TLocation }

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
