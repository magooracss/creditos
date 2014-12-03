unit dmempresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset
  ,dmgeneral,extCtrls
  ;

type

  { TDM_Empresas }

  TDM_Empresas = class(TDataModule)
    Empresas: TRxMemoryData;
    EmpresasbVisible: TLongintField;
    EmpresascodigoBancos: TStringField;
    EmpresascodigoBapro: TStringField;
    Empresascuit: TStringField;
    Empresasdomicilio: TStringField;
    Empresasid: TStringField;
    Empresaslogo: TBlobField;
    EmpresaspersonaContacto: TStringField;
    EmpresasrazonSocial: TStringField;
    EmpresasSELBVISIBLE: TSmallintField;
    EmpresasSELCODIGOBANCOS: TStringField;
    EmpresasSELCODIGOBAPRO: TStringField;
    EmpresasSELCUIT: TStringField;
    EmpresasSELDOMICILIO: TStringField;
    EmpresasSELID: TStringField;
    EmpresasSELLOGO: TBlobField;
    EmpresasSELPERSONACONTACTO: TStringField;
    EmpresasSELRAZONSOCIAL: TStringField;
    EmpresasSELTELEFONO: TStringField;
    Empresastelefono: TStringField;
    qTodasLasEmpresas: TZQuery;
    EmpresasINS: TZQuery;
    EmpresasSEL: TZQuery;
    qTodasLasEmpresasBVISIBLE: TSmallintField;
    qTodasLasEmpresasBVISIBLE1: TSmallintField;
    qTodasLasEmpresasCODIGOBANCOS: TStringField;
    qTodasLasEmpresasCODIGOBANCOS1: TStringField;
    qTodasLasEmpresasCODIGOBAPRO: TStringField;
    qTodasLasEmpresasCODIGOBAPRO1: TStringField;
    qTodasLasEmpresasCUIT: TStringField;
    qTodasLasEmpresasCUIT1: TStringField;
    qTodasLasEmpresasDOMICILIO: TStringField;
    qTodasLasEmpresasDOMICILIO1: TStringField;
    qTodasLasEmpresasID: TStringField;
    qTodasLasEmpresasID1: TStringField;
    qTodasLasEmpresasLOGO: TBlobField;
    qTodasLasEmpresasLOGO1: TBlobField;
    qTodasLasEmpresasPERSONACONTACTO: TStringField;
    qTodasLasEmpresasPERSONACONTACTO1: TStringField;
    qTodasLasEmpresasRAZONSOCIAL: TStringField;
    qTodasLasEmpresasRAZONSOCIAL1: TStringField;
    qTodasLasEmpresasTELEFONO: TStringField;
    EmpresasUPD: TZQuery;
    qTodasLasEmpresasTELEFONO1: TStringField;
    procedure EmpresasAfterInsert(DataSet: TDataSet);
  private
    { private declarations }
  public
    function Nuevo: GUID_ID;
    procedure Editar(idEmpresa: GUID_ID);

    procedure CargarLogo(rutaImg: String);
    procedure TodasLasEmpresas;
    procedure MostrarLogo(var img: TImage);
    procedure EliminarEmpresa(idEmpresa: GUID_ID);

    procedure GrabarEmpresa;
  end;

var
  DM_Empresas: TDM_Empresas;

implementation

{$R *.lfm}

{ TDM_Empresas }

procedure TDM_Empresas.EmpresasAfterInsert(DataSet: TDataSet);
begin
  Empresasid.asString:= DM_General.CrearGUID;
  EmpresasrazonSocial.asString:= EmptyStr;
  Empresascuit.AsString:= EmptyStr;
  EmpresascodigoBancos.asString:= EmptyStr;
  EmpresascodigoBapro.AsString:= EmptyStr;
  Empresasdomicilio.AsString:= EmptyStr;
  EmpresaspersonaContacto.AsString:= EmptyStr;
  Empresastelefono.AsString:= EmptyStr;
  EmpresasbVisible.AsInteger:= 1;
end;

function TDM_Empresas.Nuevo: GUID_ID ;
begin
  DM_General.ReiniciarTabla(Empresas);
  Empresas.Insert;
  Result:= Empresasid.AsString;
end;

procedure TDM_Empresas.Editar(idEmpresa: GUID_ID);
begin
  DM_General.ReiniciarTabla(Empresas);
  with EmpresasSEL do
  begin
    if active then close;
    ParamByName('id').AsString:= idEmpresa;
    Open;
    Empresas.LoadFromDataSet(EmpresasSEL, 0, lmAppend);
    Empresas.Edit;
  end;
end;

procedure TDM_Empresas.CargarLogo(rutaImg: String);
begin
  Empresaslogo.LoadFromFile(rutaImg);
end;

procedure TDM_Empresas.TodasLasEmpresas;
begin
  DM_General.ReiniciarTabla(Empresas);
  with qTodasLasEmpresas do
  begin
    if active then close;
    Open;
    Empresas.LoadFromDataSet(qTodasLasEmpresas, 0, lmAppend);
    close;
  end;
end;

procedure TDM_Empresas.MostrarLogo(var img: TImage);
var
  elStream: TMemoryStream;
begin
  elStream:= TMemoryStream.Create;
  try
    if Empresaslogo.BlobSize > 0 then
    begin
      Empresaslogo.SaveToStream(elStream);
      elStream.Position:= 0;
      img.Picture.LoadFromStream(elStream);
    end
    else
      img.Picture.Clear;
  finally
    elStream.Free;
  end;
end;

procedure TDM_Empresas.EliminarEmpresa(idEmpresa: GUID_ID);
begin
  Editar(idEmpresa);
  with Empresas do
  begin
    EmpresasbVisible.AsInteger:= 0;
    Post;
  end;
  GrabarEmpresa;
end;

procedure TDM_Empresas.GrabarEmpresa;
begin
  DM_General.GrabarDatos(EmpresasSEL, EmpresasINS, EmpresasUPD, Empresas, 'id');
end;

end.

