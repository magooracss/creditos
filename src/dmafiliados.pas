unit dmafiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset, ZSqlUpdate
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
    afiliadoSELAPELLIDOS: TStringField;
    afiliadoSELBVISIBLE: TSmallintField;
    afiliadoSELCUIT: TStringField;
    afiliadoSELDOCUMENTO: TStringField;
    afiliadoSELDOCUMENTOTIPO_ID: TLongintField;
    afiliadoSELDOMICILIO: TStringField;
    afiliadoSELID: TStringField;
    afiliadoSELLOCALIDAD_ID: TLongintField;
    afiliadoSELLXLOCALIDAD: TStringField;
    afiliadoSELLXTIPODOCUMENTO: TStringField;
    afiliadoSELNOMBRES: TStringField;
    afiliadoSELNOTAS: TBlobField;
    AfiliadosEmpresasfAlta: TDateField;
    AfiliadosEmpresasfBaja: TDateField;
    AfiliadosEmpresaslxEstadoAfiliado: TStringField;
    AfiliadosEmpresaslxReparticion: TStringField;
    Afiliadosid: TStringField;
    AfiliadosLocalidad_id: TLongintField;
    AfiliadoslxLocalidad: TStringField;
    AfiliadoslxTipoDocumento: TStringField;
    AfiliadosNombres: TStringField;
    AfiliadosNotas: TBlobField;
    AfiliadosEmpresasafiliado_id: TStringField;
    AfiliadosEmpresasbanco_id: TLongintField;
    AfiliadosEmpresasempresa_id: TStringField;
    AfiliadosEmpresasestado_id: TLongintField;
    AfiliadosEmpresasftbVisible: TLongintField;
    AfiliadosEmpresasid: TStringField;
    AfiliadosEmpresasLegajo: TStringField;
    AfiliadosEmpresaslxEmpresa: TStringField;
    AfiliadosEmpresasnroAfiliado: TLongintField;
    AfiliadosEmpresasreparticion_id: TLongintField;
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
    Localidades: TZQuery;
    DocumentosTiposBVISIBLE: TSmallintField;
    DocumentosTiposID: TLongintField;
    DocumentosTiposTIPO: TStringField;
    Afiliados: TRxMemoryData;
    AfiliadosEmpresas: TRxMemoryData;
    LocalidadesBVISIBLE: TSmallintField;
    LocalidadesCODIGOPOSTAL: TStringField;
    LocalidadesID: TLongintField;
    LocalidadesLOCALIDAD: TStringField;
    qEmpresasAfiliado: TZQuery;
    afiliadoSEL: TZQuery;
    qEmpresaAfiliado: TZQuery;
    qEmpresasAfiliadoAFILIADO_ID: TStringField;
    qEmpresasAfiliadoAFILIADO_ID1: TStringField;
    qEmpresasAfiliadoBANCO_ID: TLongintField;
    qEmpresasAfiliadoBANCO_ID1: TLongintField;
    qEmpresasAfiliadoBVISIBLE: TSmallintField;
    qEmpresasAfiliadoBVISIBLE1: TSmallintField;
    qEmpresasAfiliadoEMPRESA_ID: TStringField;
    qEmpresasAfiliadoEMPRESA_ID1: TStringField;
    qEmpresasAfiliadoESTADO_ID: TSmallintField;
    qEmpresasAfiliadoESTADO_ID1: TSmallintField;
    qEmpresasAfiliadoFALTA: TDateField;
    qEmpresasAfiliadoFALTA1: TDateField;
    qEmpresasAfiliadoFBAJA: TDateField;
    qEmpresasAfiliadoFBAJA1: TDateField;
    qEmpresasAfiliadoID: TStringField;
    qEmpresasAfiliadoID1: TStringField;
    qEmpresasAfiliadoLEGAJO: TStringField;
    qEmpresasAfiliadoLEGAJO1: TStringField;
    qEmpresasAfiliadoLXEMPRESA: TStringField;
    qEmpresasAfiliadoLXEMPRESA1: TStringField;
    qEmpresasAfiliadoLXESTADOAFILIADO: TStringField;
    qEmpresasAfiliadoLXESTADOAFILIADO1: TStringField;
    qEmpresasAfiliadoLXREPARTICION: TStringField;
    qEmpresasAfiliadoLXREPARTICION1: TStringField;
    qEmpresasAfiliadoNROAFILIADO: TLongintField;
    qEmpresasAfiliadoNROAFILIADO1: TLongintField;
    qEmpresasAfiliadoREPARTICION_ID: TLongintField;
    qEmpresasAfiliadoREPARTICION_ID1: TLongintField;
    procedure AfiliadosAfterInsert(DataSet: TDataSet);
  private

  public
    //Si el afiliado no esta cargado en la base, devuelve un ID NULO
    function BuscarAfiliadoDocumento (tipo: integer; Nro: string): GUID_ID;
    procedure LevantarAfiliado (id: GUID_ID);

    procedure LevantarEmpresasAfiliado (idAfiliado: GUID_ID);
    function ExisteAfiliadoEmpresa (idAfiliado, idEmpresa: GUID_ID): Boolean;
    procedure CargarInfoAfiliadoPorEmpresa(idAfiliado , idEmpresaOrigen
            , idEmpresaActual: GUID_ID);

  end;

