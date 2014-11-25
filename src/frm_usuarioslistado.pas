unit frm_usuarioslistado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DBGrids, Buttons
  ,dmseguridad
  ,dmgeneral
  ;

type

  { TfrmUsuariosListado }

  TfrmUsuariosListado = class(TForm)
    btnSalir: TBitBtn;
    btnNuevoUsuario: TBitBtn;
    BitBtn3: TBitBtn;
    ds_usuarios: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure BitBtn3Click(Sender: TObject);
    procedure btnNuevoUsuarioClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure UsuarioAE(idUsuario: GUID_ID);
  public
    { public declarations }
  end;

var
  frmUsuariosListado: TfrmUsuariosListado;

implementation
{$R *.lfm}
uses
  frm_usuarioae
  ;

{ TfrmUsuariosListado }

procedure TfrmUsuariosListado.btnSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfrmUsuariosListado.FormShow(Sender: TObject);
begin
  DM_Seguridad.LevantarUsuarios;
end;

procedure TfrmUsuariosListado.UsuarioAE(idUsuario: GUID_ID);
var
  pant: TfrmUsuarioAE;
begin
  pant:= TfrmUsuarioAE.Create(self);
  try
    pant.idUsuario:= idUsuario;
    pant.ShowModal;
    DM_Seguridad.LevantarUsuarios
  finally
    pant.Free;
  end;
end;

procedure TfrmUsuariosListado.btnNuevoUsuarioClick(Sender: TObject);
begin
  UsuarioAE(GUIDNULO);
end;

procedure TfrmUsuariosListado.BitBtn3Click(Sender: TObject);
begin
  UsuarioAE(DM_Seguridad.qTodosLosUsuariosID.asString);
end;

end.

