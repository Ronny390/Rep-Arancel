SET LINESIZE 200;
SET PAGESIZE 100;
COLUMN CODIGO FORMAT A20;
COLUMN DESC_CORTA FORMAT A60;
SELECT "Código Subpartida" as codigo, substr("Descripción del Producto", 1, 60) as desc_corta
FROM VW_BUSCADOR_MAESTRO 
WHERE "Código Subpartida" LIKE '8536.4%';
