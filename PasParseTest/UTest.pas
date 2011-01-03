unit UTest;

interface

type
  TFunction = function: Boolean of object;

  TTest = class
  private
  class var
      FPlanned: Integer;
    class var
        FFailed: Integer;
      class var
          FExecuted: Integer;
class procedure Reset;
class function ReturnCode: Integer;

protected
  class function OK(AFunction: TFunction; ADescription: string): Boolean;
class procedure TestAll; virtual; abstract;
class procedure Plan(ANumber: Integer);

public
  class function Test: Integer;
        end;

implementation

uses
  SysUtils;

{ TTest }

class function TTest.OK(AFunction: TFunction; ADescription: string): Boolean;
var
  AResult: string;
begin
  Inc(FExecuted);
  Result := AFunction;
  if Result then
    AResult := 'ok'
  else
  begin
    AResult := 'not ok';
    Inc(FFailed);

    raise Exception.Create('Test #' + IntToStr(FExecuted) + ' failed: ' +
      ADescription);
  end;

  AResult := AResult + ' ' + IntToStr(FExecuted);

  if ADescription <> '' then
    WriteLn(AResult + ' - ' + ADescription)
  else
    WriteLn(AResult);
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
  TestAll;
  Result := ReturnCode
end;

end.

