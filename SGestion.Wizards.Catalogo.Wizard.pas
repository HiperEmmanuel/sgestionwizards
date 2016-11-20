unit SGestion.Wizards.Catalogo.Wizard;

interface

uses
  SGestion.Wizards.Wizard,
  ToolsAPI;

resourcestring
  sDatosTemplate = 'DatosTemplate';
  sCatalogoTemplate = 'CatalogoTemplate';
  SName = 'SGestion Catalog';
  SIDString = 'SGestion.Wizards.Catalogo';

type
  TCatalogoWizard = class(TWizard, IOTAFormWizard, IOTAFormWizard100)
  public
    //IOTAWizard
    procedure Execute; override;
    function GetIDString: string; override;
    function GetName: string; override;

    //IOTAFormWizard100
    function IsVisible(Project: IOTAProject): Boolean;
  end;

implementation

uses
  SGestion.Wizards.Module.Creator,
  Vcl.Dialogs;

{ TCatalogoWizard }

{$REGION 'IOTAWizard'}

procedure TCatalogoWizard.Execute;
var
  Name: string;
begin
  if InputQuery('Captura', 'Nombre de la tabla', Name) then
  begin
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TModuleCreator.Create(Name, sDatosTemplate, True));
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TModuleCreator.Create(Name, sCatalogoTemplate));
  end;
end;

function TCatalogoWizard.GetIDString: string;
begin
  Result:= SIDString;
end;

function TCatalogoWizard.GetName: string;
begin
  Result:= SName;
end;

{$ENDREGION}

{$REGION 'IOTAFormWizard100'}

function TCatalogoWizard.IsVisible(Project: IOTAProject): Boolean;
begin
  Result:= True;
end;

{$ENDREGION}

end.
