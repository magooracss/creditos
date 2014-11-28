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
    tugAbonosABONO: TStringField;
    tugAbonosBVISIBLE: TSmallintField;
    tugAbonosIDABONO: TLongintField;
    tugAbonosMONTO: TFloatField;
    tugAlternaControladaALTERNACONTROLADA: TStringField;
    tugAlternaControladaBVISIBLE: TSmallintField;
    tugAlternaControladaIDALTERNACONTROLADA: TLongintField;
    tugBancosBANCO: TStringField;
    tugBancosBVISIBLE: TSmallintField;
    tugBancosIDBANCO: TLongintField;
    TUGCABPARACAIDASCONTRAPESOOTROBVISIBLE: TSmallintField;
    TUGCABPARACAIDASCONTRAPESOOTROCABPARACAIDASCONTRAPESOOTRO: TStringField;
    TUGCABPARACAIDASCONTRAPESOOTROIDCABPARACAIDASCONTRAPESOOTRO: TLongintField;
    TUGCABPARACAIDASOTROBVISIBLE: TSmallintField;
    TUGCABPARACAIDASOTROCABPARACAIDASOTRO: TStringField;
    TUGCABPARACAIDASOTROIDCABPARACAIDASOTRO: TLongintField;
    TUGCHEQUESESTADOSBVISIBLE: TSmallintField;
    TUGCHEQUESESTADOSCHEQUEESTADO: TStringField;
    TUGCHEQUESESTADOSIDCHEQUEESTADO: TLongintField;
    TUGCONCEPTOSBVISIBLE: TSmallintField;
    TUGCONCEPTOSCONCEPTO: TStringField;
    TUGCONCEPTOSIDCONCEPTO: TLongintField;
    TUGCONCEPTOSMONTODEFECTO: TFloatField;
    TUGCONCEPTOSTIPO: TStringField;
    TUGCONDICIONESFISCALESBVISIBLE: TSmallintField;
    TUGCONDICIONESFISCALESCOMPRENTREGA: TLongintField;
    TUGCONDICIONESFISCALESCOMPRRECIBE: TLongintField;
    TUGCONDICIONESFISCALESCONDICIONFISCAL: TStringField;
    TUGCONDICIONESFISCALESIDCONDICIONFISCAL: TLongintField;
    TUGCONDICIONESPAGOBVISIBLE: TSmallintField;
    TUGCONDICIONESPAGOCONDICIONPAGO: TStringField;
    TUGCONDICIONESPAGOIDCONDICIONPAGO: TLongintField;
    TUGCONDICIONPAGOTIEMPOSBVISIBLE: TSmallintField;
    TUGCONDICIONPAGOTIEMPOSCONDICIONPAGOTIEMPO: TStringField;
    TUGCONDICIONPAGOTIEMPOSIDCONDICIONPAGOTIEMPO: TLongintField;
    TUGCUARTOMAQUBICACIONBVISIBLE: TSmallintField;
    TUGCUARTOMAQUBICACIONIDCUARTOMAQUBICACION: TLongintField;
    TUGCUARTOMAQUBICACIONUBICACION: TStringField;
    TUGCUARTOSMAQUINASOTRABVISIBLE: TSmallintField;
    TUGCUARTOSMAQUINASOTRACUARTOMAQUINAOTRA: TStringField;
    TUGCUARTOSMAQUINASOTRAIDCUARTOMAQUINAOTRA: TLongintField;
    TUGDESTINOSCLIENTEBVISIBLE: TSmallintField;
    TUGDESTINOSCLIENTEDESTINO: TStringField;
    TUGDESTINOSCLIENTEIDDESTINOCLIENTE: TLongintField;
    TUGEMPLEADOSBVISIBLE: TSmallintField;
    TUGEMPLEADOSEMPLEADO: TStringField;
    TUGEMPLEADOSIDEMPLEADO: TLongintField;
    TUGESTADOSCUOTABVISIBLE: TSmallintField;
    TUGESTADOSCUOTAESTADOCUOTA: TStringField;
    TUGESTADOSCUOTAIDESTADOCUOTA: TLongintField;
    TUGFORMASCOBROAGRUPAMIENTO: TLongintField;
    TUGFORMASCOBROBVISIBLE: TSmallintField;
    TUGFORMASCOBROFORMACOBRO: TStringField;
    TUGFORMASCOBROIDFORMACOBRO: TLongintField;
    TUGFORMASCOBROREFCUENTA: TLongintField;
    TUGFORMASPAGOAGRUPAMIENTO: TLongintField;
    TUGFORMASPAGOBVISIBLE: TSmallintField;
    TUGFORMASPAGOFORMAPAGO: TStringField;
    TUGFORMASPAGOIDFORMAPAGO: TLongintField;
    TUGFORMASPAGOREFCUENTA: TLongintField;
    TUGFRECUENCIASVARIABLESBVISIBLE: TSmallintField;
    TUGFRECUENCIASVARIABLESFRECUENCIAVARIABLE: TStringField;
    TUGFRECUENCIASVARIABLESIDFRECUENCIAVARIABLE: TLongintField;
    TUGGRUPOSFACTURACIONBVISIBLE: TSmallintField;
    TUGGRUPOSFACTURACIONDIAFACTURACION: TLongintField;
    TUGGRUPOSFACTURACIONGRUPOFACTURACION: TStringField;
    TUGGRUPOSFACTURACIONIDGRUPOFACTURACION: TLongintField;
    TUGLOCALIDADESBVISIBLE: TSmallintField;
    TUGLOCALIDADESCPOSTAL: TStringField;
    TUGLOCALIDADESIDLOCALIDAD: TLongintField;
    TUGLOCALIDADESLOCALIDAD: TStringField;
    TUGLOCALIDADESREFPROVINCIA: TLongintField;
    TUGMATERIALESBVISIBLE: TSmallintField;
    TUGMATERIALESIDMATERIAL: TLongintField;
    TUGMATERIALESMATERIAL: TStringField;
    TUGMEDIOSRECLAMOBVISIBLE: TSmallintField;
    TUGMEDIOSRECLAMOIDMEDIORECLAMO: TLongintField;
    TUGMEDIOSRECLAMOMEDIORECLAMO: TStringField;
    TUGMOTIVOSREMITOBVISIBLE: TSmallintField;
    TUGMOTIVOSREMITOIDMOTIVOREMITO: TLongintField;
    TUGMOTIVOSREMITOMOTIVOREMITO: TStringField;
    TUGMOTORESMARCASBVISIBLE: TSmallintField;
    TUGMOTORESMARCASIDMOTORMARCA: TLongintField;
    TUGMOTORESMARCASMARCA: TStringField;
    TUGNROACCESOOPADYBVISIBLE: TSmallintField;
    TUGNROACCESOOPADYIDNROACCESOOPADY: TLongintField;
    TUGNROACCESOOPADYNROACCESOOPADY: TStringField;
    TUGPLANDECUENTASBVISIBLE: TSmallintField;
    TUGPLANDECUENTASCODIGO: TStringField;
    TUGPLANDECUENTASCUENTA: TStringField;
    TUGPLANDECUENTASIDCUENTA: TLongintField;
    TUGPLANDECUENTASOPERACION: TStringField;
    TUGPLANDECUENTASPORCIVA: TFloatField;
    TUGPOLICIASBVISIBLE: TSmallintField;
    TUGPOLICIASIDPOLICIA: TLongintField;
    TUGPOLICIASPOLICIA: TStringField;
    TUGPRESUPUESTOSESTADOSBVISIBLE: TSmallintField;
    TUGPRESUPUESTOSESTADOSESTADO: TStringField;
    TUGPRESUPUESTOSESTADOSIDPRESUPUESTOESTADO: TLongintField;
    TUGPROVINCIASBVISIBLE: TSmallintField;
    TUGPROVINCIASIDPROVINCIA: TLongintField;
    TUGPROVINCIASPROVINCIA: TStringField;
    TUGPUERTASAUTOMATICASARRASTREBVISIBLE: TSmallintField;
    TUGPUERTASAUTOMATICASARRASTREIDPUERTAAUTOMATICAARRASTRE: TLongintField;
    TUGPUERTASAUTOMATICASARRASTREPUERTAAUTOMATICAARRASTRE: TStringField;
    TUGPUERTASAUTOMATICASCORRIENTEBVISIBLE: TSmallintField;
    TUGPUERTASAUTOMATICASCORRIENTEIDPUERTAAUTOMATICACORRIENTE: TLongintField;
    TUGPUERTASAUTOMATICASCORRIENTEPUERTAAUTOMATICACORRIENTE: TStringField;
    TUGPUERTASAUTOMATICASTIPOSBVISIBLE: TSmallintField;
    TUGPUERTASAUTOMATICASTIPOSIDPUERTAAUTOMATICATIPO: TLongintField;
    TUGPUERTASAUTOMATICASTIPOSPUERTAAUTOMATICATIPO: TStringField;
    TUGPUERTASMANUALESTIPOSBVISIBLE: TSmallintField;
    TUGPUERTASMANUALESTIPOSIDPUERTAMANUALTIPO: TLongintField;
    TUGPUERTASMANUALESTIPOSTIPOPUERTAMANUAL: TStringField;
    TUGRECIBOSESTADOSBVISIBLE: TSmallintField;
    TUGRECIBOSESTADOSESTADO: TStringField;
    TUGRECIBOSESTADOSIDRECIBOESTADO: TLongintField;
    TUGSELECTIVAACUMULATIVATIPOSBVISIBLE: TSmallintField;
    TUGSELECTIVAACUMULATIVATIPOSIDSELECTIVAACUMULATIVATIPO: TLongintField;
    TUGSELECTIVAACUMULATIVATIPOSSELECTIVAACUMULATIVA: TStringField;
    TUGTENSIONESTIPOBVISIBLE: TSmallintField;
    TUGTENSIONESTIPOIDTENSIONTIPO: TLongintField;
    TUGTENSIONESTIPOTENSIONTIPO: TStringField;
    TUGTIPOSCOMPROBANTESBVISIBLE: TSmallintField;
    TUGTIPOSCOMPROBANTESIDTIPOCOMPROBANTE: TLongintField;
    TUGTIPOSCOMPROBANTESTIPOCOMPROBANTE: TStringField;
    TUGTIPOSCONTACTOBVISIBLE: TSmallintField;
    TUGTIPOSCONTACTOCLIENTEBVISIBLE: TSmallintField;
    TUGTIPOSCONTACTOCLIENTEIDTIPOCONTACTOCLIENTE: TLongintField;
    TUGTIPOSCONTACTOCLIENTETIPOCONTACTOCLIENTE: TStringField;
    TUGTIPOSCONTACTOIDTIPOCONTACTO: TLongintField;
    TUGTIPOSCONTACTOTIPOCONTACTO: TStringField;
    TUGTIPOSCONTROLTIPOSBVISIBLE: TSmallintField;
    TUGTIPOSCONTROLTIPOSIDTIPOCONTROLTIPO: TLongintField;
    TUGTIPOSCONTROLTIPOSTIPOCONTROL: TStringField;
    TUGTIPOSCUOTABVISIBLE: TSmallintField;
    TUGTIPOSCUOTAIDTIPOCUOTA: TLongintField;
    TUGTIPOSCUOTATIPOCUOTA: TStringField;
    TUGTIPOSDOCUMENTOBVISIBLE: TSmallintField;
    TUGTIPOSDOCUMENTOIDTIPODOCUMENTO: TLongintField;
    TUGTIPOSDOCUMENTOTIPODOCUMENTO: TStringField;
    TUGTIPOSEQUIPOSBVISIBLE: TSmallintField;
    TUGTIPOSEQUIPOSEQUIPO: TStringField;
    TUGTIPOSEQUIPOSIDTIPOEQUIPO: TLongintField;
    TUGTIPOSMANIOBRASOTRABVISIBLE: TSmallintField;
    TUGTIPOSMANIOBRASOTRAIDTIPOMANIOBRAOTRA: TLongintField;
    TUGTIPOSMANIOBRASOTRATIPOMANIOBRAOTRA: TStringField;
    TUGTIPOSMANIOBRASTIPOSBVISIBLE: TSmallintField;
    TUGTIPOSMANIOBRASTIPOSIDTIPOMANIOBRATIPO: TLongintField;
    TUGTIPOSMANIOBRASTIPOSTIPOMANIOBRA: TStringField;
    TUGTIPOSMAQPROPHIDRAULICABVISIBLE: TSmallintField;
    TUGTIPOSMAQPROPHIDRAULICAIDTIPOMAQPROPHIDRAULICA: TLongintField;
    TUGTIPOSMAQPROPHIDRAULICAPROPULSIONHIDRAULICA: TStringField;
    TUGTIPOSMAQUINASTRACCIONBVISIBLE: TSmallintField;
    TUGTIPOSMAQUINASTRACCIONIDTIPOMAQTRACCION: TLongintField;
    TUGTIPOSMAQUINASTRACCIONTRACCION: TStringField;
    TUGTIPOSPARACAIDASBVISIBLE: TSmallintField;
    TUGTIPOSPARACAIDASIDTIPOPARACAIDAS: TLongintField;
    TUGTIPOSPARACAIDASTIPOPARACAIDAS: TStringField;
    TUGTIPOSPARAGOLPESBVISIBLE: TSmallintField;
    TUGTIPOSPARAGOLPESIDTIPOPARAGOLPE: TLongintField;
    TUGTIPOSPARAGOLPESTIPOPARAGOLPE: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { private declarations }
  public
    procedure Levantartabla (laTabla: string);
    function DevolverTField (elCampo: string): TField;
    procedure EliminarFila;
  end; 

