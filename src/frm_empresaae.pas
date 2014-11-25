unit frm_empresaae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, ExtCtrls, Buttons, ExtDlgs, dmempresas
  ,dmgeneral
  ;

type

  { TfrmEmpresaAE }

  TfrmEmpresaAE = class(TForm)
    btnCargarLogo: TBitBtn;
    btnGrabar: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    dsEmpresa: TDataSource;
    GroupBox1: TGroupBox;
    ImgLogo: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    OPD: TOpenPictureDialog;
    Panel1: TPanel;
    procedure btnCargarLogoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _idEmpresa: GUID_ID;
  public
    property idEmpresa: GUID_ID read _idEmpresa write _idEmpresa;
  end;

var
  frmEmpresaAE: TfrmEmpresaAE;

implementation

{$R *.lfm}

{ TfrmEmpresaAE }

procedure TfrmEmpresaAE.FormShow(Sender: TObject);
begin
  if _idEmpresa = GUIDNULO then
    dm_empresas.Nuevo
  else
    dm_empresas.Editar(_idEmpresa);
end;

procedure TfrmEmpresaAE.btnCargarLogoClick(Sender: TObject);
begin
  if OPD.Execute then
    ImgLogo.Picture.LoadFromFile(OPD.FileName);
end;

end.

