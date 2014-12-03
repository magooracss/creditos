unit frm_afiliadoinfoempresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DBGrids, DbCtrls, StdCtrls, Buttons
  ,dmgeneral
  ;

type

  { TfrmAfiliadoInfoEmpresas }

  TfrmAfiliadoInfoEmpresas = class(TForm)
    btnSalir: TBitBtn;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    dsAfiliado: TDataSource;
    DBGrid1: TDBGrid;
    dsAfiliadoEmpresas: TDataSource;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure btnSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _idAfiliado: GUID_ID;
    function getEmpresaSeleccionada: GUID_ID;
    procedure LevantarAfiliado;
  public
    property idAfiliado: GUID_ID read _idAfiliado write _idAfiliado;
    property EmpresaSeleccionada: GUID_ID read getEmpresaSeleccionada;
  end;

var
  frmAfiliadoInfoEmpresas: TfrmAfiliadoInfoEmpresas;

implementation
{$R *.lfm}
uses
  dmafiliados
  ,dmempresas
  ;

{ TODO 3 -oMagoo -cAfiliados : Cuando este lista la parte de creditos, mostrar la información de Cantidad de creditos y Saldo por empresa }

{ TfrmAfiliadoInfoEmpresas }

procedure TfrmAfiliadoInfoEmpresas.FormShow(Sender: TObject);
begin
  LevantarAfiliado;
end;

procedure TfrmAfiliadoInfoEmpresas.btnSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfrmAfiliadoInfoEmpresas.LevantarAfiliado;
begin
  DM_Afiliados.LevantarAfiliado(idAfiliado);
end;

function TfrmAfiliadoInfoEmpresas.getEmpresaSeleccionada: GUID_ID;
begin
  if DM_Afiliados.AfiliadosEmpresas.IsEmpty then
    Result:= GUIDNULO
  else
    Result:= DM_Afiliados.AfiliadosEmpresasempresa_id.AsString;
end;

end.

