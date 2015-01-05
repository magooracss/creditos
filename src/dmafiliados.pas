unit dmafiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset, ZSqlUpdate
  ,dmConexion, dmgeneral;

type

  { TDM_Afiliados }

  TDM_Afiliados = class(TDataModule)
    afiliadosEmpresaINS: TZQuery;
    AfiliadosEmpresasbVisible: TLongintField;
    AfiliadosEmpresasCuotaSocial: TFloatField;
    afiliadosEmpresaSEL: TZQuery;
    afiliadoSELAPELLIDOS4: TStringField;
    afiliadoSELAPELLIDOS5: TStringField;
    afiliadoSELBVISIBLE4: TSmallintField;
    afiliadoSELBVISIBLE5: TSmallintField;
    afiliadoSELCUIT4: TStringField;
    afiliadoSELCUIT5: TStringField;
    afiliadoSELDOCUMENTO4: TStringField;
    afiliadoSELDOCUMENTO5: TStringField;
    afiliadoSELDOCUMENTOTIPO_ID4: TLongintField;
    afiliadoSELDOCUMENTOTIPO_ID5: TLongintField;
    afiliadoSELDOMICILIO4: TStringField;
    afiliadoSELDOMICILIO5: TStringField;
    afiliadoSELID4: TStringField;
    afiliadoSELID5: TStringField;
    afiliadoSELLOCALIDAD_ID4: TLongintField;
    afiliadoSELLOCALIDAD_ID5: TLongintField;
    afiliadoSELLXLOCALIDAD4: TStringField;
    afiliadoSELLXLOCALIDAD5: TStringField;
    afiliadoSELLXTIPODOCUMENTO4: TStringField;
    afiliadoSELLXTIPODOCUMENTO5: TStringField;
    afiliadoSELNOMBRES4: TStringField;
    afiliadoSELNOMBRES5: TStringField;
    afiliadoSELNOTAS4: TBlobField;
    afiliadoSELNOTAS5: TBlobField;
    afiliadosEmpresaSELAFILIADO_ID: TStringField;
    afiliadosEmpresaSELBANCO_ID: TLongintField;
    afiliadosEmpresaSELBVISIBLE: TSmallintField;
    afiliadosEmpresaSELCUOTASOCIAL: TFloatField;
    afiliadosEmpresaSELEMPRESA_ID: TStringField;
    afiliadosEmpresaSELESTADO_ID: TSmallintField;
    afiliadosEmpresaSELFALTA: TDateField;
    afiliadosEmpresaSELFBAJA: TDateField;
    afiliadosEmpresaSELID: TStringField;
    afiliadosEmpresaUPD: TZQuery;
    afiliadosEmpresaSELLEGAJO: TStringField;
    afiliadosEmpresaSELNROAFILIADO: TLongintField;
    afiliadosEmpresaSELREPARTICION_ID: TLongintField;
    AfiliadosEstadosBVISIBLE: TSmallintField;
    AfiliadosEstadosESTADO: TStringField;
    AfiliadosEstadosID: TLongintField;
    afiliadoUPD: TZQuery;
    AfiliadosApellidos: TStringField;
    AfiliadosbVisible: TLongintField;
    AfiliadosCUIT: TStringField;
    Afiliadosdocumento: TStringField;
    AfiliadosdocumentoTipo_id: TLongintField;
    AfiliadosDomicilio: TStringField;
    afiliadoINS: TZQuery;
    afiliadoSELAPELLIDOS: TStringField;
    afiliadoSELAPELLIDOS1: TStringField;
    afiliadoSELAPELLIDOS2: TStringField;
    afiliadoSELBVISIBLE: TSmallintField;
    afiliadoSELBVISIBLE1: TSmallintField;
    afiliadoSELBVISIBLE2: TSmallintField;
    afiliadoSELCUIT: TStringField;
    afiliadoSELCUIT1: TStringField;
    afiliadoSELCUIT2: TStringField;
    afiliadoSELDOCUMENTO: TStringField;
    afiliadoSELDOCUMENTO1: TStringField;
    afiliadoSELDOCUMENTO2: TStringField;
    afiliadoSELDOCUMENTOTIPO_ID: TLongintField;
    afiliadoSELDOCUMENTOTIPO_ID1: TLongintField;
    afiliadoSELDOCUMENTOTIPO_ID2: TLongintField;
    afiliadoSELDOMICILIO: TStringField;
    afiliadoSELDOMICILIO1: TStringField;
    afiliadoSELDOMICILIO2: TStringField;
    afiliadoSELID: TStringField;
    afiliadoSELID1: TStringField;
    afiliadoSELID2: TStringField;
    afiliadoSELLOCALIDAD_ID: TLongintField;
    afiliadoSELLOCALIDAD_ID1: TLongintField;
    afiliadoSELLOCALIDAD_ID2: TLongintField;
    afiliadoSELLXLOCALIDAD: TStringField;
    afiliadoSELLXLOCALIDAD1: TStringField;
    afiliadoSELLXLOCALIDAD2: TStringField;
    afiliadoSELLXTIPODOCUMENTO: TStringField;
    afiliadoSELLXTIPODOCUMENTO1: TStringField;
    afiliadoSELLXTIPODOCUMENTO2: TStringField;
    afiliadoSELNOMBRES: TStringField;
    afiliadoSELNOMBRES1: TStringField;
    afiliadoSELNOMBRES2: TStringField;
    afiliadoSELNOTAS: TBlobField;
    afiliadoSELNOTAS1: TBlobField;
    afiliadoSELNOTAS2: TBlobField;
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
    AfiliadosEmpresasid: TStringField;
    AfiliadosEmpresasLegajo: TStringField;
    AfiliadosEmpresaslxEmpresa: TStringField;
    AfiliadosEmpresasnroAfiliado: TLongintField;
    AfiliadosEmpresasreparticion_id: TLongintField;
    BancosBANCO: TStringField;
    BancosBVISIBLE: TSmallintField;
    BancosCODIGO: TStringField;
    BancosID: TLongintField;
    BancosPRESTACIONBAPRO: TSmallintField;
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
    Bancos: TZQuery;
    Reparticiones: TZQuery;
    AfiliadosEstados: TZQuery;
    LocalidadesBVISIBLE: TSmallintField;
    LocalidadesCODIGOPOSTAL: TStringField;
    LocalidadesID: TLongintField;
    LocalidadesLOCALIDAD: TStringField;
    qEmpresaAfiliadoCUOTASOCIAL: TFloatField;
    qEmpresasAfiliado: TZQuery;
    afiliadoSEL: TZQuery;
    qEmpresaAfiliado: TZQuery;
    qEmpresasAfiliadoAFILIADO_ID: TStringField;
    qEmpresasAfiliadoAFILIADO_ID1: TStringField;
    qEmpresasAfiliadoBANCO_ID: TLongintField;
    qEmpresasAfiliadoBANCO_ID1: TLongintField;
    qEmpresasAfiliadoBVISIBLE: TSmallintField;
    qEmpresasAfiliadoBVISIBLE1: TSmallintField;
    qEmpresasAfiliadoCUOTASOCIAL: TFloatField;
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
    ReparticionesBVISIBLE: TSmallintField;
    ReparticionesCODIGO: TStringField;
    ReparticionesID: TLongintField;
    ReparticionesREPARTICION: TStringField;
    procedure AfiliadosAfterInsert(DataSet: TDataSet);
    procedure AfiliadosEmpresasAfterInsert(DataSet: TDataSet);
  private
     _idAfiliadoActual: GUID_ID;
     _idEmpresaActual: GUID_ID;
  public
    property idAfiliadoActual: GUID_ID read _idAfiliadoActual write _idAfiliadoActual;
    property idEmpresaActual: GUID_ID read _idEmpresaActual write _idEmpresaActual;

    //Si el afiliado no esta cargado en la base, devuelve un ID NULO
    function BuscarAfiliadoDocumento (tipo: integer; Nro: string): GUID_ID;
    procedure LevantarAfiliado (id: GUID_ID);

    procedure LevantarEmpresasAfiliado (idAfiliado: GUID_ID);
    function ExisteAfiliadoEmpresa (idAfiliado, idEmpresa: GUID_ID): Boolean;
    procedure CargarInfoAfiliadoPorEmpresa(idAfiliado , idEmpresaOrigen
            , idEmpresaDestino: GUID_ID);

    function Nuevo: GUID_ID;
    procedure Editar (id: GUID_ID);
    procedure Grabar;

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

