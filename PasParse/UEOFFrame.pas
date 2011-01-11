unit UEOFFrame;

interface

uses
  UIFrame, ULocation, UTokenType, UITokenSet, UToken;

type
  TEOFFrame = class(IFrame)
  private
    FLocation: TLocation;

  protected
    function GetDisplayName: string; override;
    function GetIsEOF: Boolean; override;
    function GetLocation: TLocation; override;
    function GetNext: IFrame; override;
    procedure SetNext(const Value: IFrame); override;
    function GetTokenType: TTokenType; override;

  public
    constructor Create(ALocation: TLocation);
    destructor Destroy; override;

    function CanParseToken(ATokenSet: ITokenSet): Boolean; override;
    function ParseToken(ATokenSet: ITokenSet): TToken; override;
  end;

implementation

uses
  UParseException, UInvalidOperationException;

{ TEOFFrame }

function TEOFFrame.CanParseToken(ATokenSet: ITokenSet): Boolean;
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

function TEOFFrame.GetNext: IFrame;
begin
  raise EParseException.Create('Expected token but found end of file',
    Location.Clone);
end;

function TEOFFrame.GetTokenType: TTokenType;
begin
  Result := TTEndOfFile;
end;

function TEOFFrame.ParseToken(ATokenSet: ITokenSet): TToken;
begin
  raise EParseException.Create('Expected ' + ATokenSet.Name +
    ' but found end of file', Location.Clone);
end;

procedure TEOFFrame.SetNext(const Value: IFrame);
begin
  raise EInvalidOperationException.Create('Cannot set Next on NullFrame');
end;

end.
