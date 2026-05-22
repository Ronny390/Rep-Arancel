# Arancel Venezuela 2024-2025

Paquete mínimo para cargar en PostgreSQL, publicar en GitHub o migrar a otro entorno.

## Contenido

| Ruta | Descripción |
|------|-------------|
| `sql/arancel_venezuela_PRO.sql` | Script final: tablas, datos y vista Metabase |
| `datos/arancel_completo.csv` | Fuente maestra para regenerar el SQL |
| `scripts/constructor_final.py` | Genera el SQL desde el CSV |
| `scripts/agregar_vista.py` | Añade `vista_arancel_completo` si falta |
| `scripts/diagnostico_calidad.py` | Revisa calidad del CSV |

## Cargar en PostgreSQL

```bash
psql -U usuario -d nombre_bd -f sql/arancel_venezuela_PRO.sql
```

## Pipeline de limpieza completo

```bash
python scripts/ejecutar_limpieza.py
```

Pasos: fusionar fuentes → despegar textos → reparar AEC → generar SQL → vista → auditoría.

## Regenerar solo el SQL (si ya tienes CSV limpio)

```bash
python scripts/constructor_final.py
python scripts/agregar_vista.py
```

## Diagnóstico del CSV

```bash
python scripts/diagnostico_calidad.py
```

## PDF original

El PDF oficial (`Arancel_24-04-25.pdf`, ~5.5 MB) no está incluido para mantener el repo liviano. Guárdalo aparte o añádelo manualmente si necesitas re-extraer desde cero.
