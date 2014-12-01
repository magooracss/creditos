unit frm_ediciontugs; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, DBGrids, Buttons, DbCtrls, ZDataset, dmediciontugs
  ;

type

  { TfrmEdicionTugs }

  TfrmEdicionTugs = class(TForm)
    btnBorrar: TBitBtn;
    btnSalir: TBitBtn;
    ds_Resultados: TDatasource;
    laGrilla: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    stTitulo: TStaticText;
    procedure btnBorrarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    _laTug: TTablaTUG;
    procedure CargarTug (value: TTablaTUG);
    procedure ConfigurarGrilla;
    procedure AgregarColumna (laColumna: TColumn; campo, titulo: string);
  public
    property laTUG: TTablaTUG write CargarTug;
  end; 

var
  frmEdicionTugs: TfrmEdicionTugs;

implementation

{$R *.lfm}

{ TfrmEdicionTugs }

procedure TfrmEdicionTugs.btnBorrarClick(Sender: TObject);
begin
  if (MessageDlg ('ATENCION', 'Borro el item seleccionado?', mtConfirmation, [mbYes, mbNo],0 ) = mrYes) then
   DM_EdicionTUGs.EliminarFila;
end;

procedure TfrmEdicionTugs.btnSalirClick(Sender: TObject);
begin
  ModalResult:= mrOK;
end;

procedure TfrmEdicionTugs.FormCreate(Sender: TObject);
begin
  Application.CreateForm(TDM_EdicionTUGs, DM_EdicionTUGs);
end;

procedure TfrmEdicionTugs.FormDestroy(Sender: TObject);
begin
  DM_EdicionTUGs.Free;
end;

procedure TfrmEdicionTugs.FormShow(Sender: TObject);
begin
end;

procedure TfrmEdicionTugs.CargarTug(value: TTablaTUG);
var
  laTabla: TzTable;
begin
  _laTug:= value;
  stTitulo.Caption:= 'Edición de la tabla: ' + value.titulo;
  laTabla:= DM_EdicionTUGs.FindComponent('tbTabla') as tzTable;
  laTabla.Close;
  laTabla.TableName:= value.nombre;
  ds_Resultados.DataSet:= laTabla;
  laTabla.Open;
  ConfigurarGrilla;
end;

procedure TfrmEdicionTugs.AgregarColumna(laColumna: TColumn; campo,
  titulo: string);
var
  elCampo: TField;
begin
  laColumna.FieldName:= campo;
  laColumna.Title.Caption:= titulo;
  elCampo:= ds_Resultados.DataSet.Fields.FindField (campo);
  laColumna.Field.DisplayWidth:= 500;
  if elCampo.DataType in [ftFloat, ftCurrency] then
   laColumna.DisplayFormat:= '#######0.00';
end;


procedure TfrmEdicionTugs.ConfigurarGrilla;
var
  idx: integer;
  elCampo: TCampoTUG;
  laColumna: TColumn;

  elCampo2: TField;
begin
  laGrilla.Columns.Clear;
  for idx:= 0 to _laTug.CantidadCampos - 1 do
  begin
    elCampo:=  _laTug.DevolverCampo(idx);
    laGrilla.Columns.Add;
    AgregarColumna(laGrilla.Columns[idx]
                  ,elCampo.campo
                  ,elCampo.titulo
                  );
  end;

end;


end.

