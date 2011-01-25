unit UTestVisibilitySection;

interface

uses
  UTest;

type
  TTestVisibilitySection = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestVisibilitySection }

class function TTestVisibilitySection.GetName: string;
begin
  Result := 'VisibilitySection';
end;

class procedure TTestVisibilitySection.TestAll;
begin
  OK('public', TTestParser.ParsesAs('public',
    'VisibilitySectionNode' + #13#10 +
    '  VisibilityNode: VisibilityNode' + #13#10 +
    '    StrictSemikeywordNode: (none)' + #13#10 +
    '    VisibilityKeywordNode: PublicSemikeyword |public|' + #13#10 +
    '  ContentListNode: ListNode', RTVisibilitySection));

  OK('FFoo: Integer;', TTestParser.ParsesAs('FFoo: Integer;',
    'VisibilitySectionNode' + #13#10 +
    '  VisibilityNode: (none)' + #13#10 +
    '  ContentListNode: ListNode' + #13#10 +
    '    Items[0]: FieldSectionNode' + #13#10 +
    '      ClassKeywordNode: (none)' + #13#10 +
    '      VarKeywordNode: (none)' + #13#10 +
    '      FieldListNode: ListNode' + #13#10 +
    '        Items[0]: FieldDeclNode' + #13#10 +
    '          NameListNode: ListNode' + #13#10 +
    '            Items[0]: DelimitedItemNode' + #13#10 +
    '              ItemNode: Identifier |FFoo|' + #13#10 +
    '              DelimiterNode: (none)' + #13#10 +
    '          ColonNode: Colon |:|' + #13#10 +
    '          TypeNode: Identifier |Integer|' + #13#10 +
    '          PortabilityDirectiveListNode: ListNode' + #13#10 +
    '          SemicolonNode: Semicolon |;|', RTVisibilitySection));
end;

end.
