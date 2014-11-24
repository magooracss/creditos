unit frm_usuarioae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, DBGrids
  ,dmgeneral;

type

  { TfrmUsuarioAE }

  TfrmUsuarioAE = class(TForm)
    DBEdit2: TDBEdit;
    Usuarios: TDataSource;
    dsGruposUsuarios: TDataSource;
    DBCheckBox1: TDBCheckBox;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
{ TODO 1 -oMagoo -cSeguridad : Falta encriptar la clave antes de guardarla en la BD }
procedure TfrmUsuarioAE.FormShow(Sender: TObject);
begin
  if _idUsuario = GUIDNULO then
   _idUsuario:= DM_Seguridad.NuevoUsuario
  else
    DM_Seguridad.EditarUsuario (_idUsuario);
end;

end.

