-- Vistas para facilitar la creación de Dashboards en Metabase

-- 1. Buscador Maestro: Une todas las jerarquías (Sección -> Capítulo -> Partida -> Subpartida)
CREATE OR REPLACE VIEW VW_BUSCADOR_MAESTRO AS
SELECT 
    s.codigo_subpartida AS "Código Subpartida",
    s.descripcion AS "Descripción del Producto",
    p.codigo_partida AS "Código Partida",
    p.descripcion AS "Descripción Partida",
    c.codigo_capitulo AS "Capítulo",
    sec.numero_seccion AS "Sección"
FROM 
    SUBPARTIDA s
JOIN 
    PARTIDA p ON s.codigo_partida = p.codigo_partida
JOIN 
    CAPITULO c ON p.codigo_capitulo = c.codigo_capitulo
JOIN 
    SECCION sec ON c.id_seccion = sec.id_seccion;

-- 2. Detalles y Tarifas: Enfocado puramente en los impuestos y regímenes
CREATE OR REPLACE VIEW VW_DETALLE_TARIFAS AS
SELECT 
    codigo_subpartida AS "Código Subpartida",
    descripcion AS "Descripción del Producto",
    tarifa_ad_valorem AS "Tarifa Ad-Valorem (%)",
    regimen_legal_impo AS "Régimen Importación",
    regimen_legal_expo AS "Régimen Exportación",
    unidad_fisica AS "Unidad Física",
    observaciones AS "Observaciones"
FROM 
    SUBPARTIDA;

COMMIT;
