unit ULexException;

interface

uses
  UBaseException;

type
  /// A special type of exception that is raised by the TLexScanner class
  ELexException = class(EBaseException)
  end;

implementation

end.
