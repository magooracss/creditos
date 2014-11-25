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
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dsEmpresas: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    procedure btnNuevaEmpresaClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
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

{ TODO 1 -oMagoo -cEmpresas : Terminar ABM de empresas }
procedure TfrmEmpresasListado.btnSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
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

end.

