unit dmseguridad;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, rxmemds, ZDataset
  ,dmgeneral, dmConexion
  ;

const
  EMPR_LISTA = '{1EFD35DE-F0FB-42F9-837A-48F49E6DF70C}'; //Listado de empresas
  EMPR_CAMBIAR = '{CFA53446-3DF5-464D-8CC6-29B71EC94867}'; //Cambiar de Empresa Actual

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
    qTodosLosUsuariosBVISIBLE: TSmallintField;
    qTodosLosUsuariosBVISIBLE_1: TSmallintField;
    qTodosLosUsuariosCLAVE: TStringField;
    qTodosLosUsuariosGRUPO: TStringField;
    qTodosLosUsuariosGRUPO_ID: TStringField;
    qTodosLosUsuariosID: TStringField;
    qTodosLosUsuariosID_1: TStringField;
    qTodosLosUsuariosUSUARIO: TStringField;
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
    UsuariosSEL: TZQuery;
    Usuariosusuario: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure UsuariosAfterInsert(DataSet: TDataSet);
  private
    _usuario: string;
    grupo: GUID_ID;
    function clave (laClave: string): string;
  public
    property usuario: string read _usuario;
    function UsuarioValido(elUsuario, laClave: string): boolean;
    function AccesoValido (idAccion: GUID_ID): boolean;

    procedure LevantarGruposUsuarios;

    function NuevoUsuario: GUID_ID;
    procedure EditarUsuario(idUsuario: GUID_ID);
    procedure CambiarClave (laClave: string);
    procedure GrabarUsuario;

    procedure LevantarUsuarios;
  end;

var
  DM_Seguridad: TDM_Seguridad;

implementation

{$R *.lfm}

{ TDM_Seguridad }

procedure TDM_Seguridad.DataModuleCreate(Sender: TObject);
begin
  _usuario:= EmptyStr;
  grupo:= GUIDNULO;
end;

procedure TDM_Seguridad.UsuariosAfterInsert(DataSet: TDataSet);
begin
  Usuariosid.asString:= DM_General.CrearGUID;
  Usuariosusuario.AsString:= EmptyStr;
  Usuariosclave.asString:= EmptyStr;
  UsuariosGrupo_id.AsString:= GUIDNULO;
  UsuariosbVisible.asInteger:= 1;
end;

{ TODO 1 -oMagoo -cSeguridad : Hacer rutina de encripcion para las claves }
function TDM_Seguridad.clave(laClave: string): string;
begin
  Result:= laClave;
end;

function TDM_Seguridad.UsuarioValido(elUsuario, laClave: string): boolean;
begin
  Result := False;
  with qUsuario do
  begin
    if active then close;
    ParamByName('usuario').AsString:= Trim(elUsuario);
    Open;
    if RecordCount > 0 then
      if  TRIM(qUsuarioCLAVE.AsString) = TRIM(clave(laClave)) then
      begin
        _usuario:= elUsuario;
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

procedure TDM_Seguridad.LevantarGruposUsuarios;
begin
  with qGruposUsuarios do
  begin
    if active then close;
    Open;
  end;
end;

function TDM_Seguridad.NuevoUsuario: GUID_ID;
begin
  DM_General.ReiniciarTabla(Usuarios);
  qGruposUsuarios.Open;
  Usuarios.Insert;
  Result:= Usuariosid.AsString;
end;

procedure TDM_Seguridad.EditarUsuario(idUsuario: GUID_ID);
begin
  DM_General.ReiniciarTabla(Usuarios);
  with UsuariosSEL do
  begin
    if active then close;
    ParamByName('id').AsString:= idUsuario;
    Open;
    Usuarios.LoadFromDataSet(UsuariosSEL, 0, lmAppend);
    Close;
  end;
  Usuarios.Edit;
end;

procedure TDM_Seguridad.CambiarClave(laClave: string);
begin
  with Usuarios do
  begin
    Edit;
    Usuariosclave.AsString:= clave(laClave);
    Post;
  end;
end;

procedure TDM_Seguridad.GrabarUsuario;
begin
  DM_General.GrabarDatos(UsuariosSEL, UsuariosINS, UsuariosUPD, Usuarios, 'id');
end;

procedure TDM_Seguridad.LevantarUsuarios;
begin
  With qTodosLosUsuarios do
  begin
    if active then close;
    Open;
  end;
end;

end.

