unit SGestion.Wizards.Wizard;

interface

uses
  ToolsAPI;

resourcestring
  SComment = 'Creates a new SGestion Application';
  SAuthor = 'SGestion Development Team';
  SGalleryCategory = 'SGestion Library';
  SIDGalleryCategory = 'SGestion.Wizards';

type
  TWizard = class(TNotifierObject, IOTAWizard, IOTARepositoryWizard,
    IOTARepositoryWizard60, IOTARepositoryWizard80, IOTAProjectWizard,
    IOTAProjectWizard100)
    // IOTAWizard
    procedure Execute; virtual;
    procedure AfterSave;
    procedure BeforeSave;
    procedure Destroyed;
    procedure Modified;
    function GetIDString: string; virtual;
    function GetName: string; virtual;
    function GetState: TWizardState;

    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetGlyph: Cardinal;
    function GetPage: string;

    // IOTARepositoryWizard60
    function GetDesigner: string;

    // IOTARepositoryWizard80
    function GetGalleryCategory: IOTAGalleryCategory;
    function GetPersonality: string;

    // IOTAProjectWizard100
    function IsVisible(Project: IOTAProject): Boolean;
  end;

implementation

{$REGION 'IOTAWizard'}

procedure TWizard.Execute;
begin
end;

function TWizard.GetIDString: string;
begin
  Result := '';
end;

function TWizard.GetName: string;
begin
  Result := '';
end;

function TWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

procedure TWizard.AfterSave;
begin
end;

procedure TWizard.BeforeSave;
begin
end;

procedure TWizard.Destroyed;
begin
end;

procedure TWizard.Modified;
begin
end;

{$ENDREGION}

{$REGION 'IOTARepositoryWizard'}

function TWizard.GetAuthor: string;
begin
  Result := SAuthor;
end;

function TWizard.GetComment: string;
begin
  Result := SComment;
end;

function TWizard.GetGlyph: Cardinal;
begin
{ TODO : function TSGestionProjectWizard.GetGlyph: Cardinal; }
  Result := 0;
end;

function TWizard.GetPage: string;
begin
  Result := SGalleryCategory;
end;

{$ENDREGION}

{$REGION 'IOTARepositoryWizard60'}

function TWizard.GetDesigner: string;
begin
  Result := dAny;
end;

{$ENDREGION}

{$REGION 'IOTARepositoryWizard80'}

function TWizard.GetGalleryCategory: IOTAGalleryCategory;
begin
  Result := (BorlandIDEServices as IOTAGalleryCategoryManager).FindCategory(SIDGalleryCategory);
end;

function TWizard.GetPersonality: string;
begin
  Result := sDelphiPersonality;
end;

{$ENDREGION}

{$REGION 'IOTAProjectWizard100'}

function TWizard.IsVisible(Project: IOTAProject): Boolean;
begin
  Result := True;
end;

{$ENDREGION}

end.
