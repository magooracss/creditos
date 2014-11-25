unit frm_usuarioae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, DBGrids, Buttons
  ,dmgeneral;

type

  { TfrmUsuarioAE }

  TfrmUsuarioAE = class(TForm)
    btnGrabarUsuario: TBitBtn;
    edClave: TEdit;
    Usuarios: TDataSource;
    dsGruposUsuarios: TDataSource;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnGrabarUsuarioClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _idUsuario: GUID_ID;
    { private declarations }
  public
    property idUsuario: GUID_ID read _idUsuario write _idUsuario;
  end;

var
  frmUsuarioAE: TfrmUsuarioAE;

implementation
{$R *.lfm}
uses
  dmseguridad;

{ TfrmUsuarioAE }
procedure TfrmUsuarioAE.FormShow(Sender: TObject);
begin
  if _idUsuario = GUIDNULO then
   begin
    _idUsuario:= DM_Seguridad.NuevoUsuario
   end
  else
    DM_Seguridad.EditarUsuario (_idUsuario);
end;

procedure TfrmUsuarioAE.btnGrabarUsuarioClick(Sender: TObject);
begin
  if TRIM (edClave.Text) <> EmptyStr then
    DM_Seguridad.cambiarClave (TRIM(edClave.Text));
  DM_Seguridad.GrabarUsuario;
  ModalResult:= mrOK;
end;

procedure TfrmUsuarioAE.FormCreate(Sender: TObject);
begin
  DM_Seguridad.LevantarGruposUsuarios;
end;


end.

