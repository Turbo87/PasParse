unit UFileVisitor;

interface

type
  TFileVisitor = class(TObject)
  protected
    procedure Visit(AFilePath: string); virtual; abstract;

  public
    procedure VisitFiles(ADirectory: string; ARecursive: Boolean = False);
    procedure VisitFilesFiltered(ADirectory, AFilter: string;
                                 ARecursive: Boolean = False);
  end;

implementation

uses
  SysUtils;

{ TFileVisitor }

procedure TFileVisitor.VisitFiles(ADirectory: string; ARecursive: Boolean);
begin
  VisitFilesFiltered(ADirectory, '*', ARecursive);
end;

procedure TFileVisitor.VisitFilesFiltered(ADirectory, AFilter: string;
  ARecursive: Boolean);
var
  ASearchResult: TSearchRec;
begin
  // Add slash at the end if necessary
  if ADirectory[length(ADirectory)] <> '\' then
    ADirectory := ADirectory + '\';

  // Look for files in the current folder matching the filter
  if FindFirst(ADirectory + AFilter, faAnyFile - faDirectory, ASearchResult) = 0 then
  begin
    repeat
      // Call Visit() for each file
      Visit(ADirectory + ASearchResult.Name);
    until (FindNext(ASearchResult) <> 0);
    FindClose(ASearchResult);
  end;

  // If not recursive we don't have to visit subdirectories
  if not ARecursive then
    Exit;

  // Look for subdirectories in the current folder
  if FindFirst(ADirectory + '*', faDirectory, ASearchResult) = 0 then
  begin
    repeat
      // Recursively visit the subdirectories to find matching files
      if (ASearchResult.Name <> '.') and (ASearchResult.Name <> '..') then
        VisitFilesFiltered(ADirectory + ASearchResult.Name, AFilter, ARecursive);
    until (FindNext(ASearchResult) <> 0);
    FindClose(ASearchResult);
  end;
end;

end.
