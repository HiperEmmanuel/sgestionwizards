unit SGestion.Wizards.Creator;

interface

uses
  SGestion.Wizards.Utils,
  ToolsAPI;

type
  TCreator = class(TInterfacedObject, IOTACreator)
    // IOTACreator
    function GetCreatorType: string; virtual;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
  end;
implementation

{$REGION 'IOTACreator'}

function TCreator.GetCreatorType: string;
begin
  Result := '';
end;

function TCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TCreator.GetOwner: IOTAModule;
begin
  Result := ActiveProject;
end;

function TCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

{$ENDREGION}

end.
