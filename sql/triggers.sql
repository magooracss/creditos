SET TERM ^ ;

CREATE TRIGGER documentoTipoID FOR DocumentosTipos
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(documentoTipoID,1);
END^

SET TERM ; ^  

SET TERM ^ ;

CREATE TRIGGER localidadID FOR Localidades
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(localidadID,1);
END^

SET TERM ; ^  

SET TERM ^ ;

CREATE TRIGGER reparticionID FOR Reparticiones
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(reparticionID,1);
END^

SET TERM ; ^  

SET TERM ^ ;

CREATE TRIGGER bancoID FOR Bancos
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(bancoID,1);
END^

SET TERM ; ^  


SET TERM ^ ;

CREATE TRIGGER afiliadoEstadoID FOR afiliadosEstados
BEFORE INSERT POSITION 0
AS 
BEGIN 
    If (New.id = -1) then
   New.id = GEN_ID(afiliadoEstadoID,1);
END^

SET TERM ; ^  
