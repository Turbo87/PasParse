unit UTokenSet;

interface

uses
  UTokenType;

type
  /// A named set of token types
  TTokenSet = class
  private
    FTokenSet: set of TTokenType;
    FName: string;

  public
    /// Standard constructor. Creates an empty set.
    constructor Create(AName: string);

    /// Add one token type to the set
    procedure Add(ATokenType: TTokenType);
    /// Add a range of token types to the set
    procedure AddRange(ATokenSet: TTokenSet);
    /// Checks whether the set contains the given token type
    function Contains(ATokenType: TTokenType): Boolean;
  end;

implementation

{ TTokenSet }

procedure TTokenSet.Add(ATokenType: TTokenType);
begin
  // Add given token type to the set
  Include(FTokenSet, ATokenType);
end;

procedure TTokenSet.AddRange(ATokenSet: TTokenSet);
var
  ATokenType: TTokenType;
begin
  // Iterate through all available token types
  for ATokenType := Low(TTokenType) to High(TTokenType) do
  begin
    // If the given token set contains the current token type
    if ATokenSet.Contains(ATokenType) then
      // Add the token type to our own token set too
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
