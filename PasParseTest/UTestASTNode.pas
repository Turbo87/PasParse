unit UTestASTNode;

interface

uses
  UTest, UTokenType, UToken;

type
  TTestASTNode = class(TTest)
  private
    /// Creates a testing token.
    ///  Callers are responsible for destroying the resulting TToken instance!
    class function MakeToken(ATokenType: TTokenType; AText: string): TToken;
    /// Tests if TToken.Inspect() works as expected
    class function TestInspectToken: Boolean;
    
  protected
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UASTNode, ULocation;

{ TTestASTNode }

class function TTestASTNode.GetName: string;
begin
  Result := 'ASTNode';
end;

class function TTestASTNode.MakeToken(ATokenType: TTokenType;
  AText: string): TToken;
begin
  Result := TToken.Create(ATokenType, TLocation.Create('', '', 0), AText, '');
end;

class procedure TTestASTNode.TestAll;
begin
  OK('Inspect()', TestInspectToken);
end;

class function TTestASTNode.TestInspectToken: Boolean;
var
  ANode: TASTNode;
begin
  ANode := MakeToken(TTNumber, '42');
  Result := (ANode.Inspect = 'Number |42|');
  ANode.Free;
end;

end.

