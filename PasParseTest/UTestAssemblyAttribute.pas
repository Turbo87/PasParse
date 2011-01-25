unit UTestAssemblyAttribute;

interface

uses
  UTest;

type
  TTestAssemblyAttribute = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestAssemblyAttribute }

class function TTestAssemblyAttribute.GetName: string;
begin
  Result := 'AssemblyAttribute';
end;

class procedure TTestAssemblyAttribute.TestAll;
begin
   
  OK('[assembly: AssemblyVersion(''0.0.0.0'')]', 
    TTestParser.ParsesAs('[assembly: AssemblyVersion(''0.0.0.0'')]', 
    'AttributeNode' + #13#10 +
    '  OpenBracketNode: OpenBracket |[|' + #13#10 +
    '  ScopeNode: AssemblySemikeyword |assembly|' + #13#10 +
    '  ColonNode: Colon |:|' + #13#10 +
    '  ValueNode: ParameterizedNode' + #13#10 +
    '    LeftNode: Identifier |AssemblyVersion|' + #13#10 +
    '    OpenDelimiterNode: OpenParenthesis |(|' + #13#10 +
    '    ParameterListNode: ListNode' + #13#10 +
    '      Items[0]: DelimitedItemNode' + #13#10 +
    '        ItemNode: StringLiteral |''0.0.0.0''|' + #13#10 +
    '        DelimiterNode: (none)' + #13#10 +
    '    CloseDelimiterNode: CloseParenthesis |)|' + #13#10 +
    '  CloseBracketNode: CloseBracket |]|', RTAssemblyAttribute));
end;

end.
