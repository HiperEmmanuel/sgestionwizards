unit SGestion.Wizards.Operacion.Wizard;

interface

uses
  SGestion.Wizards.Wizard,
  ToolsAPI;

resourcestring
  sDetallesTemplate = 'DetallesTemplate';
  sOperacionTemplate = 'OperacionTemplate';
  SName = 'SGestion Operation';
  SIDString = 'SGestion.Wizards.Operacion';

type
  TOperacionWizard = class(TWizard, IOTAFormWizard, IOTAFormWizard100)
  public
    function IsVisible(Project: IOTAProject): Boolean;
    //IOTAWizard
    procedure Execute; override;
    function GetIDString: string; override;
    function GetName: string; override;
  end;

implementation

uses
  SGestion.Wizards.Module.Creator,
  Vcl.Dialogs;

{ TCatalogoWizard }

{$REGION 'IOTAWizard'}

procedure TOperacionWizard.Execute;
var
  Name: string;
begin
  if InputQuery('Captura', 'Nombre de la tabla', Name) then
  begin
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TModuleCreator.Create(Name, sDetallesTemplate, True));
    (BorlandIDEServices as IOTAModuleServices).CreateModule(TModuleCreator.Create(Name, sOperacionTemplate));
  end;
end;

function TOperacionWizard.GetIDString: string;
begin
  Result:= SIDString;
end;

function TOperacionWizard.GetName: string;
begin
  Result:= SName;
end;

{$ENDREGION}

function TOperacionWizard.IsVisible(Project: IOTAProject): Boolean;
begin
  Result:= True;
end;

end.
