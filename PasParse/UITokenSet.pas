unit UITokenSet;

interface

uses
  UTokenType;

type
  /// <Description>Prototype/Interface for a TokenSet</Description>
  ITokenSet = class
  protected
    /// <Description>Returns the name of the TokenSet</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    /// <Description>Use the public Name property to access!</Description>
    function GetName: string; virtual; abstract;

  public
    /// <Description>Checks whether the set contains the given TokenType.</Description>
    /// <Description>Must be implemented by all derived classes.</Description>
    function Contains(ATokenType: TTokenType): Boolean; virtual; abstract;

    /// <Description>Returns the name of the TokenSet.</Description>
    /// <Description>Calls the GetName() function.</Description>
    property Name: string read GetName;
  end;

implementation

end.
