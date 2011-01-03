unit UTokenSet;

interface

uses
  UTokenType;

type
  TTokenSet = class
  private
    FTokenSet: set of TTokenType;
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
  Include(FTokenSet, ATokenType);
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
  Result := (ATokenType in FTokenSet);
end;

constructor TTokenSet.Create(AName: string);
begin
  FName := AName;
  FTokenSet := [];
end;

end.
