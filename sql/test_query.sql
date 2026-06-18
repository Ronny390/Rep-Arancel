SET LINESIZE 200;
SET PAGESIZE 100;
COLUMN CODIGO_10DIGITOS FORMAT A20;
COLUMN DESCRIPCION FORMAT A60;
SELECT id_subpartida, codigo_10digitos, fk_subpartida_padre, es_terminal, substr(descripcion, 1, 50) as desc_corta
FROM SUBPARTIDA 
WHERE codigo_10digitos LIKE '8536.4%';
