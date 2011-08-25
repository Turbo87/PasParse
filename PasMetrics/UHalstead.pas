unit UHalstead;

interface

uses
  Generics.Collections, UVisitor, UASTNode, UToken, UTokenType;

type
  THalstead = class(TVisitor)
  private
    function GetOperandCount: Integer;
    function GetOperatorCount: Integer;

  protected
    FOperators, FOperands: TDictionary<string, Integer>;
    FTotalOperators, FTotalOperands: Integer;
    FProgramLength, FVocabularySize: Integer;
    FProgramVolume, FDifficultyLevel, FProgramLevel: Extended;
    FEffort, FImplementationTime, FBugs: Extended;

    function IsOperator(ATokenType: TTokenType): Boolean;
    function IsOperand(ATokenType: TTokenType): Boolean;

    procedure UpdateValues;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Reset;
    procedure Visit(ANode: TToken); override;
    procedure Calculate(ANode: TASTNode);

    property Operators: Integer read GetOperatorCount;
    property TotalOperators: Integer read FTotalOperators;
    property Operands: Integer read GetOperandCount;
    property TotalOperands: Integer read FTotalOperands;

    property ProgramLength: Integer read FProgramLength;
    property VocabularySize: Integer read FVocabularySize;
    property ProgramVolume: Extended read FProgramVolume;
    property DifficultyLevel: Extended read FDifficultyLevel;
    property ProgramLevel: Extended read FProgramLevel;
    property Effort: Extended read FEffort;
    property ImplementationTime: Extended read FImplementationTime;
    property Bugs: Extended read FBugs;
  end;

implementation

uses
  TypInfo, Math, UTokenSets;

{ THalstead }

procedure THalstead.Calculate(ANode: TASTNode);
begin
  ANode.Accept(Self);
  UpdateValues;
end;

constructor THalstead.Create;
begin
  inherited;

  FOperators := TDictionary<string, Integer>.Create;
  FOperands := TDictionary<string, Integer>.Create;

  Reset;
end;

destructor THalstead.Destroy;
begin
  FOperators.Free;
  FOperands.Free;
  inherited;
end;

function THalstead.GetOperandCount: Integer;
begin
  Result := FOperands.Count;
end;

function THalstead.GetOperatorCount: Integer;
begin
  Result := FOperators.Count;
end;

function THalstead.IsOperand(ATokenType: TTokenType): Boolean;
begin
  Result := (not IsOperator(ATokenType)) and
    (ATokenType <> TTCloseParenthesis) and
    (ATokenType <> TTCloseBracket);
end;

function THalstead.IsOperator(ATokenType: TTokenType): Boolean;
begin
  Result := (
    (ATokenType = TTOpenParenthesis) or
    (ATokenType = TTOpenBracket) or
    (ATokenType = TTBeginKeyword) or
    (TTokenSets.TSAddOp.Contains(ATokenType)) or
    (TTokenSets.TSDirective.Contains(ATokenType)) or
    (TTokenSets.TSForDirection.Contains(ATokenType)) or
    (TTokenSets.TSExportsSpecifier.Contains(ATokenType)) or
    (TTokenSets.TSForwardableType.Contains(ATokenType)) or
    (TTokenSets.TSInitSection.Contains(ATokenType)) or
    (TTokenSets.TSMulOp.Contains(ATokenType)) or
    (TTokenSets.TSParameterizedPropertyDirective.Contains(ATokenType)) or
    (TTokenSets.TSParameterlessPropertyDirective.Contains(ATokenType)) or
    (TTokenSets.TSParameterModifier.Contains(ATokenType)) or
    (TTokenSets.TSProgram.Contains(ATokenType)) or
    (TTokenSets.TSRelOp.Contains(ATokenType)) or
    (TTokenSets.TSUnaryOperator.Contains(ATokenType)) or
    (TTokenSets.TSUses.Contains(ATokenType)) or
    (TTokenSets.TSVarHeader.Contains(ATokenType)) or
    (TTokenSets.TSVisibility.Contains(ATokenType))) and
    (not TTokenSets.TSIdent.Contains(ATokenType));
end;

procedure THalstead.Reset;
begin
  FOperators.Clear;
  FTotalOperators := 0;
  FOperands.Clear;
  FTotalOperands := 0;
end;

procedure THalstead.UpdateValues;
var
  AValue: Integer;
begin
  for AValue in FOperators.Values do
    FTotalOperators := FTotalOperators + AValue;
  for AValue in FOperands.Values do
    FTotalOperands := FTotalOperands + AValue;

  FProgramLength := FTotalOperators + FTotalOperands;
  FVocabularySize := FOperators.Count + FOperands.Count;

  FProgramVolume := FProgramLength * (Log10(FVocabularySize) / Log10(2));
  FDifficultyLevel := (FOperators.Count / 2) * (FTotalOperands / FOperands.Count);
  FProgramLevel := 1 / FDifficultyLevel;
  FEffort := FDifficultyLevel * FProgramVolume;
  FImplementationTime := FEffort / 18;
  FBugs := Power(FEffort, 2.0/3.0) / 3000;
end;

procedure THalstead.Visit(ANode: TToken);
var
  ATokenType: string;
begin
  inherited;

  ATokenType := GetEnumName(TypeInfo(TTokenType), Integer(ANode.TokenType));
  if IsOperator(ANode.TokenType) then
  begin
    if FOperators.ContainsKey(ATokenType) then
      FOperators[ATokenType] := FOperators[ATokenType] + 1
    else
      FOperators.Add(ATokenType, 1);
  end
  else if IsOperand(ANode.TokenType) then
  begin
    if FOperands.ContainsKey(ATokenType) then
      FOperands[ATokenType] := FOperands[ATokenType] + 1
    else
      FOperands.Add(ATokenType, 1);
  end;
end;

end.

