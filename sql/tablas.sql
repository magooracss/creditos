CREATE TABLE Empresas
( 
    id   		    "guid"  NOT NULL PRIMARY KEY
  , logo            blob
  , razonSocial     varchar(500)
  , cuit            varchar(20)
  , codigoBapro     varchar(20)
  , codigoBancos    varchar(20)
  , domicilio       varchar(1000)
  , personaContacto varchar(500)
  , telefono        varchar(100)
  , bVisible        smallint default 1
);

CREATE TABLE GruposUsuarios
(    id    		     "guid"  NOT NULL PRIMARY KEY
   , grupo           varchar(10)
   , bVisible        smallint default 1
);

CREATE TABLE Usuarios
(
    id   		    "guid"  NOT NULL PRIMARY KEY
  , usuario         varchar(10)
  , clave           varchar(50)
  , grupo_id        "guid"  DEFAULT '{00000000-0000-0000-0000-000000000000}'
  , bVisible        smallint default 1
);

CREATE TABLE Accesos
(
      id   		    "guid"  NOT NULL PRIMARY KEY
    , accesoID      "guid"  DEFAULT '{00000000-0000-0000-0000-000000000000}'
    , grupo_id      "guid"  DEFAULT '{00000000-0000-0000-0000-000000000000}'
);

CREATE TABLE Afiliados
(
      id   		    "guid"  NOT NULL PRIMARY KEY
    , apellidos     varchar(250)
    , nombres       varchar(250)
    , documentoTipo_id  integer default 0
    , documento     varchar(30)
    , cuit          varchar(15)
    , domicilio     varchar(300)
    , localidad_id  integer default 0
    , Notas         blob
    , bVisible      smallint default 1
);

CREATE TABLE AfiliadosEmpresas
(
      id   		    "guid"  NOT NULL PRIMARY KEY
    , afiliado_id    "guid"  DEFAULT '{00000000-0000-0000-0000-000000000000}'
    , empresa_id    "guid"  DEFAULT '{00000000-0000-0000-0000-000000000000}'
    , reparticion_id    integer default 0
    , nroAfiliado       integer default -1
    , legajo            varchar(40)
    , banco_id          integer default 0
    , bVisible      smallint default 1
);

CREATE TABLE DocumentosTipos
(
     id  integer NOT NULL PRIMARY KEY
   , tipo   varchar(25)
   , bVisible smallint default 1
);

CREATE TABLE Localidades
(
     id integer NOT NULL PRIMARY KEY
   , localidad  varchar(150)
   , codigoPostal   varchar(10)
   , bVisible smallint default 1
);

CREATE TABLE Reparticiones
(
     id integer NOT NULL PRIMARY KEY
   , reparticion  varchar(250)
   , codigo   varchar(20)
   , bVisible smallint default 1
);

CREATE TABLE Bancos
(
     id integer NOT NULL PRIMARY KEY
   , Banco  varchar(250)
   , Codigo varchar(25)
   , PrestacionBapro smallint default 0
   , bVisible smallint default 1
);
