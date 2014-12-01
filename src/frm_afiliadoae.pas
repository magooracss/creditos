unit frm_afiliadoae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Buttons, ExtCtrls, dmgeneral
  ;

type

  { TfrmAfiliadoAE }

  TfrmAfiliadoAE = class(TForm)
    btnGrabarSalir: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    ds_DocumentosTipos: TDataSource;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnTUGTipoDocumento: TSpeedButton;
    procedure btnGrabarSalirClick(Sender: TObject);
    procedure btnTUGTipoDocumentoClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _idAfiliado: GUID_ID;
    _Nuevo: Boolean; //Bandera para saber si estoy editando o insertando;

    procedure ValidarAfiliadoDocumento;
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
  DM_General.ReiniciarConsulta(DM_Afiliados.DocumentosTipos);
  _Nuevo:= False;
  _idAfiliado:= GUIDNULO;
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
       DM_General.ReiniciarConsulta(DM_Afiliados.DocumentosTipos);
    end;
  finally
    laTabla.Free;
    pant.Free;
  end;
end;

procedure TfrmAfiliadoAE.DBEdit1Exit(Sender: TObject);
begin
  ValidarAfiliadoDocumento;
end;

procedure TfrmAfiliadoAE.DBEdit1KeyPress(Sender: TObject; var Key: char);
begin
  if key = #13 then
    ValidarAfiliadoDocumento;
end;

procedure TfrmAfiliadoAE.FormDestroy(Sender: TObject);
begin
  DM_Afiliados.Free;
end;

procedure TfrmAfiliadoAE.FormShow(Sender: TObject);
begin
  if _idAfiliado = GUIDNULO then
  begin
     _Nuevo := True;
  end
  else
  begin
     _Nuevo:= False;
  end;
end;

procedure TfrmAfiliadoAE.ValidarAfiliadoDocumento;
begin
  if (_Nuevo)
   and (DM_Afiliados.BuscarAfiliadoDocumento(
            DM_Afiliados.AfiliadosdocumentoTipo_id.asInteger
           ,DM_Afiliados.Afiliadosdocumento.asString
                                            )
         <> GUIDNULO
       ) then
  begin
    if (MessageDlg ('ATENCION'
               , 'Ya existe un afiliado cargado en la BD. Traigo los datos a Pantalla?'
               , mtConfirmation, [mbYes, mbNo],0 ) = mrYes) then
     begin
      { TODO 1 -oMagoo -cAfiliados : Crear el código para traer un afiliado ya cargado de la base de datos a la pantalla de carga
 }
     end;
  end;
end;

end.