var
  DM_EdicionTUGs: TDM_EdicionTUGs;

implementation

{ TDM_EdicionTUGs }
{ TODO 1 -oMagoo -cTUGs : No está funcionando para nada la asignación dinámica de tablas TUG }
procedure TDM_EdicionTUGs.DataModuleCreate(Sender: TObject);
var
  idx: integer;
begin
  //for idx:= 0 to Self.ComponentCount -1 do
  // if (Self.Components[idx] is TZTable) then
  //   (Self.Components[idx] as TZTable).Open;
end;

procedure TDM_EdicionTUGs.Levantartabla(laTabla: string);
var
  idx: integer;
  elCampo: TField;
  campos, valoresIns, valoresUPD: String;
begin

//  with tbTabla do
//  begin
//    Close;
//    TableName:= laTabla;
//    Open;
////    ////
////    ///////
//    tbtmp.Close;
//    tbtmp.Fields.Clear;
//    qLeer.Close;
//    qLeer.SQL.Clear;
//    qLeer.SQL.Add('SELECT * FROM '+ laTabla);
//    qLeer.Open;
////
////    qIB.Close;
////    qIB.SQL.Clear;
////    qIB.SQL.Add('SELECT * FROM '+ laTabla);
////    campos:= EmptyStr;
////    valoresIns:= EmptyStr;
////    valoresUPD:= EmptyStr;
////    qIB.Open;
////
////    for idx:= 0 to tbTabla.FieldCount - 1 do
////    begin
////      campos:= Campos +', ' +qIB.Fields[idx].FieldName;
////      if UpperCase(TRIM(Copy(qIB.Fields[idx].FieldName, 1, 2) )) = 'ID' then
////        valoresIns:= valoresIns +', -1'
////      else
////        if UpperCase(TRIM(qIB.Fields[idx].FieldName)) = 'BVISIBLE' then
////          valoresIns:= valoresIns +', 1'
////        else
////          valoresIns:= valoresIns + ', :' + qIB.Fields[idx].FieldName;
////    end;
////    campos:= Copy (campos, 2,Length(campos)-1);
////    valoresIns:= Copy (valoresIns, 2,Length(valoresIns)-1);
////    valoresUpd:= Copy (valoresUpd, 2,Length(valoresUpd)-1);
////    qIB.Close;
////
//// //   qIB.InsertSQL.Add('INSERT INTO ' + laTabla + ' ('+ campos + ' ) VALUES');
//// //   qIB.InsertSQL.Add(' (' +valoresIns + ')');
////
////
////   // qIB.UpdateSQL.Add('UPDATE '+ laTabla + ' SET banco = :banco where idBanco = :idBanco');
////
//////    end;
////
////
////    qIB.Open;
////    tbtmp.Close;
////    tbtmp.Open;
////    tbtmp.LoadFromDataSet(qIB,0,lmCopy);
////
//
//    //for idx:= 0 to FieldCount -1 do
//    //begin
//    //  elCampo:= TField.Create(self);
//    //  elCampo:= qLeer.Fields[idx];
//    //  tbtmp.Fields.Add(elCampo);      //Vincula los campos, no duplica los objetos
//    //end;
//    //tbtmp.Open;
//    //tbtmp.LoadFromDataSet(qLeer, 0, lmAppend);
//    //First;
//    //While Not qLeer.EOF do
//    //begin
//    //  tbtmp.Insert;
//    //  for idx:= 0 to qleer.FieldCount -1 do
//    //    tbtmp.FieldByName(qLeer.Fields[idx].FieldName).Value:= qLeer.FieldByName(qLeer.Fields[idx].FieldName).Value;
//    //  tbtmp.Post;
//    //  qLeer.Next;
//    //end;
////
////    ///
////    ///////
//    Filter:= 'bVisible = 1';
//    Filtered:= true;
//  end;
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

