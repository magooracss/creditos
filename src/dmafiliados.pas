unit dmafiliados;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset, ZSqlUpdate
  ,dmConexion, dmgeneral;

type

  { TDM_Afiliados }

  TDM_Afiliados = class(TDataModule)
    AfiliadosContactoafiliado_id: TStringField;
    AfiliadosContactocontacto_id: TLongintField;
    AfiliadosContactoid: TStringField;
    AfiliadosContactoinfoContacto: TStringField;
    AfiliadosContactolxContacto: TStringField;
    afiliadosContactosDEL: TZQuery;
    afiliadosContactoSELAFILIADO_ID: TStringField;
    afiliadosContactoSELAFILIADO_ID1: TStringField;
    afiliadosContactoSELCONTACTO_ID: TLongintField;
    afiliadosContactoSELCONTACTO_ID1: TLongintField;
    afiliadosContactoSELID: TStringField;
    afiliadosContactoSELID1: TStringField;
    afiliadosContactoSELINFOCONTACTO: TStringField;
    afiliadosContactoSELINFOCONTACTO1: TStringField;
    afiliadoSELAPELLIDOS6: TStringField;
    afiliadoSELAPELLIDOS7: TStringField;
    afiliadoSELBVISIBLE6: TSmallintField;
    afiliadoSELBVISIBLE7: TSmallintField;
    afiliadoSELCUIT6: TStringField;
    afiliadoSELCUIT7: TStringField;
    afiliadoSELDOCUMENTO6: TStringField;
    afiliadoSELDOCUMENTO7: TStringField;
    afiliadoSELDOCUMENTOTIPO_ID6: TLongintField;
    afiliadoSELDOCUMENTOTIPO_ID7: TLongintField;
    afiliadoSELDOMICILIO6: TStringField;
    afiliadoSELDOMICILIO7: TStringField;
    afiliadoSELID6: TStringField;
    afiliadoSELID7: TStringField;
    afiliadoSELLOCALIDAD_ID6: TLongintField;
    afiliadoSELLOCALIDAD_ID7: TLongintField;
    afiliadoSELLXLOCALIDAD6: TStringField;
    afiliadoSELLXLOCALIDAD7: TStringField;
    afiliadoSELLXTIPODOCUMENTO6: TStringField;
    afiliadoSELLXTIPODOCUMENTO7: TStringField;
    afiliadoSELNOMBRES6: TStringField;
    afiliadoSELNOMBRES7: TStringField;
    afiliadoSELNOTAS6: TBlobField;
    afiliadoSELNOTAS7: TBlobField;
    afiliadosContactoINS: TZQuery;
    afiliadosContactoUPD: TZQuery;
    qContactosAfiliado: TZQuery;
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
    afiliadosContactoSEL: TZQuery;
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
    Contactos: TZQuery;
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
    ContactosBVISIBLE: TSmallintField;
    ContactosCONTACTO: TStringField;
    ContactosID: TLongintField;
    DocumentosTipos: TZQuery;
    BuscarAfiliadoDoc: TZQuery;
    Localidades: TZQuery;
    DocumentosTiposBVISIBLE: TSmallintField;
    DocumentosTiposID: TLongintField;
    DocumentosTiposTIPO: TStringField;
    Afiliados: TRxMemoryData;
    AfiliadosEmpresas: TRxMemoryData;
    Bancos: TZQuery;
    qContactosAfiliadoAFILIADO_ID: TStringField;
    qContactosAfiliadoCONTACTO_ID: TLongintField;
    qContactosAfiliadoID: TStringField;
    qContactosAfiliadoINFOCONTACTO: TStringField;
    qContactosAfiliadoLXCONTACTO: TStringField;
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
    AfiliadosContacto: TRxMemoryData;
    procedure AfiliadosAfterInsert(DataSet: TDataSet);
    procedure AfiliadosContactoAfterInsert(DataSet: TDataSet);
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
    procedure LevantarContactosAfiliado(idAfiliado: GUID_ID);
    function ExisteAfiliadoEmpresa (idAfiliado, idEmpresa: GUID_ID): Boolean;
    procedure CargarInfoAfiliadoPorEmpresa(idAfiliado , idEmpresaOrigen
            , idEmpresaDestino: GUID_ID);
    procedure BorrarContactoActual;


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
  LevantarContactosAfiliado(id);
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

procedure TDM_Afiliados.LevantarContactosAfiliado(idAfiliado: GUID_ID);
begin
  Contactos.Open;
  DM_General.ReiniciarTabla(AfiliadosContacto);
  with qContactosAfiliado do
  begin
    if active then close;
    ParamByName('id').AsString:= idAfiliado ;
    Open;
    AfiliadosContacto.LoadFromDataSet(qContactosAfiliado, 0, lmAppend);
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

procedure TDM_Afiliados.AfiliadosContactoAfterInsert(DataSet: TDataSet);
begin
  AfiliadosContactoid.asString:= DM_General.CrearGUID;
  AfiliadosContactoafiliado_id.asString:= _idAfiliadoActual;
  AfiliadosContactoinfoContacto.asString:= EmptyStr;
  AfiliadosContactocontacto_id.asInteger:= 0;
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

procedure TDM_Afiliados.BorrarContactoActual;
begin
  afiliadosContactosDEL.ParamByName('id').asString:= AfiliadosContactoid.AsString;
  afiliadosContactosDEL.ExecSQL;

  AfiliadosContacto.Delete;
end;

function TDM_Afiliados.Nuevo: GUID_ID;
var
  tmpID: GUID_ID;
begin
  DM_General.ReiniciarTabla(Afiliados);
  DM_General.ReiniciarTabla(AfiliadosEmpresas);
  DM_General.ReiniciarTabla(AfiliadosContacto);
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
  DM_General.ReiniciarTabla(AfiliadosContacto);
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
  LevantarContactosAfiliado(id);

end;

procedure TDM_Afiliados.Grabar;
begin
  DM_General.GrabarDatos(afiliadoSEL, afiliadoINS, afiliadoUPD, AFiliados, 'id' );
  DM_General.GrabarDatos(afiliadosEmpresaSEL, afiliadosEmpresaINS, afiliadosEmpresaUPD, AfiliadosEmpresas, 'id' );
  DM_General.GrabarDatos(afiliadosContactoSEL, afiliadosContactoINS, afiliadosContactoUPD, AfiliadosContacto, 'id' );
end;


end.

