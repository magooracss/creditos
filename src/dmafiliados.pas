unit dmafiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset
  ,dmConexion, dmgeneral;

type

  { TDM_Afiliados }

  TDM_Afiliados = class(TDataModule)
    AfiliadosApellidos: TStringField;
    AfiliadosbVisible: TLongintField;
    AfiliadosCUIT: TStringField;
    Afiliadosdocumento: TStringField;
    AfiliadosdocumentoTipo_id: TLongintField;
    AfiliadosDomicilio: TStringField;
    Afiliadosid: TStringField;
    AfiliadosLocalidad_id: TLongintField;
    AfiliadosNombres: TStringField;
    AfiliadosNotas: TBlobField;
    BuscarAfiliadoDocAPELLIDOS: TStringField;
    BuscarAfiliadoDocBVISIBLE: TSmallintField;
    BuscarAfiliadoDocCUIT: TStringField;
    BuscarAfiliadoDocDOCUMENTO: TStringField;
    BuscarAfiliadoDocDOCUMENTOTIPO_ID: TLongintField;
    BuscarAfiliadoDocDOMICILIO: TStringField;
    BuscarAfiliadoDocID: TStringField;
    BuscarAfiliadoDocLOCALIDAD_ID: TLongintField;
    BuscarAfiliadoDocNOMBRES: TStringField;
    BuscarAfiliadoDocNOTAS: TBlobField;
    DocumentosTipos: TZQuery;
    BuscarAfiliadoDoc: TZQuery;
    DocumentosTiposBVISIBLE: TSmallintField;
    DocumentosTiposID: TLongintField;
    DocumentosTiposTIPO: TStringField;
    Afiliados: TRxMemoryData;
    procedure AfiliadosAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    //Si el afiliado no esta cargado en la base, devuelve un ID NULO
    function BuscarAfiliadoDocumento (tipo: integer; Nro: string): GUID_ID;
  end;

var
  DM_Afiliados: TDM_Afiliados;

implementation

{$R *.lfm}

{ TDM_Afiliados }

function TDM_Afiliados.BuscarAfiliadoDocumento(tipo: integer; Nro: string
  ): GUID_ID;
begin
  with BuscarAfiliadoDoc do
  begin
    if active then close;
    ParamByName ('tipo').asInteger:= tipo;
    ParamByName ('documento').asString:= Nro;
    Open;
    if RecordCount > 0 then
     Result:= BuscarAfiliadoDocID.AsString
    else
      Result:=  GUIDNULO;
  end;
end;

procedure TDM_Afiliados.AfiliadosAfterInsert(DataSet: TDataSet);
begin
  Afiliadosid.AsString:= DM_General.CrearGUID;
  AfiliadosdocumentoTipo_id.asInteger:= 0;
  AfiliadosLocalidad_id.AsInteger:=0;
  AfiliadosbVisible.AsInteger:= 1;
end;

procedure TDM_Afiliados.DataModuleCreate(Sender: TObject);
begin

end;


end.

