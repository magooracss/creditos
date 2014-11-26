unit frm_empresasseleccion;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, Buttons,
  DbCtrls, StdCtrls, DBGrids, dmgeneral;

type

  { TfrmEmpresasSeleccion }

  TfrmEmpresasSeleccion = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    ds_empresas: TDataSource;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    _idSeleccion: GUID_ID;
    { private declarations }
  public
    property idSeleccion: GUID_ID read _idSeleccion write _idSeleccion;
  end;

var
  frmEmpresasSeleccion: TfrmEmpresasSeleccion;

implementation
{$R *.lfm}
uses
  dmempresas;

{ TfrmEmpresasSeleccion }

procedure TfrmEmpresasSeleccion.BitBtn1Click(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfrmEmpresasSeleccion.BitBtn2Click(Sender: TObject);
begin
  _idSeleccion:= dm_empresas.Empresasid.AsString;
  ModalResult:= mrOK;
end;

procedure TfrmEmpresasSeleccion.FormCreate(Sender: TObject);
begin
  dm_empresas.TodasLasEmpresas;
end;

end.

