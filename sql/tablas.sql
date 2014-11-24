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