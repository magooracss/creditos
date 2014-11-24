unit frm_login;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons
  ,dmseguridad;

type

  { TfrmLogin }

  TfrmLogin = class(TForm)
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edUsuario: TLabeledEdit;
    edClave: TLabeledEdit;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edClaveKeyPress(Sender: TObject; var Key: char);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: char);
  private
    procedure ValidarUsuario;
  public
    { public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.lfm}

{ TfrmLogin }

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmLogin.btnAceptarClick(Sender: TObject);
begin
  ValidarUsuario;
end;

procedure TfrmLogin.edClaveKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    ValidarUsuario;
end;

procedure TfrmLogin.edUsuarioKeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
   edClave.SetFocus;
end;

procedure TfrmLogin.ValidarUsuario;
begin
  if DM_Seguridad.UsuarioValido(TRIM(edUsuario.Text), TRIM(edClave.Text)) then
    ModalResult:= mrOK
  else
  begin
    ShowMessage('Error al ingresar el usuario o la clave');
    edUsuario.SetFocus;
  end;
end;

end.

