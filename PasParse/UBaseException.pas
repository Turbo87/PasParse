unit UBaseException;

interface

uses
  SysUtils, ULocation;

type
  /// The base class for exceptions including a TLocation instance
  EBaseException = class(Exception)
  private
    FLocation: TLocation;

  public
    /// Standard constructor
    constructor Create(AMessage: string; ALocation: TLocation);
    destructor Destroy; override;

    /// Location where the exception was raised
    property Location: TLocation read FLocation;
  end;

implementation

{ TBaseException }

constructor EBaseException.Create(AMessage: string; ALocation: TLocation);
begin
  inherited Create(AMessage);
  FLocation := ALocation;
end;

destructor EBaseException.Destroy;
begin
  FLocation.Free;
  inherited;
end;

end.
