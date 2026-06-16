-- Vistas para facilitar la creación de Dashboards en Metabase

-- Vistas para facilitar la creación de Dashboards en Metabase

-- Vistas para facilitar la creación de Dashboards en Metabase

-- Vistas para facilitar la creación de Dashboards en Metabase

-- 1. SUPER BUSCADOR MAESTRO: Une TODO en una sola tabla (Jerarquía + Tarifas + Regímenes)
CREATE OR REPLACE VIEW VW_BUSCADOR_MAESTRO AS
SELECT 
    s.codigo_10digitos AS "Código Subpartida",
    TO_CHAR(s.descripcion_completa) AS "Descripción del Producto",
    -- Columna oculta omnibox: Contiene Código + Descripción sin acentos para buscar por cualquiera de los dos
    TRANSLATE(UPPER(TO_CHAR(s.codigo_10digitos) || ' ' || TO_CHAR(s.descripcion_completa)), 'ÁÉÍÓÚÀÈÌÒÙÄËÏÖÜÂÊÎÔÛ', 'AEIOUAEIOUAEIOUAEIOU') AS "Búsqueda Normalizada",
    p.codigo_4digitos AS "Código Partida",
    p.descripcion AS "Descripción Partida",
    c.codigo_2digitos AS "Capítulo",
    sec.numero_romano AS "Sección",
    t.codigo_aec AS "Tarifa AEC",
    t.valor_numerico_aec AS "Porcentaje Arancel (%)",
    u.sigla AS "Unidad Física",
    (
        SELECT LISTAGG(r.codigo_regimen, ', ') WITHIN GROUP (ORDER BY r.codigo_regimen)
        FROM SUBPARTIDA_REGIMEN sr
        JOIN REGIMEN_LEGAL r ON sr.fk_regimen = r.id_regimen
        WHERE sr.fk_subpartida = s.id_subpartida
    ) AS "Regímenes Legales"
FROM 
    V_SUBPARTIDA_DESC_COMPLETA s
JOIN 
    PARTIDA p ON s.fk_partida = p.id_partida
JOIN 
    CAPITULO c ON p.fk_capitulo = c.id_capitulo
JOIN 
    SECCION sec ON c.fk_seccion = sec.id_seccion
LEFT JOIN 
    TARIFA_AD_VALOREM t ON s.id_subpartida = t.fk_subpartida
LEFT JOIN 
    UNIDAD_FISICA u ON s.fk_unidad = u.id_unidad
WHERE s.es_terminal = 1;

COMMIT;
