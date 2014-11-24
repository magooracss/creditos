unit dmseguridad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset
  ,dmgeneral, dmConexion
  ;

const
  EMP_AE = '{1EFD35DE-F0FB-42F9-837A-48F49E6DF70C}'; //Alta/Edicion de empresas;

  USR_LISTA = '{EEA6E1D9-79BB-4432-979D-4715DD92F237}';//Listado de usuarios
type

  { TDM_Seguridad }

  TDM_Seguridad = class(TDataModule)
    qAccesosACCESOID: TStringField;
    qAccesosGRUPO_ID: TStringField;
    qAccesosID: TStringField;
    qGruposUsuariosBVISIBLE: TSmallintField;
    qGruposUsuariosGRUPO: TStringField;
    qGruposUsuariosID: TStringField;
    qUsuario: TZQuery;
    qAccesos: TZQuery;
    qGruposUsuarios: TZQuery;
    qUsuarioBVISIBLE: TSmallintField;
    qUsuarioCLAVE: TStringField;
    qUsuarioGRUPO_ID: TLongintField;
    qUsuarioID: TStringField;
    qUsuarioUSUARIO: TStringField;
    Usuarios: TRxMemoryData;
    UsuariosbVisible: TLongintField;
    Usuariosclave: TStringField;
    UsuariosGrupo: TStringField;
    UsuariosGrupo_id: TStringField;
    Usuariosid: TStringField;
    UsuariosINS: TZQuery;
    qTodosLosUsuarios: TZQuery;
    UsuariosSELBVISIBLE3: TSmallintField;
    UsuariosSELCLAVE3: TStringField;
    UsuariosSELGRUPO_ID3: TStringField;
    UsuariosSELID3: TStringField;
    UsuariosSELUSUARIO3: TStringField;
    UsuariosUPD: TZQuery;
    UsuariosSELBVISIBLE: TSmallintField;
    UsuariosSELBVISIBLE1: TSmallintField;
    UsuariosSELBVISIBLE2: TSmallintField;
    UsuariosSELCLAVE: TStringField;
    UsuariosSELCLAVE1: TStringField;
    UsuariosSELCLAVE2: TStringField;
    UsuariosSELGRUPO_ID: TStringField;
    UsuariosSELGRUPO_ID1: TStringField;
    UsuariosSELGRUPO_ID2: TStringField;
    UsuariosSELID: TStringField;
    UsuariosSELID1: TStringField;
    UsuariosSELID2: TStringField;
    UsuariosSELUSUARIO: TStringField;
    UsuariosSELUSUARIO1: TStringField;
    UsuariosSELUSUARIO2: TStringField;
    Usuariosusuario: TStringField;
    UsuariosSEL: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    usuario: string;
    grupo: GUID_ID;
    function clave (laClave: string): string;
  public
    function UsuarioValido(elUsuario, laClave: string): boolean;
    function AccesoValido (idAccion: GUID_ID): boolean;

    function NuevoUsuario: GUID_ID;
    procedure EditarUsuario(idUsuario: GUID_ID);
  end;

var
  DM_Seguridad: TDM_Seguridad;

implementation

{$R *.lfm}

{ TDM_Seguridad }

{ TODO 1 -oMagoo -cSeguridad : Falta el AfterInsert de la tabla usuarios para darle el ID y los valores por default }
procedure TDM_Seguridad.DataModuleCreate(Sender: TObject);
begin
  usuario:= EmptyStr;
  grupo:= GUIDNULO;
end;
{ TODO 1 -oMagoo -cSeguridad : Hacer rutina de encripcion para las claves }
function TDM_Seguridad.clave(laClave: string): string;
begin
  Result:= laClave;
end;

function TDM_Seguridad.UsuarioValido(elUsuario, laClave: string): boolean;
begin
  with qUsuario do
  begin
    if active then close;
    ParamByName('usuario').AsString:= Trim(elUsuario);
    Open;
    if RecordCount > 0 then
      if  TRIM(qUsuarioCLAVE.AsString) = TRIM(clave(laClave)) then
      begin
        usuario:= elUsuario;
        grupo:= qUsuarioGRUPO_ID.AsString;
        Result:= true;
      end
    else
      Result:= false;
  end;
end;

function TDM_Seguridad.AccesoValido(idAccion: GUID_ID): boolean;
begin
  with qAccesos do
  begin
    if active then close;
    ParamByName('acceso').asString:= idAccion;
    ParamByName('grupo').asString:= grupo;
    Open;
   // Result:= (RecordCount > 0);
{ TODO 1 -oMagoo -cSeguridad : Esto lo puse para poder probar sin tener un usuario valido }
    Result:= true;
    Close;
  end;
end;

function TDM_Seguridad.NuevoUsuario: GUID_ID;
begin
  DM_General.ReiniciarTabla(Usuarios);
  qGruposUsuarios.Open;
  Usuarios.Insert;
end;

procedure TDM_Seguridad.EditarUsuario(idUsuario: GUID_ID);
begin
  { TODO 1 -oMagoo -cSeguridad : Hacer la edición de usuarios }
end;

end.

