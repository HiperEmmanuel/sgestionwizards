unit SGestion.Wizards.Reg;

interface


procedure Register;

implementation

uses
  ToolsAPI, SGestion.Wizards.Project.Wizard, SGestion.Wizards.Catalogo.Wizard,
  SGestion.Wizards.Operacion.Wizard;

procedure Register;
begin
  RegisterPackageWizard(TProjectWizard.Create);
  RegisterPackageWizard(TCatalogoWizard.Create);
  RegisterPackageWizard(TOperacionWizard.Create);
end;

end.
