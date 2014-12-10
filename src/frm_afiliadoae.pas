unit frm_afiliadoae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, dmgeneral
  ;

type

  { TfrmAfiliadoAE }

  TfrmAfiliadoAE = class(TForm)
    btnGrabarSalir: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    ds_DocumentosTipos: TDataSource;
    DBEdit1: TDBEdit;
    ds_Afiliado: TDataSource;
    ds_Localidades: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PCAfiliado: TPageControl;
    Panel1: TPanel;
    btnTUGTipoDocumento: TSpeedButton;
    SpeedButton1: TSpeedButton;
    tabEmpresa: TTabSheet;
    tabNotas: TTabSheet;
    procedure btnGrabarSalirClick(Sender: TObject);
    procedure btnTUGTipoDocumentoClick(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    _idAfiliado: GUID_ID;
    _idEmpresa: GUID_ID;
    _Nuevo: Boolean; //Bandera para saber si estoy editando o insertando;

    procedure ValidarAfiliadoDocumento;
  public
    property idAfiliado: GUID_ID read _idAfiliado write _idAfiliado;
    property idEmpresa: GUID_ID read _idEmpresa write _idEmpresa;
  end;

var
  frmAfiliadoAE: TfrmAfiliadoAE;

{ TODO 1 -oMagoo -cAfiliados : No vincula el afiliado con la Empresa actual }
{ TODO 1 -oMagoo -cAfiliado : Si el afiliado existe, despliega la pantalla, pero no trae datos del afiliado }

implementation
{$R *.lfm}
uses
  dmafiliados
  ,frm_ediciontugs
  ,dmediciontugs
  ,frm_afiliadoinfoempresas
  ;

{ TfrmAfiliadoAE }
{ TODO 2 -oMagoo -cAfiliado : Agregar información de contacto (Tel, mail, etc) }
procedure TfrmAfiliadoAE.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDM_Afiliados, DM_Afiliados);
  DM_General.ReiniciarConsulta(DM_Afiliados.DocumentosTipos);
  DM_General.ReiniciarConsulta(DM_Afiliados.Localidades);

  _Nuevo:= False;
  _idAfiliado:= GUIDNULO;
  _idEmpresa:= GUIDNULO;
end;

procedure TfrmAfiliadoAE.btnGrabarSalirClick(Sender: TObject);
begin
  DM_Afiliados.Grabar;
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

  DM_Afiliados.idEmpresaActual:= _idEmpresa;
  DM_Afiliados.idAfiliadoActual:= _idAfiliado;

  if _idAfiliado = GUIDNULO then
  begin
     _Nuevo := True;
     _idAfiliado:= DM_Afiliados.Nuevo;
  end
  else
  begin
     _Nuevo:= False;
     DM_Afiliados.Editar(_idAfiliado);
  end;
end;

procedure TfrmAfiliadoAE.SpeedButton1Click(Sender: TObject);
var
  pant: TfrmEdicionTugs;
  laTabla: TTablaTUG;
begin
  pant:= TfrmEdicionTugs.Create(self);

  laTabla:= TTablaTUG.Create;
  laTabla.nombre:= 'LOCALIDADES';
  laTabla.titulo:= 'Localidades disponibles';
  laTabla.AgregarCampo('Localidad', 'Nombre Localidad');
  laTabla.AgregarCampo('CodigoPostal', 'Codigo Postal');


  pant.laTUG:= laTabla;
  try
    if pant.ShowModal = mrOK then
    begin
       DM_General.ReiniciarConsulta(DM_Afiliados.Localidades);
    end;
  finally
    laTabla.Free;
    pant.Free;
  end;
end;

procedure TfrmAfiliadoAE.ValidarAfiliadoDocumento;
var
 pantInfo: TfrmAfiliadoInfoEmpresas;
begin
  try
    pantInfo:= TfrmAfiliadoInfoEmpresas.Create(self);
    if (_Nuevo)
      and (DM_Afiliados.BuscarAfiliadoDocumento(
            DM_Afiliados.AfiliadosdocumentoTipo_id.asInteger
           ,DM_Afiliados.Afiliadosdocumento.asString
                                            )
           <> GUIDNULO
           ) then
    begin
      if (pantInfo.ShowModal = mrOK) then
      begin
        if (NOT DM_Afiliados.ExisteAfiliadoEmpresa(idAfiliado, idEmpresa)) then
          DM_Afiliados.CargarInfoAfiliadoPorEmpresa(idAfiliado,pantInfo.EmpresaSeleccionada ,idEmpresa )
        else
          ShowMessage ('El afiliado ya está cargado en esta empresa');
      end;
    end;
  finally
    pantInfo.Free;
  end;
end;

end.

