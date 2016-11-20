unit SGestion.Wizards.Project.Creator;

interface

uses
  SGestion.Wizards.Creator,
  ToolsAPI;

resourcestring
  sProject = 'SGestion';
  sBase = 'Base';
  sMain = 'Main';
  sData = 'Datos';
  sCatalogo = 'Catalogo';
  sDetalles = 'Detalles';
  sOperacion = 'Operacion';

type
  TProjectCreator = class(TCreator, IOTAProjectCreator50, IOTAProjectCreator80,
    IOTAProjectCreator160, IOTAProjectCreator)
  public
    // IOTAProjectCreator
    function GetFileName: string;
    function GetOptionFileName: string; deprecated;
    function GetShowSource: Boolean;
    procedure NewDefaultModule; deprecated;
    function NewOptionSource(const ProjectName: string): IOTAFile; deprecated;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile;

    // IOTAProjectCreator50
    procedure NewDefaultProjectModule(const Project: IOTAProject);

    // IOTAProjectCreator80
    function GetProjectPersonality: string;

    // IOTAProjectCreator160
    function GetFrameworkType: string;
    function GetPlatforms: TArray<string>;
    function GetPreferredPlatform: string;
    procedure SetInitialOptions(const NewProject: IOTAProject);
  end;

implementation

uses
  SGestion.Wizards.Utils,
  SGestion.Wizards.Module.Creator,
  PlatformAPI,
  System.SysUtils;

{$REGION 'IOTAProjectCreator'}

function TProjectCreator.GetFileName: string;
begin
  Result := GetCurrentDir + '\' + sProject + '.dpr';
end;

function TProjectCreator.GetOptionFileName: string; deprecated;
begin
  Result := '';
end;

function TProjectCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TProjectCreator.NewProjectSource(const ProjectName: string): IOTAFile;
begin
  Result := TResourceFile.Create(EmptyStr, sProject);
end;

function TProjectCreator.NewOptionSource(const ProjectName: string): IOTAFile; deprecated;
begin
  Result := nil;
end;

procedure TProjectCreator.NewDefaultModule; deprecated;
begin
end;

procedure TProjectCreator.NewProjectResource(const Project: IOTAProject);
begin
end;

{$ENDREGION}

{$REGION 'IOTAProjectCreator50'}

procedure TProjectCreator.NewDefaultProjectModule(const Project: IOTAProject);
var
  ms: IOTAModuleServices;
begin
  ms := BorlandIDEServices as IOTAModuleServices;
  ms.CreateModule(TModuleCreator.Create(sBase, sBase, True));
  ms.CreateModule(TModuleCreator.Create(sMain, sMain, False, True));
  ms.CreateModule(TModuleCreator.Create(sData, sData, True));
  ms.CreateModule(TModuleCreator.Create(sCatalogo, sCatalogo));
  ms.CreateModule(TModuleCreator.Create(sDetalles, sDetalles, True));
  ms.CreateModule(TModuleCreator.Create(sOperacion, sOperacion));
end;

{$ENDREGION}

{$REGION 'IOTAProjectCreator80'}

function TProjectCreator.GetProjectPersonality: string;
begin
  Result := sDelphiPersonality;
end;

{$ENDREGION}

{$REGION 'IOTAProjectCreator160'}

function TProjectCreator.GetFrameworkType: string;
begin
  Result := sFrameworkTypeVCL;
end;

function TProjectCreator.GetPlatforms: TArray<string>;
begin
  SetLength(Result, 2);
  Result[0] := cWin32Platform;
  Result[1] := cWin64Platform;
end;

function TProjectCreator.GetPreferredPlatform: string;
begin
  Result := cWin32Platform;
end;

procedure TProjectCreator.SetInitialOptions(const NewProject: IOTAProject);
begin
end;

{$ENDREGION}

end.
