unit UMaintainabilityIndex;

interface

uses
  ULOCCounter, UMcCabe, UHalstead, UASTNode;

type
  TMaintainabilityIndex = class
  private
    FLOCCounter: TLOCCounter;
    FMcCabe: TMcCabe;
    FHalstead: THalstead;
    FMI: Extended;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Reset;
    procedure Calculate(ANode: TASTNode);

    property LOCCounter: TLOCCounter read FLOCCounter;
    property McCabe: TMcCabe read FMcCabe;
    property Halstead: THalstead read FHalstead;
    property Value: Extended read FMI;
  end;

implementation

{ TMaintainabilityIndex }

procedure TMaintainabilityIndex.Calculate(ANode: TASTNode);
begin
  FLOCCounter.Visit(ANode);
  FMcCabe.Calculate(ANode);
  FHalstead.Calculate(ANode);

  FMI := 171 -
    5.2 * ln(FHalstead.ProgramVolume) -
    0.23 * ln(FMcCabe.Count) -
    16.2 * ln(FLOCCounter.LOCProgram);
    
  if FMI < 0 then
    FMI := 0;
end;

constructor TMaintainabilityIndex.Create;
begin
  inherited;
  FLOCCounter := TLOCCounter.Create;
  FMcCabe := TMcCabe.Create;
  FHalstead := THalstead.Create;
end;

destructor TMaintainabilityIndex.Destroy;
begin
  FLOCCounter.Free;
  FMcCabe.Free;
  FHalstead.Free;
  inherited;
end;

procedure TMaintainabilityIndex.Reset;
begin
  FLOCCounter.Reset;
  FMcCabe.Reset;
  FHalstead.Reset;
end;

end.

