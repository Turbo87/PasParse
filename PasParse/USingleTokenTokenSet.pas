unit USingleTokenTokenSet;

interface

uses
  UITokenSet, UTokenType;

type
  TSingleTokenTokenSet = class(ITokenSet)
  private
    FTokenType: TTokenType;

  protected
    function GetName: string; override;

  public
    constructor Create(ATokenType: TTokenType);

    /// Checks whether the set contains the given token type
    function Contains(ATokenType: TTokenType): Boolean; override;
  end;

implementation

uses
  TypInfo;

{ TSingleTokenTokenSet }

function TSingleTokenTokenSet.Contains(ATokenType: TTokenType): Boolean;
begin
  Result := (ATokenType = FTokenType);
end;

constructor TSingleTokenTokenSet.Create(ATokenType: TTokenType);
begin
  inherited Create;
  FTokenType := ATokenType;
end;

function TSingleTokenTokenSet.GetName: string;
begin
  Result := Copy(GetEnumName(TypeInfo(TTokenType), Integer(FTokenType)), 3);
end;

end.
