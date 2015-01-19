unit frm_contactosae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  Buttons, StdCtrls, dmgeneral;

type

  { TfrmContactoAE }

  TfrmContactoAE = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ds_contactos: TDataSource;
    ds_AfiliadosContacto: TDataSource;
    DBEdit1: TDBEdit;
    dbFormaContacto: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _id: GUID_ID;
    { private declarations }
  public
    property id: GUID_ID write _id;
  end;

var
  frmContactoAE: TfrmContactoAE;

implementation
{$R *.lfm}
uses
  dmafiliados;

{ TfrmContactoAE }

procedure TfrmContactoAE.BitBtn2Click(Sender: TObject);
begin
  DM_Afiliados.AfiliadosContacto.Cancel;
  ModalResult:= mrCancel;
end;

procedure TfrmContactoAE.FormShow(Sender: TObject);
begin
  DM_Afiliados.Contactos.Open;
  if _id = GUIDNULO then
  begin
    DM_Afiliados.AfiliadosContacto.Insert;
  end;
end;

procedure TfrmContactoAE.BitBtn1Click(Sender: TObject);
begin
  DM_Afiliados.AfiliadosContacto.Edit;
  DM_Afiliados.AfiliadosContactolxContacto.asString:= dbFormaContacto.Text;
  DM_Afiliados.AfiliadosContacto.Post;
  ModalResult:= mrOK;
end;


end.

