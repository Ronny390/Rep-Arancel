UPDATE SUBPARTIDA SET descripcion = REPLACE(REPLACE(descripcion, ': 6.804', ''), ' 6.804', '') WHERE descripcion LIKE '%6.804%';
UPDATE PARTIDA SET descripcion = REPLACE(REPLACE(descripcion, ': 6.804', ''), ' 6.804', '') WHERE descripcion LIKE '%6.804%';
UPDATE CAPITULO SET descripcion = REPLACE(REPLACE(descripcion, ': 6.804', ''), ' 6.804', '') WHERE descripcion LIKE '%6.804%';
COMMIT;
EXIT;
