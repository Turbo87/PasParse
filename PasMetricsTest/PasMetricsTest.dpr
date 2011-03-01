program PasMetricsTest;

{$APPTYPE CONSOLE}

uses
  FastMM4 in '..\FastMM\FastMM4.pas',
  FastMM4Messages in '..\FastMM\FastMM4Messages.pas',
  SysUtils,
  UTestLOCCounter in 'UTestLOCCounter.pas',
  UTestMcCabe in 'UTestMcCabe.pas',
  UTestHalstead in 'UTestHalstead.pas',
  UTestMaintainabilityIndex in 'UTestMaintainabilityIndex.pas';

begin
  try
    TTestLOCCounter.Test;
    TTestMcCabe.Test;
    TTestHalstead.Test;
    TTestMaintainabilityIndex.Test;
  except
    on E:Exception do
    begin
      Writeln(E.Classname, ': ', E.Message);
      Readln;
    end;
  end;
end.
