unit dmConexion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Dialogs,
  ZConnection;

type

  { TDM_Conexion }

  TDM_Conexion = class(TDataModule)
    cnxBase: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure AbrirConexion;
  public
    { public declarations }
  end; 

var
  DM_Conexion: TDM_Conexion;

implementation
uses
   SD_Configuracion;
{ TDM_Conexion }

procedure TDM_Conexion.DataModuleCreate(Sender: TObject);
begin
  AbrirConexion;
end;


procedure TDM_Conexion.AbrirConexion;
var
 base: string;
 host: string;
begin
  if cnxBase.Connected then
   cnxBase.Disconnect;

  base:= LeerDato (SECCION_APP ,SERVIDOR_FB) ;
  if ((base <>  ERROR_APERTURA_CFG)
      and (base <> ERROR_CFG)) then
  begin
    base := base;
    host:= LeerDato (SECCION_APP, BASE_HOST);
    try
      with cnxBase do
      begin
        Database:=  base;
        HostName:= host;
        Connect;
      end;
    except
      Exception.Create('Error abriendo la base de datos');
    end;
  end
  else
    Exception.Create('Error abriendo la base de datos desde CFG');
end;

initialization
  {$I dmconexion.lrs}

end.

