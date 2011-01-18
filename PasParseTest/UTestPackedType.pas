unit UTestPackedType;

interface

uses
  UTest;

type
  TTestPackedType = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestPackedType }

class function TTestPackedType.GetName: string;
begin
  Result := 'PackedType';
end;

class procedure TTestPackedType.TestAll;
begin
  OK('packed array of Byte', TTestParser.ParsesAs('packed array of Byte',
    'PackedTypeNode' + #13#10 +
    '  PackedKeywordNode: PackedKeyword |packed|' + #13#10 +
    '  TypeNode: ArrayTypeNode' + #13#10 +
    '    ArrayKeywordNode: ArrayKeyword |array|' + #13#10 +
    '    OpenBracketNode: (none)' + #13#10 +
    '    IndexListNode: ListNode' + #13#10 +
    '    CloseBracketNode: (none)' + #13#10 +
    '    OfKeywordNode: OfKeyword |of|' + #13#10 +
    '    TypeNode: Identifier |Byte|', RTPackedType));
end;

end.
