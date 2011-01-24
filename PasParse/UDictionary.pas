unit UDictionary;

interface

uses
  Classes;

type
  /// <Description>A generic Dictionary class.</Description>
  /// <Description>Instead of an Integer-based array index a string is used.</Description>
  TDictionary = class
  private
    /// <Description>Internal list of the Dictionary.</Description>
    FList: TStringList;
    /// <Description>Should the destructor free its children in the destructor?</Description>
    FFreeChildren: Boolean;

    /// <Description>Returns the integer-based index of the given key or -1 if not found.</Description>
    function IndexOf(const AKey: string): Integer;

    /// <Description>Redirection to Write() without return value.</Description>
    /// <Description>Used to enable write support for the Items property.</Description>
    procedure WriteRedirection(const AKey: string; const AValue: TObject);

  public
    /// <Description>Default constructor.</Description>
    constructor Create(const AFreeChildren: Boolean = False);
    /// <Description>Default destructor.</Description>
    destructor Destroy; override;

    /// <Description>Returns true if the given key was found in the Dictionary.</Description>
    /// <Description>Writes the corresponding TObject instance to the Value output parameter.</Description>
    function Read(const AKey: string; out AValue: TObject): Boolean; overload;
    /// <Description>Returns the TObject instance corresponding with the Key or nil if not found.</Description>
    function Read(const AKey: string): TObject; overload;
    /// <Description>Assigns Value to Key. Overwrites if Key exists already.</Description>
    function Write(const AKey: string; const AValue: TObject): Boolean;

    /// <Description>Checks whether the Key exists in the Dictionary.</Description>
    function Contains(const AKey: string): Boolean;

    /// <Description>User-friendly syntax option to access the Read/Write() functions.</Description>
    property Items[const AKey: string]: TObject read Read write WriteRedirection;
  end;

implementation

{ TDictionary }

function TDictionary.Contains(const AKey: string): Boolean;
var
  AIndex: Integer;
begin
  // Try to find the Key in the interal StringList
  AIndex := IndexOf(AKey);
  // IndexOf returns negative value if Key was not found!
  Result := (AIndex >= 0);
end;

constructor TDictionary.Create(const AFreeChildren: Boolean);
begin
  inherited Create;
  FFreeChildren := AFreeChildren;
  // Initialize internal list
  FList := TStringList.Create;
end;

destructor TDictionary.Destroy;
var
  I: Integer;
begin
  // If the dictionary is supposed to kill it's children
  if FFreeChildren then
  begin
    // ... iterate through the children
    for I := 0 to FList.Count - 1 do
    begin
      // ... and free them 
      FList.Objects[I].Free;
    end;
  end;

  // Destroy the internal list
  FList.Free;
  inherited;
end;

function TDictionary.IndexOf(const AKey: string): Integer;
begin
  // Pass the result of the internal IndexOf() function
  Result := FList.IndexOf(AKey);
end;

function TDictionary.Read(const AKey: string; out AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  // Try to find the Key
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
    // ... and if we've found it return the Value as output parameter
    AValue := FList.Objects[AIndex]
end;

function TDictionary.Read(const AKey: string): TObject;
var
  AValue: TObject;
begin
  // Try to read the Key
  if Read(AKey, AValue) = True then
    // ... and if successful return the Value
    Result := AValue
  else
    // ... otherwise return nil
    Result := nil;
end;

function TDictionary.Write(const AKey: string; const AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  // Try to find the Key
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
  begin
    // ... and if we've found it overwrite (and free) the old value
    if FFreeChildren then
        FList.Objects[AIndex].Free;

    FList.Objects[AIndex] := AValue
  end
  else
    // ... otherwise add a new key-value pair
    FList.AddObject(AKey, AValue);
end;

procedure TDictionary.WriteRedirection(const AKey: string;
  const AValue: TObject);
begin
  // Pass Key and Value to Write() and don't care about the return value
  Write(AKey, AValue);
end;

end.
