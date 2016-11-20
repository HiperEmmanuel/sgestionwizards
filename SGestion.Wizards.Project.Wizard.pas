unit SGestion.Wizards.Project.Wizard;

interface

uses
  SGestion.Wizards.Wizard,
  ToolsAPI;

resourcestring
  SName = 'SGestion Application';
  SIDString = 'SGestion.Wizards.Project';

type
  TProjectWizard = class(TWizard)
  public
    constructor Create;

    //IOTAWizard
    procedure Execute; override;
    function GetIDString: string; override;
    function GetName: string; override;
  end;

implementation

uses
  SGestion.Wizards.Project.Creator;

{ TProjectWizard }

constructor TProjectWizard.Create;
var
  LCategoryServices: IOTAGalleryCategoryManager;
begin
  inherited Create;
  LCategoryServices := BorlandIDEServices as IOTAGalleryCategoryManager;
  LCategoryServices.AddCategory(LCategoryServices.FindCategory(sCategoryRoot), SIDString, SGalleryCategory);
end;

{$REGION 'IOTAWizard'}

procedure TProjectWizard.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TProjectCreator.Create);
end;

function TProjectWizard.GetIDString: string;
begin
  Result := SIDString ;
end;

function TProjectWizard.GetName: string;
begin
  Result := SName;
end;

{$ENDREGION}

end.
