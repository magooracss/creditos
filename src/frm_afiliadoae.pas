unit frm_afiliadoae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Buttons, ExtCtrls, dmgeneral
  ;

type

  { TfrmAfiliadoAE }

  TfrmAfiliadoAE = class(TForm)
    btnGrabarSalir: TBitBtn;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnTUGTipoDocumento: TSpeedButton;
    procedure btnGrabarSalirClick(Sender: TObject);
    procedure btnTUGTipoDocumentoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    _idAfiliado: GUID_ID;
    { private declarations }
  public
    property idAfiliado: GUID_ID read _idAfiliado write _idAfiliado;
  end;

var
  frmAfiliadoAE: TfrmAfiliadoAE;

implementation
{$R *.lfm}
uses
  dmafiliados
  ,frm_ediciontugs
  ,dmediciontugs
  ;

{ TfrmAfiliadoAE }
{ TODO 1 -oMagoo -cAfiliados : Al cargar un documento, controlar que el afiliado no esté cargado en otra empresa. Si lo está, preguntar y traerlo }
procedure TfrmAfiliadoAE.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDM_Afiliados, DM_Afiliados);
end;

procedure TfrmAfiliadoAE.btnGrabarSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfrmAfiliadoAE.btnTUGTipoDocumentoClick(Sender: TObject);
var
  pant: TfrmEdicionTugs;
  laTabla: TTablaTUG;
begin
  pant:= TfrmEdicionTugs.Create(self);

  laTabla:= TTablaTUG.Create;
  laTabla.nombre:= 'DOCUMENTOSTIPOS';
  laTabla.titulo:= 'Tipos de documento';
  laTabla.AgregarCampo('Tipo', 'Descripción');

  pant.laTUG:= laTabla;
  try
    if pant.ShowModal = mrOK then
    begin
       DM_General.LevantarTugsATablas();
    end;
  finally
    laTabla.Free;
    pant.Free;
  end;
end;

procedure TfrmAfiliadoAE.FormDestroy(Sender: TObject);
begin
  DM_Afiliados.Free;
end;

end.

