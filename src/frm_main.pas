unit frm_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ActnList, Menus
  , dmgeneral
  , dmseguridad
  ;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    prgUsuarios: TAction;
    empListado: TAction;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    prgSalir: TAction;
    ActionList1: TActionList;
    st: TStatusBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure empListadoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure prgSalirExecute(Sender: TObject);
    procedure prgUsuariosExecute(Sender: TObject);
  private
    procedure Inicializar;
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
  Application.CreateForm(Tdm_empresas, dm_empresas);
  pant:= TfrmEmpresasListado.Create(self);
  try
    if DM_Seguridad.AccesoValido(EMPR_LISTA) then
      pant.ShowModal
    else
      ShowMessage ('No tiene permisos para acceder a esta opción');
  finally
    pant.Free;
    DM_Seguridad.Free;
  end;
end;

end.