procedure TDM_Afiliados.AfiliadosEmpresasAfterInsert(DataSet: TDataSet);
begin
  AfiliadosEmpresasid.asString:= DM_General.CrearGUID;
  AfiliadosEmpresasafiliado_id.AsString:= _idAfiliadoActual;
  AfiliadosEmpresasempresa_id.AsString:= _idEmpresaActual;
  AfiliadosEmpresasfAlta.AsDateTime:= Now;
  AfiliadosEmpresasbVisible.AsInteger:= 1;
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
  idEmpresaOrigen, idEmpresaDestino: GUID_ID);
begin
  Editar (idAfiliado);

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
  AfiliadosEmpresasafiliado_id.AsString:= Afiliadosid.AsString;
  AfiliadosEmpresasid.AsString:= DM_General.CrearGUID;
  AfiliadosEmpresasempresa_id.asString:= idEmpresaDestino;
  AfiliadosEmpresasfAlta.AsDateTime:= DateOf(Now);
  AfiliadosEmpresas.Post;

end;

function TDM_Afiliados.Nuevo: GUID_ID;
var
  tmpID: GUID_ID;
begin
  DM_General.ReiniciarTabla(Afiliados);
  DM_General.ReiniciarTabla(AfiliadosEmpresas);
  tmpID:= DM_General.CrearGUID;
  Afiliados.Insert;
  Afiliadosid.AsString:= tmpID;
  _idAfiliadoActual:= tmpID;
  Result:= tmpID;
end;

procedure TDM_Afiliados.Editar(id: GUID_ID);
begin
  DM_General.ReiniciarTabla(Afiliados);
  DM_General.ReiniciarTabla(AfiliadosEmpresas);
  _idAfiliadoActual:= id;
  with afiliadoSEL do
  begin
    if active then close;
    ParamByName('id').AsString:= id;
    Open;
    Afiliados.LoadFromDataSet(afiliadoSEL, 0, lmAppend);
    close;
  end;

  LevantarEmpresasAfiliado(id);
end;

procedure TDM_Afiliados.Grabar;
begin
  DM_General.GrabarDatos(afiliadoSEL, afiliadoINS, afiliadoUPD, AFiliados, 'id' );
  DM_General.GrabarDatos(afiliadosEmpresaSEL, afiliadosEmpresaINS, afiliadosEmpresaUPD, AfiliadosEmpresas, 'id' );
end;


end.

