unit ULocation;

interface

type
  /// <Description>A class holding information about a certain Location in a code file.</Description>
  TLocation = class
  private
    /// <Description>The name of the file where the Location can be found.</Description>
    FFileName: string;
    /// <Description>The content of the file where the Location can be found.</Description>
    FFileSource: string;
    /// <Description>The offset from the start of FileSource where the Location can be found.</Description>
    FOffset: Integer;
    /// <Description>The directory that the file is in.</Description>
    function GetDirectory: string;

  public
    /// <Description>Default constructor.</Description>
    constructor Create(AFileName, AFileSource: string; AOffset: Integer);

    /// <Description>The name of the file where the Location can be found.</Description>
    property FileName: string read FFileName;
    /// <Description>The content of the file where the Location can be found.</Description>
    property FileSource: string read FFileSource;
    /// <Description>The offset from the start of FileSource where the Location can be found.</Description>
    property Offset: Integer read FOffset;

    /// <Description>Creates a clone of the current Location.</Description>
    function Clone: TLocation;

    /// <Description>The directory that the file is in.</Description>
    property Directory: string read GetDirectory;
  end;

implementation

uses
  SysUtils;

{ TLocation }

function TLocation.Clone: TLocation;
begin
  // Create a new Location instance with the same parameters and return it
  Result := TLocation.Create(FFileName, FFileSource, FOffset);
end;

constructor TLocation.Create(AFileName, AFileSource: string; AOffset: Integer);
begin
  // Assign private fields
  FFileName := AFileName;
  FFileSource := AFileSource;
  FOffset := AOffset;
end;

function TLocation.GetDirectory: string;
begin
  if FFileName = '' then
    Result := ''
  else
    Result := ExtractFilePath(FFileName);
end;

end.
