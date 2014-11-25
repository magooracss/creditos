program creditos;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, rxnew, zcomponent, frm_main, dmgeneral, versioninfo, dmconexion,
  SD_Configuracion
  ,sysutils, dmseguridad, frm_login, controls, frm_usuarioslistado, 
frm_usuarioae, frm_empresaslistado, dmempresas, frm_empresaae
  ;

{$R *.res}

begin
  Application.Title:='Creditos';
  RequireDerivedFormResource := True;
  Application.Initialize;

  if SD_Configuracion.LeerDato(SECCION_APP,CFG_SEP_DECIMAL) = ERROR_CFG then
  begin
    SD_Configuracion.EscribirDato(SECCION_APP,CFG_SEP_DECIMAL,'.');
    SD_Configuracion.EscribirDato(SECCION_APP,CFG_SEP_MILES,',');
  end;
  SysUtils.DefaultFormatSettings.DecimalSeparator:= SD_Configuracion.LeerDato(SECCION_APP,CFG_SEP_DECIMAL)[1];
  SysUtils.DefaultFormatSettings.ThousandSeparator:= SD_Configuracion.LeerDato(SECCION_APP,CFG_SEP_MILES)[1];
  Application.CreateForm(TDM_Conexion, DM_Conexion);
  Application.CreateForm(TDM_General, DM_General);
  Application.CreateForm(TDM_Seguridad, DM_Seguridad);

  frmLogin := TfrmLogin.Create(nil);
  if frmLogin.ShowModal <> mrOK then
  begin
    frmLogin.Free;
    Application.Terminate;
  end
  else
    frmLogin.Free;

  Application.CreateForm(TfrmMain, frmMain);


  Application.Run;
end.

