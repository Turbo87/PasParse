unit UTest;

interface

type
  TTest = class
  private
    class var FPlanned: Integer;
    class var FFailed: Integer;
    class var FExecuted: Integer;

    class procedure Reset;
    class function ReturnCode: Integer;

  protected
    class function OK(AResult: Boolean; ADescription: string): Boolean;
    class procedure TestAll; virtual; abstract;
    class function GetName: string; virtual; abstract;
    class procedure Plan(ANumber: Integer);

  public
    class function Test: Integer;
  end;

implementation

uses
  SysUtils;

{ TTest }

class function TTest.OK(AResult: Boolean; ADescription: string): Boolean;
var
  AResultText: string;
begin
  Result := AResult;

  Inc(FExecuted);
  if AResult then
    AResultText := 'ok'
  else
  begin
    AResultText := 'not ok';
    Inc(FFailed);

    raise Exception.Create('Test #' + IntToStr(FExecuted) + ' failed: ' +
      ADescription);
  end;

  AResultText := AResultText + ' ' + IntToStr(FExecuted);

  if ADescription <> '' then
    WriteLn(AResultText + ' - ' + ADescription)
  else
    WriteLn(AResultText);
end;

class procedure TTest.Plan(ANumber: Integer);
begin
  FPlanned := ANumber
end;

class procedure TTest.Reset;
begin
  FExecuted := 0;
  FFailed := 0;
  Plan(0);
end;

class function TTest.ReturnCode: Integer;
begin
  if FPlanned <= 0 then
    Result := FFailed
  else
    Result := (FPlanned - FExecuted) + FFailed;
end;

class function TTest.Test: Integer;
begin
  Reset;
  WriteLn('');
  WriteLn('Test: ' + GetName);
  WriteLn('');
  TestAll;
  Result := ReturnCode
end;

end.

