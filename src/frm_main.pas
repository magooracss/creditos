unit frm_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ActnList, Menus, ExtCtrls, DBGrids, StdCtrls, Buttons
  , dmgeneral
  , dmseguridad
  ;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    afilListadoae: TAction;
    afilNuevo: TAction;
    empCambiar: TAction;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    imgLogo: TImage;
    MenuItem10: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    prgUsuarios: TAction;
    empListado: TAction;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    prgSalir: TAction;
    ActionList1: TActionList;
    Splitter1: TSplitter;
    st: TStatusBar;
    stCUIT: TStaticText;
    stRazonSocial: TStaticText;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure afilNuevoExecute(Sender: TObject);
    procedure empCambiarExecute(Sender: TObject);
    procedure empListadoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure prgSalirExecute(Sender: TObject);
    procedure prgUsuariosExecute(Sender: TObject);
  private
    idEmpresaActual: GUID_ID;

    procedure Inicializar;

    procedure LevantarEmpresa;
    procedure CambiarEmpresa;

    procedure pantallaAfiliado (idAfiliado: GUID_ID);
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
{$R *.lfm}
uses
  versioninfo
  ,frm_usuarioslistado
  ,dmempresas
  ,frm_empresaslistado
  ,SD_Configuracion
  ,frm_empresasseleccion
  ,frm_afiliadoae

  ;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Inicializar;
end;


procedure TfrmMain.prgSalirExecute(Sender: TObject);
begin
  Application.Terminate;
end;



procedure TfrmMain.Inicializar;
Var
  NroVersion: String;
  Info: TVersionInfo;
begin
  idEmpresaActual:= GUIDNULO;

  Info := TVersionInfo.Create;
  Info.Load(HINSTANCE);
  NroVersion := IntToStr(Info.FixedInfo.FileVersion[0])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[1])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[2])+'.'
                +IntToStr(Info.FixedInfo.FileVersion[3]);
  Info.Free;

  st.Panels[0].Text:= 'v:' + NroVersion;
  st.Panels[1].Text:= ' Usuario: ' + DM_Seguridad.usuario;
  st.Panels[2].Text:= FormatDateTime('dd/mm/yyyy', now)+ '        ';

  LevantarEmpresa;
end;



procedure TfrmMain.prgUsuariosExecute(Sender: TObject);
var
 pant: TfrmUsuariosListado;
begin
  pant:= TfrmUsuariosListado.Create(self);
  if DM_Seguridad.AccesoValido(USR_LISTA) then
  try
    pant.ShowModal;
  finally
    pant.Free;
  end
  else
    ShowMessage ('No tiene permisos para acceder a esta opción');
end;

(*******************************************************************************
**** EMPRESAS
********************************************************************************)

procedure TfrmMain.empListadoExecute(Sender: TObject);
var
 pant: TfrmEmpresasListado;
begin
  pant:= TfrmEmpresasListado.Create(self);
  try
    if DM_Seguridad.AccesoValido(EMPR_LISTA) then
      pant.ShowModal
    else
      ShowMessage ('No tiene permisos para acceder a esta opción');
  finally
    pant.Free;
  end;
end;

procedure TfrmMain.LevantarEmpresa;
begin
  idEmpresaActual := LeerDato (SECCION_APP ,ULT_EMPRESA);
  if idEmpresaActual <> GUIDNULO then
  begin
    dm_empresas.Editar(idEmpresaActual);
    stRazonSocial.Caption:= dm_empresas.EmpresasrazonSocial.AsString;
    stCUIT.Caption:= dm_empresas.Empresascuit.AsString;
    dm_empresas.MostrarLogo(imgLogo)
  end;
end;

procedure TfrmMain.CambiarEmpresa;
var
 pant: TfrmEmpresasSeleccion;
begin
  pant:= TfrmEmpresasSeleccion.Create(self);
  try
    if pant.ShowModal = mrOK then
    begin
     idEmpresaActual:= pant.idSeleccion;
     EscribirDato(SECCION_APP, ULT_EMPRESA, idEmpresaActual);
     LevantarEmpresa;
    end;
  finally
    pant.Free;
  end;

end;


procedure TfrmMain.empCambiarExecute(Sender: TObject);
begin
  if DM_Seguridad.AccesoValido(EMPR_CAMBIAR) then
    CambiarEmpresa
  else
    ShowMessage ('No tiene permisos para cambiar de empresa');
end;

(*******************************************************************************
**** AFILIADOS
********************************************************************************)

procedure TfrmMain.pantallaAfiliado(idAfiliado: GUID_ID);
var
  pant: TfrmAfiliadoAE;
begin
   pant:= TfrmAfiliadoAE.Create(self);
   try
     pant.idAfiliado:= idAfiliado;
     pant.ShowModal;
   finally
     pant.Free;
   end;
end;

procedure TfrmMain.afilNuevoExecute(Sender: TObject);
begin
  if DM_Seguridad.AccesoValido(AFIL_NUEVO) then
    pantallaAfiliado(GUIDNULO);
end;


end.

