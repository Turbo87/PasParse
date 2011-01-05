unit UParseException;

interface

uses
  UBaseException;

type
  /// A special type of exception that is raised by the TParser class
  EParseException = class(EBaseException)
  end;

implementation

end.
