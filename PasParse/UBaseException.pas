unit UBaseException;

interface

uses
  SysUtils, ULocation;

type
  /// <Description>Base class for exceptions including a TLocation instance.</Description>
  EBaseException = class(Exception)
  private
    /// <Description>The Location where the exception was raised.</Description>
    FLocation: TLocation;

  public
    /// <Description>Default constructor with message and Location.</Description>
    constructor Create(AMessage: string; ALocation: TLocation);
    /// <Description>Default destructor.</Description>
    destructor Destroy; override;

    /// <Description>Returns the Location where the exception was raised</Description>
    property Location: TLocation read FLocation;
  end;

implementation

{ TBaseException }

constructor EBaseException.Create(AMessage: string; ALocation: TLocation);
begin
  // Pass message to inherited constructor
  inherited Create(AMessage);
  // Save Location in private field
  FLocation := ALocation;
end;

destructor EBaseException.Destroy;
begin
  // Free the Location instance when the Exception is destroyed
  FLocation.Free;
  inherited;
end;

end.
