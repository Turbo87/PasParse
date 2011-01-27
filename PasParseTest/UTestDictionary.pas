unit UTestDictionary;

interface

uses
  UTest;

type
  TTestDictionary = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UDictionary;

{ TTestDictionary }

class function TTestDictionary.GetName: string;
begin
  Result := 'Dictionary';
end;

class procedure TTestDictionary.TestAll;
var
  ADict: TDictionary;
  AObject: TObject;
  APair: TDictionaryKeyValuePair;
begin
  ADict := TDictionary.Create;

  // No key-value pairs yet
  OK(not ADict.Contains('test1'), 'Contains');
  OK(not ADict.Read('test1', AObject), 'Read');
  OK(ADict.Read('test2') = nil, 'Read');
  OK(ADict.Items['test3'] = nil, 'Items[]');

  // Write first pair
  OK(not ADict.Write('test1', TObject(5)), 'Write');

  // Read first pair
  OK(ADict.Contains('test1'), 'Contains');
  OK(ADict.Read('test1', AObject), 'Read');
  OK(Integer(AObject) = 5, 'Integer(AObject) = 5');

  // Write second pair
  OK(not ADict.Write('test2', TObject(true)), 'Write');

  // Read second pair
  OK(ADict['test2'] = TObject(true), '[]');

  // Write third pair
  ADict.Items['test3'] := TObject(false);

  // Read third pair
  OK(ADict.Items['test3'] = TObject(false), 'Items[]');

  // Overwrite first pair
  OK(ADict.Write('test1', TObject(3)), 'Write');

  // Read first pair again
  OK(ADict.Contains('test1'), 'Contains');
  OK(ADict.Read('test1', AObject), 'Read');
  OK(Integer(AObject) = 3, 'Integer(AObject) = 3');

  // Test Enumerator
  for APair in ADict do
  begin
    if APair.Key = 'test1' then
      OK(Integer(APair.Value) = 3, 'Enumerator 1')
    else if APair.Key = 'test2' then
      OK(APair.Value = TObject(true), 'Enumerator 2')
    else if APair.Key = 'test3' then
      OK(APair.Value = TObject(false), 'Enumerator 3')
    else
      OK(False, 'Enumerator - unknown key');
  end;

  ADict.Free;
end;

end.

