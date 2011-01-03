unit UTokenSet;

interface

uses
  UTokenType;

type
  TTokenSet = class
  private
    FTokenTypes: set of TTokenType;
    FName: string;

  public
    constructor Create(AName: string);

    procedure Add(ATokenType: TTokenType);
    procedure AddRange(ATokenSet: TTokenSet);
    function Contains(ATokenType: TTokenType): Boolean;
  end;

implementation

{ TTokenSet }

procedure TTokenSet.Add(ATokenType: TTokenType);
begin
  Include(FTokenTypes, ATokenType);
end;

procedure TTokenSet.AddRange(ATokenSet: TTokenSet);
var
  ATokenType: TTokenType;
begin
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    if ATokenSet.Contains(ATokenType) then
      Add(ATokenType);
  end;
end;

function TTokenSet.Contains(ATokenType: TTokenType): Boolean;
begin
  Result := (ATokenType in FTokenTypes);
end;

constructor TTokenSet.Create(AName: string);
begin
  FName := AName;
  FTokenTypes := [];
end;

end.
