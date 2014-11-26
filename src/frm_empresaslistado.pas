unit frm_empresaslistado;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, DBGrids
  ,dmempresas
  ,dmgeneral
  ;

type

  { TfrmEmpresasListado }

  TfrmEmpresasListado = class(TForm)
    btnSalir: TBitBtn;
    btnNuevaEmpresa: TBitBtn;
    btnEditarEmpresa: TBitBtn;
    BitBtn4: TBitBtn;
    dsEmpresas: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure BitBtn4Click(Sender: TObject);
    procedure btnEditarEmpresaClick(Sender: TObject);
    procedure btnNuevaEmpresaClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure EditarEmpresa (idEmpresa: GUID_ID);
  public
    { public declarations }
  end;

var
  frmEmpresasListado: TfrmEmpresasListado;

implementation
{$R *.lfm}
uses
  frm_empresaae
  ;

{ TfrmEmpresasListado }

procedure TfrmEmpresasListado.btnSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfrmEmpresasListado.FormShow(Sender: TObject);
begin
  dm_empresas.TodasLasEmpresas;
end;

procedure TfrmEmpresasListado.EditarEmpresa(idEmpresa: GUID_ID);
var
  pant: TfrmEmpresaAE;
begin
  pant:= TfrmEmpresaAE.Create(self);
  try
    pant.idEmpresa:= idEmpresa;
    pant.ShowModal;
  finally
    pant.Free;
  end;
end;

procedure TfrmEmpresasListado.btnNuevaEmpresaClick(Sender: TObject);
begin
  EditarEmpresa(GUIDNULO);
end;

procedure TfrmEmpresasListado.btnEditarEmpresaClick(Sender: TObject);
begin
  EditarEmpresa(dm_empresas.Empresasid.AsString);
end;

procedure TfrmEmpresasListado.BitBtn4Click(Sender: TObject);
begin
  if (MessageDlg ('ATENCION', 'Borro la empresa seleccionada?', mtConfirmation, [mbYes, mbNo],0 ) = mrYes) then
  begin
    DM_Empresas.eliminarEmpresa(dm_empresas.Empresasid.AsString);
    dm_empresas.TodasLasEmpresas;
  end;
end;

end.

