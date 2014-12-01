unit dmediciontugs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ZDataset, ZSqlUpdate, rxmemds
  ,dmConexion, db, IBConnection, sqldb;

type
  { TCampoTUG }

  TCampoTUG = class
  private
    _campoTug: string;
    _tituloCampo: string;
  public
    property campo: string read _campoTug write _campoTug;
    property titulo: string read _tituloCampo write _tituloCampo;

    constructor Create;
  end;

  { TTablaTUG }

  TTablaTUG= class
  private
    _nombreTabla: string;
    _tituloTabla: string;
    _ListaCampos: TList;
  public
    property nombre: string read _nombreTabla write _nombreTabla;
    property titulo: string read _tituloTabla write _tituloTabla;

    procedure AgregarCampo (nombreCampo, nombreTitulo: string);
    function DevolverCampo (posicion: Integer): TCampoTUG;
    function CantidadCampos: integer;


    constructor Create;
  end;


  { TDM_EdicionTUGs }

  TDM_EdicionTUGs = class(TDataModule)
    tbTabla: TZTable;
    procedure DataModuleCreate(Sender: TObject);
    procedure tbTablaAfterInsert(DataSet: TDataSet);
  private
    { private declarations }
  public
    function DevolverTField (elCampo: string): TField;
    procedure EliminarFila;
  end; 

var
  DM_EdicionTUGs: TDM_EdicionTUGs;

implementation

{ TDM_EdicionTUGs }
{ TODO 1 -oMagoo -cTUGs : No está funcionando para nada la asignación dinámica de tablas TUG }
procedure TDM_EdicionTUGs.DataModuleCreate(Sender: TObject);
begin

end;

procedure TDM_EdicionTUGs.tbTablaAfterInsert(DataSet: TDataSet);
begin
  With Dataset do
  begin
    FieldByName('id').asInteger:= -1;
    FieldByName('bVisible').asInteger:= 1;
  end;
end;

function TDM_EdicionTUGs.DevolverTField(elCampo: string): TField;
begin
  Result:= tbTabla.FindField(elCampo);
end;

procedure TDM_EdicionTUGs.EliminarFila;
begin
  with tbTabla do
  begin
    Edit;
    FieldByName('bVisible').asInteger:= 0;
    Post;
  end;
end;

{ TCampoTUG }

constructor TCampoTUG.Create;
begin
  inherited;
  campo:= EmptyStr;
  titulo:= EmptyStr;
end;

{$R *.lfm}

{ TTablaTUG }

procedure TTablaTUG.AgregarCampo(nombreCampo, nombreTitulo: string);
var
  elCampo: TCampoTUG;
begin
  elCampo:= TcampoTUG.Create;
  elCampo.titulo:= nombreTitulo;
  elCampo.campo:= nombreCampo;
  _ListaCampos.Add(elCampo);
end;

function TTablaTUG.DevolverCampo(posicion: Integer): TCampoTUG;
begin
  if posicion < _ListaCampos.Count then
    Result:= TCampoTUG(_ListaCampos.Items[posicion])
  else
    Result:= nil;
end;

function TTablaTUG.CantidadCampos: integer;
begin
  Result:= _ListaCampos.Count;
end;

constructor TTablaTUG.Create;
begin
  inherited;
  nombre:= EmptyStr;
  titulo:= EmptyStr;
  _ListaCampos:= TList.Create;
end;

end.

