unit UEOFFrame;

interface

uses
  UFrame, ULocation, UTokenType, UTokenSet, UToken;

type
  TEOFFrame = class(TFrame)
  private
    FLocation: TLocation;

  protected
    function GetDisplayName: string;
    function GetIsEOF: Boolean;
    function GetLocation: TLocation;
    function GetNext: TFrame;
    procedure SetNext(const Value: TFrame); 
    function GetTokenType: TTokenType;

  public
    constructor Create(ALocation: TLocation);
    destructor Destroy; override;

    function CanParseToken(ATokenSet: TTokenSet): Boolean;
    function ParseToken(ATokenSet: TTokenSet): TToken;
  end;

implementation

uses
  UParseException, UInvalidOperationException;

{ TEOFFrame }

function TEOFFrame.CanParseToken(ATokenSet: TTokenSet): Boolean;
begin
  Result := False;
end;

constructor TEOFFrame.Create(ALocation: TLocation);
begin
  inherited Create;
  FLocation := ALocation;
end;

destructor TEOFFrame.Destroy;
begin
  FLocation.Free;
  inherited;
end;

function TEOFFrame.GetDisplayName: string;
begin
  Result := 'end of file';
end;

function TEOFFrame.GetIsEOF: Boolean;
begin
  Result := True;
end;

function TEOFFrame.GetLocation: TLocation;
begin
  Result := FLocation;
end;

function TEOFFrame.GetNext: TFrame;
begin
  raise EParseException.Create('Expected token but found end of file', Location);
end;

function TEOFFrame.GetTokenType: TTokenType;
begin
  Result := TTEndOfFile;
end;

function TEOFFrame.ParseToken(ATokenSet: TTokenSet): TToken;
begin
  raise EParseException.Create('Expected ' + ATokenSet.Name +
    ' but found end of file', Location);
end;

procedure TEOFFrame.SetNext(const Value: TFrame);
begin
  raise EInvalidOperationException.Create('Cannot set Next on NullFrame');
end;

end.
