unit UMcCabe;

interface

uses
  UVisitor, UASTNode, UGeneratedNodes;

type
  TMcCabe = class(TVisitor)
  protected
    FCount: Integer;

  public
    constructor Create;

    procedure Reset;
    procedure Visit(ANode: TIfStatementNode); override;
    procedure Visit(ANode: TForStatementNode); override;
    procedure Visit(ANode: TForInStatementNode); override;
    procedure Visit(ANode: TWhileStatementNode); override;
    procedure Visit(ANode: TRepeatStatementNode); override;
    procedure Visit(ANode: TCaseSelectorNode); override;
    procedure Visit(ANode: TExceptionItemNode); override;
    procedure Visit(ANode: TBinaryOperationNode); override;
    procedure Visit(ANode: TMethodImplementationNode); override;
    procedure Calculate(ANode: TASTNode);

    property Count: Integer read FCount;
  end;

implementation

uses
  UTokenType;

{ TMcCabe }

procedure TMcCabe.Calculate(ANode: TASTNode);
begin
  ANode.Accept(Self);

  if FCount < 1 then
    FCount := 1;
end;

constructor TMcCabe.Create;
begin
  Reset;
end;

procedure TMcCabe.Reset;
begin
  FCount := 0;
end;

procedure TMcCabe.Visit(ANode: TWhileStatementNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TForInStatementNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TForStatementNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TExceptionItemNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TCaseSelectorNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TRepeatStatementNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TIfStatementNode);
begin
  inherited;
  Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TBinaryOperationNode);
begin
  inherited;
  if (ANode.OperatorNode.TokenType = TTAndKeyword) or
     (ANode.OperatorNode.TokenType = TTOrKeyword) then
    Inc(FCount);
end;

procedure TMcCabe.Visit(ANode: TMethodImplementationNode);
begin
  inherited;
  Inc(FCount);
end;

end.
