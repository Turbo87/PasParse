{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit PasParse; 

interface

uses
  UBaseException, ULexException, ULexScanner, ULocation, UToken, UTokenSet, 
  UTokenSets, UTokenType, URuleType, UCompilerDefines, UPreprocessorException, 
  UDictionary, UASTNode, UNonTerminalNode, UDelimitedItemNode, 
  UGeneratedNodes, UListNode, UParser, UIFrame, UEOFFrame, UParseException, 
  UInvalidOperationException, UFrame, UITokenSet, USingleTokenTokenSet, URule, 
  UIParser, UTokenRule, URules, UAlternator, LazarusPackageIntf;

implementation

procedure Register; 
begin
end; 

initialization
  RegisterPackage('PasParse', @Register); 
end.
