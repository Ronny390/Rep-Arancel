import sys
sys.stdout.reconfigure(encoding='utf-8')

sql_path = r'c:\Users\usuario\Documents\archivos cmd\arancel_venezuela_PRO.sql'

vista_sql = """
-- ═══════════════════════════════════════════════════════════
-- VISTA MAESTRA PARA DASHBOARD EN METABASE
-- ═══════════════════════════════════════════════════════════
CREATE OR REPLACE VIEW vista_arancel_completo AS
SELECT
    s.id_seccion                        AS id_seccion,
    s.nombre                            AS seccion,
    c.id_capitulo                       AS id_capitulo,
    c.numero                            AS numero_capitulo,
    c.descripcion                       AS nombre_capitulo,
    p.id_partida                        AS id_partida,
    p.codigo                            AS codigo_partida,
    p.descripcion                       AS nombre_partida,
    sp.id_subpartid                     AS id_subpartida,
    sp.codigo                           AS codigo_arancelario,
    LENGTH(sp.codigo)                   AS nivel_digitos,
    sp.descripcion                      AS descripcion_completa,
    sp.aec                              AS aec,
    sp.ex_aec                           AS ex_aec,
    sp.imp                              AS regimen_importacion,
    sp.exp                              AS regimen_exportacion,
    sp.unidad                           AS unidad_fisica,
    CASE
        WHEN sp.aec IS NOT NULL THEN 'Producto Final'
        ELSE 'Agrupador'
    END                                 AS tipo_fila
FROM subpartidas sp
JOIN partidas    p  ON sp.id_partida  = p.id_partida
JOIN capitulos   c  ON p.id_capitulo  = c.id_capitulo
JOIN secciones   s  ON c.id_seccion   = s.id_seccion;

"""

# Leer contenido actual
with open(sql_path, 'r', encoding='utf-8') as f:
    contenido = f.read()

# Quitar el COMMIT final, insertar la vista, volver a poner COMMIT
contenido = contenido.rstrip()
if contenido.endswith('COMMIT;'):
    contenido = contenido[:-len('COMMIT;')].rstrip()

contenido = contenido + '\n' + vista_sql + '\nCOMMIT;\n'

with open(sql_path, 'w', encoding='utf-8') as f:
    f.write(contenido)

print("Vista agregada exitosamente al SQL.")
print(f"El archivo ahora termina con:")
print(contenido[-300:])
