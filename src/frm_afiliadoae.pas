unit frm_afiliadoae;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, dbdateedit, Forms, Controls, Graphics,
  Dialogs, DbCtrls, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBGrids, dmgeneral
  ;

type

  { TfrmAfiliadoAE }

  TfrmAfiliadoAE = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    btnGrabarSalir: TBitBtn;
    DBGrid1: TDBGrid;
    ds_AfiliadoContacto: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit1: TDBEdit;
    dbApellidos: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dbDocTipo: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBMemo1: TDBMemo;
    ds_Reparticiones: TDataSource;
    ds_Bancos: TDataSource;
    ds_AfiliadosEstados: TDataSource;
    ds_empresaAfiliado: TDataSource;
    ds_DocumentosTipos: TDataSource;
    dbDocNro: TDBEdit;
    ds_Afiliado: TDataSource;
    ds_Localidades: TDataSource;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    PCAfiliado: TPageControl;
    Panel1: TPanel;
    btnTUGTipoDocumento: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    tabEmpresa: TTabSheet;
    tabNotas: TTabSheet;
    TabSheet1: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnGrabarSalirClick(Sender: TObject);
    procedure btnTUGTipoDocumentoClick(Sender: TObject);
    procedure dbDocNroChange(Sender: TObject);
    procedure dbDocNroExit(Sender: TObject);
    procedure dbDocNroKeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    _idAfiliado: GUID_ID;
    _idEmpresa: GUID_ID;
    sinValidar: boolean;
    _Nuevo: Boolean; //Bandera para saber si estoy editando o insertando;

    procedure ValidarAfiliadoDocumento;
    procedure pantContacto (id: GUID_ID);
  public
    property idAfiliado: GUID_ID read _idAfiliado write _idAfiliado;
    property idEmpresa: GUID_ID read _idEmpresa write _idEmpresa;
  end;

var
  frmAfiliadoAE: TfrmAfiliadoAE;


implementation
{$R *.lfm}
uses
  dmafiliados
  ,frm_ediciontugs
  ,dmediciontugs
  ,frm_afiliadoinfoempresas
  ,frm_contactosae
  ;

{ TfrmAfiliadoAE }
procedure TfrmAfiliadoAE.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDM_Afiliados, DM_Afiliados);
  DM_General.ReiniciarConsulta(DM_Afiliados.DocumentosTipos);
  DM_General.ReiniciarConsulta(DM_Afiliados.Localidades);
  DM_General.ReiniciarConsulta(DM_Afiliados.Bancos);
  DM_General.ReiniciarConsulta(DM_Afiliados.AfiliadosEstados);
  DM_General.ReiniciarConsulta(DM_Afiliados.Reparticiones);

  _Nuevo:= False;
  _idAfiliado:= GUIDNULO;
  _idEmpresa:= GUIDNULO;
  sinValidar:= True;

  PCAfiliado.ActivePage:= tabEmpresa;
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

procedure TfrmAfiliadoAE.dbDocNroChange(Sender: TObject);
begin
  sinValidar:= True;
end;

procedure TfrmAfiliadoAE.dbDocNroExit(Sender: TObject);
begin
  if (sinValidar) then
    ValidarAfiliadoDocumento;
end;

procedure TfrmAfiliadoAE.dbDocNroKeyPress(Sender: TObject; var Key: char);
begin
  if (key = #13) and (sinValidar) then
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

procedure TfrmAfiliadoAE.SpeedButton2Click(Sender: TObject);
var
  pant: TfrmEdicionTugs;
  laTabla: TTablaTUG;
begin
  pant:= TfrmEdicionTugs.Create(self);

  laTabla:= TTablaTUG.Create;
  laTabla.nombre:= 'Reparticiones';
  laTabla.titulo:= 'Reparticiones';
  laTabla.AgregarCampo('Reparticion', 'Nombre Reparticion');
  laTabla.AgregarCampo('Codigo', 'Codigo Reparticion');


  pant.laTUG:= laTabla;
  try
    if pant.ShowModal = mrOK then
    begin
       DM_General.ReiniciarConsulta(DM_Afiliados.Reparticiones);
    end;
  finally
    laTabla.Free;
    pant.Free;
  end;
end;

procedure TfrmAfiliadoAE.SpeedButton3Click(Sender: TObject);
var
  pant: TfrmEdicionTugs;
  laTabla: TTablaTUG;
begin
  pant:= TfrmEdicionTugs.Create(self);

  laTabla:= TTablaTUG.Create;
  laTabla.nombre:= 'Bancos';
  laTabla.titulo:= 'Bancos';
  laTabla.AgregarCampo('Banco', 'Nombre del Banco');

  pant.laTUG:= laTabla;
  try
    if pant.ShowModal = mrOK then
    begin
       DM_General.ReiniciarConsulta(DM_Afiliados.Bancos);
    end;
  finally
    laTabla.Free;
    pant.Free;
  end;
end;




procedure TfrmAfiliadoAE.ValidarAfiliadoDocumento;
var
 pantInfo: TfrmAfiliadoInfoEmpresas;
 elAfiliado: GUID_ID;
begin
  try
    elAfiliado:= GUIDNULO;
    pantInfo:= TfrmAfiliadoInfoEmpresas.Create(self);
    if (_Nuevo) then
    begin
      elAfiliado:= DM_Afiliados.BuscarAfiliadoDocumento(
            dbDocTipo.ListSource.DataSet.FieldByName('id').asInteger
           ,dbDocNro.Text);
    end;

    if (elAfiliado <> GUIDNULO) then
    begin
      pantInfo.idAfiliado:= elAfiliado;

      //Esto es para que no se me abra dos veces la pantalla de empresas
      sinValidar:= False;
      dbApellidos.SetFocus;

      if (pantInfo.ShowModal = mrOK) then
      begin
        if (NOT DM_Afiliados.ExisteAfiliadoEmpresa(elAfiliado, idEmpresa)) then
        begin
          DM_Afiliados.CargarInfoAfiliadoPorEmpresa(elAfiliado,pantInfo.EmpresaSeleccionada ,idEmpresa );
        end
        else
     //Tambien se puede editar el afiliado por este camino, por eso actualizo las ID al que viene de la base
          DM_Afiliados.idAfiliadoActual:= elAfiliado;
          _idAfiliado:= elAfiliado;
          ShowMessage ('El afiliado ya está cargado en esta empresa');
      end;

    end;
  finally
    pantInfo.Free;
  end;
end;

procedure TfrmAfiliadoAE.pantContacto(id: GUID_ID);
var
  pant: TfrmContactoAE;
begin
  pant:= TfrmContactoAE.Create(self);
  try
    pant.id:= id;
    pant.ShowModal;
  finally
    pant.free;
  end;
end;



procedure TfrmAfiliadoAE.BitBtn1Click(Sender: TObject);
begin
  pantContacto(GUIDNULO);
//  DM_Afiliados.LevantarContactosAfiliado(_idAfiliado);
end;

procedure TfrmAfiliadoAE.BitBtn2Click(Sender: TObject);
begin
  pantContacto(DM_Afiliados.AfiliadosContactoid.asString);
end;

procedure TfrmAfiliadoAE.BitBtn3Click(Sender: TObject);
begin
  if (MessageDlg ('ATENCION', 'Borro el contacto seleccionado?', mtConfirmation, [mbYes, mbNo],0 ) = mrYes) then
   DM_Afiliados.BorrarContactoActual;

end;

end.

