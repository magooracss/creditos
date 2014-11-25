unit dmempresas;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds
  ,dmgeneral
  ;

type

  { Tdm_empresas }

  Tdm_empresas = class(TDataModule)
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
    Empresastelefono: TStringField;
    procedure EmpresasAfterInsert(DataSet: TDataSet);
  private
    { private declarations }
  public
    function Nuevo: GUID_ID;
    procedure Editar(idEmpresa: GUID_ID);

    procedure CargarLogo(rutaImg: String);
  end;

var
  dm_empresas: Tdm_empresas;

implementation

{$R *.lfm}

{ Tdm_empresas }

procedure Tdm_empresas.EmpresasAfterInsert(DataSet: TDataSet);
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

function Tdm_empresas.Nuevo: GUID_ID ;
begin
  DM_General.ReiniciarTabla(Empresas);
  Empresas.Insert;
  Result:= Empresasid.AsString;
end;

{ TODO 1 -oMagoo -cEmpresas : Editar Empresas }
procedure Tdm_empresas.Editar(idEmpresa: GUID_ID);
begin

end;

{ TODO 5 -oMagoo -cEmpresas : Hacer la parte de persistencia del logo de la empresa }
procedure Tdm_empresas.CargarLogo(rutaImg: String);
begin
end;

end.

