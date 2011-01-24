unit ULocation;

interface

type
  TLocation = class
  private
    FFileName: string;
    FFileSource: string;
    FOffset: Integer;

  public
    constructor Create(AFileName, AFileSource: string; AOffset: Integer);

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

end.