var
  DM_Afiliados: TDM_Afiliados;

implementation
{$R *.lfm}
uses
  dateutils;


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

procedure TDM_Afiliados.LevantarAfiliado(id: GUID_ID);
begin
  DM_General.ReiniciarTabla(Afiliados);
  with afiliadoSEL do
  begin
    if active then close;
    ParamByName('id').asString:= id;
    Open;
    Afiliados.LoadFromDataSet(afiliadoSEL, 0, lmAppend);
    close;
  end;
  LevantarEmpresasAfiliado (id);
end;

procedure TDM_Afiliados.LevantarEmpresasAfiliado(idAfiliado: GUID_ID);
begin
  DM_General.ReiniciarTabla(AfiliadosEmpresas);
  with qEmpresasAfiliado do
  begin
    if active then close;
    ParamByName('idAfiliado').AsString:= idAfiliado ;
    Open;
    AfiliadosEmpresas.LoadFromDataSet(qEmpresasAfiliado, 0, lmAppend);
    Close;
  end;
end;

procedure TDM_Afiliados.AfiliadosAfterInsert(DataSet: TDataSet);
begin
  Afiliadosid.AsString:= DM_General.CrearGUID;
  AfiliadosdocumentoTipo_id.asInteger:= 0;
  AfiliadosLocalidad_id.AsInteger:=0;
  AfiliadosbVisible.AsInteger:= 1;
end;

function TDM_Afiliados.ExisteAfiliadoEmpresa(idAfiliado, idEmpresa: GUID_ID
  ): Boolean;
begin
  with qEmpresaAfiliado do
  begin
    if active then close;
    ParamByName('idAfiliado').AsString:= idAfiliado;
    ParamByName('idEmpresa').asString:= idEmpresa;
    Open;
    Result:= (RecordCount > 0) ;
    Close;
  end;
end;

procedure TDM_Afiliados.CargarInfoAfiliadoPorEmpresa(idAfiliado,
  idEmpresaOrigen, idEmpresaActual: GUID_ID);
begin
  LevantarAfiliado(idAfiliado);
  DM_General.ReiniciarTabla(AfiliadosEmpresas);
  With qEmpresaAfiliado do
  begin
    if active then close;
    ParamByName('idAfiliado').asString:= idAfiliado;
    ParamByName('idEmpresa').asString:= idEmpresaOrigen;           ;
    Open;
    AfiliadosEmpresas.LoadFromDataSet(qEmpresaAfiliado, 0, lmAppend);
    close;
  end;

  //Edito los datos para generar un registro nuevo
  AfiliadosEmpresas.Edit;
  AfiliadosEmpresasid.AsString:= DM_General.CrearGUID;
  AfiliadosEmpresasempresa_id.asString:= idEmpresaActual;
  AfiliadosEmpresasfAlta.AsDateTime:= DateOf(Now);
  AfiliadosEmpresas.Post;
end;



end.

