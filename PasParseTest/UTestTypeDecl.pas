unit UTestTypeDecl;

interface

uses
  UTest;

type
  TTestTypeDecl = class(TTest)
  public
    class procedure TestAll; override;
    class function GetName: string; override;
  end;

implementation

uses
  UTestParser, URuleType;

{ TTestTypeDecl }

class function TTestTypeDecl.GetName: string;
begin
  Result := 'TypeDecl';
end;

class procedure TTestTypeDecl.TestAll;
begin
  OK('TFoo = Integer;', TTestParser.ParsesAs('TFoo = Integer;',
    'TypeDeclNode' + #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeKeywordNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = type Integer;', TTestParser.ParsesAs('TFoo = type Integer;',
    'TypeDeclNode' + #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeKeywordNode: TypeKeyword |type|' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = Integer experimental platform;', TTestParser.ParsesAs('TFoo = Integer experimental platform;',
    'TypeDeclNode' + #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeKeywordNode: (none)' + #13#10 +
    '  TypeNode: Identifier |Integer|' + #13#10 +
    '  PortabilityDirectiveListNode: ListNode' + #13#10 +
    '    Items[0]: ExperimentalSemikeyword |experimental|' + #13#10 +
    '    Items[1]: PlatformSemikeyword |platform|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('TFoo = class;', TTestParser.ParsesAs('TFoo = class;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |TFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: ClassKeyword |class|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = dispinterface;', TTestParser.ParsesAs('IFoo = dispinterface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: DispInterfaceKeyword |dispinterface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));

  OK('IFoo = interface;', TTestParser.ParsesAs('IFoo = interface;',
    'TypeForwardDeclarationNode' + #13#10 +
    '  NameNode: Identifier |IFoo|' + #13#10 +
    '  EqualSignNode: EqualSign |=|' + #13#10 +
    '  TypeNode: InterfaceKeyword |interface|' + #13#10 +
    '  SemicolonNode: Semicolon |;|', RTTypeDecl));    
end;

end.
