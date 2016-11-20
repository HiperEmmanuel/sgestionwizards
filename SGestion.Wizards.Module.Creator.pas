unit SGestion.Wizards.Module.Creator;

interface

uses
  ToolsAPI,
  SGestion.Wizards.Creator;

type
  TModuleCreator = class(TCreator, IOTAModuleCreator)
  private
    FName: string;
    FFormName: string;
    FIsMain: Boolean;
    FIsData: Boolean;
  public
    constructor Create(Name, FormName: string; IsData: Boolean = False; IsMain: Boolean = False);

    //IOTACreator
    function GetCreatorType: string; override;

    // IOTAModuleCreator
    function GetAncestorName: string; virtual;
    function GetImplFileName: string; virtual;
    function GetIntfFileName: string;
    function GetFormName: string; virtual;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

implementation

uses
  SGestion.Wizards.Utils,
  System.SysUtils;

constructor TModuleCreator.Create(Name, FormName: string;  IsData: Boolean = False; IsMain: Boolean = False);
begin
  FName:= Name;
  FFormName:= FormName;
  FIsMain:= IsMain;
  FIsData:= IsData;
end;


{$REGION 'IOTACreator'}

function TModuleCreator.GetCreatorType: string;
begin
  Result:= sForm;
end;

{$ENDREGION}

{$REGION 'IOTAModuleCreator'}

function TModuleCreator.GetAncestorName: string;
begin
  if FIsData then
    Result:= 'TDataModule'
  else
    Result := 'TForm';
end;

function TModuleCreator.GetImplFileName: string;
begin
  if FIsData then
    Result := GetCurrentDir + '\udm' + FName + '.pas'
  else
    Result := GetCurrentDir + '\ufrm' + FName + '.pas'
end;

function TModuleCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TModuleCreator.GetFormName: string;
begin
  if FIsData then
    Result := 'dm' + FName
  else
    Result := 'frm' + FName
end;

function TModuleCreator.GetMainForm: Boolean;
begin
  Result := FIsMain;
end;

function TModuleCreator.GetShowForm: Boolean;
begin
  Result := FIsMain;
end;

function TModuleCreator.GetShowSource: Boolean;
begin
  Result := FIsMain;
end;

function TModuleCreator.NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TResourceFile.Create(FName, FFormName + 'DFM');
end;

function TModuleCreator.NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := TResourceFile.Create(FName, FFormName + 'SRC');
end;

function TModuleCreator.NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

procedure TModuleCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
end;

{$ENDREGION}

end.
