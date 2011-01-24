unit UDictionary;

interface

uses
  Classes;

type
  TDictionary = class
  private
    /// Internal list of the dictionary
    FList: TStringList;
    /// Should the destructor free its children in the destructor
    FFreeChildren: Boolean;

    /// Returns the integer-based index of the given key or -1 if not found
    function IndexOf(const AKey: string): Integer;

    procedure WriteRedirection(const AKey: string; const AValue: TObject);

  public
    /// Standard constructor
    constructor Create(const AFreeChildren: Boolean = False);
    /// Standard destructor
    destructor Destroy; override;

    /// Returns true if the given key was found in the dictionary and writes
    ///  the corresponding TObject instance to the AValue output parameter
    function Read(const AKey: string; out AValue: TObject): Boolean; overload;
    /// Returns the TObject instance corresponding with the given key or
    ///  nil if not found
    function Read(const AKey: string): TObject; overload;
    /// Assigns the given TObject to the given key.
    ///  Returns whether the key already existed before.
    function Write(const AKey: string; const AValue: TObject): Boolean;

    /// Tests whether a key exists in the dictionary
    function Contains(const AKey: string): Boolean;

    property Items[const AKey: string]: TObject read Read write WriteRedirection;
  end;

implementation

{ TDictionary }

function TDictionary.Contains(const AKey: string): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
end;

constructor TDictionary.Create(const AFreeChildren: Boolean);
begin
  inherited Create;
  FFreeChildren := AFreeChildren;
  FList := TStringList.Create;
end;

destructor TDictionary.Destroy;
var
  I: Integer;
begin
  if FFreeChildren then
  begin
    for I := 0 to FList.Count - 1 do
    begin
      FList.Objects[I].Free;
    end;
  end;

  FList.Free;
  inherited;
end;

function TDictionary.IndexOf(const AKey: string): Integer;
begin
  Result := FList.IndexOf(AKey);
end;

function TDictionary.Read(const AKey: string; out AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
    AValue := FList.Objects[AIndex]
end;

function TDictionary.Read(const AKey: string): TObject;
var
  AValue: TObject;
begin
  if Read(AKey, AValue) = True then
    Result := AValue
  else
    Result := nil;
end;

function TDictionary.Write(const AKey: string; const AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
  begin
    if FFreeChildren then
        FList.Objects[AIndex].Free;

    FList.Objects[AIndex] := AValue
  end
  else
    FList.AddObject(AKey, AValue);
end;

procedure TDictionary.WriteRedirection(const AKey: string;
  const AValue: TObject);
begin
  Write(AKey, AValue);
end;

end.
