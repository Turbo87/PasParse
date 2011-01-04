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
    function IndexOf(AKey: string): Integer;

  public
    /// Standard constructor
    constructor Create(AFreeChildren: Boolean = False); 
    /// Standard destructor
    destructor Destroy; override;

    /// Returns true if the given key was found in the dictionary and writes
    ///  the corresponding TObject instance to the AValue output parameter
    function Read(AKey: string; out AValue: TObject): Boolean; overload;
    /// Returns the TObject instance corresponding with the given key or
    ///  nil if not found
    function Read(AKey: string): TObject; overload;
    /// Assigns the given TObject to the given key.
    ///  Returns whether the key already existed before.
    function Write(AKey: string; AValue: TObject): Boolean;

    /// Tests whether a key exists in the dictionary
    function Contains(AKey: string): Boolean;
  end;

implementation

uses
  SysUtils;

{ TDictionary }

function TDictionary.Contains(AKey: string): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
end;

constructor TDictionary.Create(AFreeChildren: Boolean);
begin
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
      FList.Objects[I] := nil;
    end;
  end;
    
  FreeAndNil(FList);
  inherited;
end;

function TDictionary.IndexOf(AKey: string): Integer;
begin
  Result := FList.IndexOf(AKey);
end;

function TDictionary.Read(AKey: string; out AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
    AValue := FList.Objects[AIndex]
end;

function TDictionary.Read(AKey: string): TObject;
var
  AValue: TObject;
begin
  if Read(AKey, AValue) = True then
    Result := AValue
  else
    Result := nil;
end;

function TDictionary.Write(AKey: string; AValue: TObject): Boolean;
var
  AIndex: Integer;
begin
  AIndex := IndexOf(AKey);
  Result := (AIndex >= 0);
  if Result then
    FList.Objects[AIndex] := AValue
  else
    FList.AddObject(AKey, AValue);
end;

end.
