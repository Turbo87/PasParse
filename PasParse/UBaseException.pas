unit UBaseException;

interface

uses
  SysUtils, ULocation;

type
  EBaseException = class(Exception)
  private
    FLocation: TLocation;

  public
    constructor Create(AMessage: string; ALocation: TLocation);

    property Location: TLocation read FLocation;
  end;

implementation

{ TBaseException }

constructor EBaseException.Create(AMessage: string; ALocation: TLocation);
begin
  inherited Create(AMessage);
  FLocation := ALocation;
end;

end.
