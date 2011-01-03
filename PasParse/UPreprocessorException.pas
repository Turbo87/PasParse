unit UPreprocessorException;

interface

uses
  UBaseException;

type
  /// A special type of exception that is raised by the preprocessor
  EPreprocessorException = class(EBaseException)
  end;

implementation

end.
