-- Vistas para facilitar la creación de Dashboards en Metabase

-- 1. Buscador Maestro: Une todas las jerarquías (Sección -> Capítulo -> Partida -> Subpartida)
CREATE OR REPLACE VIEW VW_BUSCADOR_MAESTRO AS
SELECT 
    s.codigo_10digitos AS "Código Subpartida",
    TO_CHAR(s.descripcion) AS "Descripción del Producto",
    p.codigo_4digitos AS "Código Partida",
    p.descripcion AS "Descripción Partida",
    c.codigo_2digitos AS "Capítulo",
    sec.numero_romano AS "Sección"
FROM 
    SUBPARTIDA s
JOIN 
    PARTIDA p ON s.fk_partida = p.id_partida
JOIN 
    CAPITULO c ON p.fk_capitulo = c.id_capitulo
JOIN 
    SECCION sec ON c.fk_seccion = sec.id_seccion;

-- 2. Detalles y Tarifas: Cruza subpartidas con sus tarifas
CREATE OR REPLACE VIEW VW_DETALLE_TARIFAS AS
SELECT 
    s.codigo_10digitos AS "Código Subpartida",
    TO_CHAR(s.descripcion) AS "Descripción del Producto",
    t.codigo_aec AS "Tarifa AEC",
    t.valor_numerico_aec AS "Porcentaje Arancel (%)",
    u.sigla AS "Unidad Física"
FROM 
    SUBPARTIDA s
LEFT JOIN 
    TARIFA_AD_VALOREM t ON s.id_subpartida = t.fk_subpartida
LEFT JOIN 
    UNIDAD_FISICA u ON s.fk_unidad = u.id_unidad
WHERE s.es_terminal = 1;

COMMIT;
