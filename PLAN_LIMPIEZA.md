# Plan de limpieza de datos — Arancel Venezuela PRO

**Fecha auditoría:** 2026-05-15  
**Archivo evaluado:** `sql/arancel_venezuela_PRO.sql`  
**Fuente:** `datos/arancel_completo.csv`

---

## Veredicto general

| Área | Estado | Comentario |
|------|--------|------------|
| Estructura SQL (tablas, FK, transacción) | ✅ OK | Normalizado, listo para Postgres |
| Vista Metabase | ✅ OK | `vista_arancel_completo` incluida |
| Cobertura de subpartidas vs CSV maestro | 🟡 Casi completo | 16.411 en SQL vs 16.471 con código en CSV |
| Cobertura de partidas vs extracción original | 🔴 Incompleto | Faltan ~300 partidas respecto a `partidas.csv` |
| Calidad de textos (pegadas, cortes) | 🔴 Requiere limpieza | Origen: PDF → CSV maestro |
| Campos AEC / aranceles | 🟡 Revisar | Algunos mal parseados (`de`, `14BIT`) |

**Conclusión (actualizado):** Tras el pipeline de limpieza (may 2026), el SQL PRO es usable. Quedan mejoras menores en textos pegados (nombres científicos) y AEC de agrupadores.

**Fase 1b completada:** partidas insertadas en capítulo correcto; validación `validar_capitulos.py` → 0 errores.

---

## Hallazgos detallados

### 1. Palabras pegadas (ej. `CARNEDEANIMALESDELAESPECIEPORCINA`)

**Causa:** Al armar `arancel_completo.csv` desde el PDF se perdieron espacios en títulos y notas.

**Prueba:**

| Fuente | Texto partida 02.03 |
|--------|---------------------|
| `partidas.csv` (correcto) | `CARNE DE ANIMALES DE LA ESPECIE PORCINA, FRESCA, REFRIGERADA O CONGELADA.` |
| `arancel_completo.csv` (mal) | `CARNEDEANIMALESDELAESPECIEPORCINA,FRESCA,REFRIGERADA` |
| `Arancel_24-04-25.md` (correcto) | `CARNE DE ANIMALES DE LA ESPECIE PORCINA, FRESCA, REFRIGERADA` |
| SQL PRO (hereda CSV) | Igual que CSV maestro ❌ |

**Magnitud estimada:**

- ~1.115 casos en títulos MAYÚSCULAS (ej. `CARNEYDESPOJOSCOMESTIBLES`)
- ~3.292 casos en texto mixto (ej. `delfinesymarsopas`, `Contralassiguientesenfermedades`)
- ~6.096 subpartidas afectadas en SQL (por herencia de descripciones)

### 2. Textos cortados

- ~1.844 filas en CSV terminan en `de`, `y`, `,` (muchas son **notas legales partidas en varias líneas** — falso positivo parcial).
- ~475 subpartidas en SQL con el mismo patrón (parte heredada de notas multi-línea).

### 3. Partidas faltantes

| Fuente | Partidas (código 4 dígitos) |
|--------|----------------------------|
| `partidas.csv` | 1.275 |
| `arancel_completo.csv` | 985 |
| SQL PRO | 979 |

**~300 partidas** están en `partidas.csv` pero **nunca entraron** al CSV maestro ni al SQL.  
Ejemplo: partida `15.03` existe en `partidas.csv` pero en `arancel_completo.csv` solo aparece citada en una nota, no como fila propia.

### 4. Códigos intermedios

- 4.132 detectados en CSV → 4.130 en SQL ✅
- Faltan 2: `200819`, `290375` (menor, revisar manualmente)

### 5. AEC mal ubicados

Ejemplos en SQL:

- `8472902000` → AEC = `'de'` (debería ser parte de descripción o `14` + unidad `BIT`)
- `3002427000` → descripción pegada: `Contralassiguientesenfermedades:deNewcastle...`
- ~2.991 filas con código ≥10 dígitos sin AEC: **normal en parte** (filas agrupadoras), pero algunas son productos finales mal parseados

### 6. Normalización SQL

Todo correcto:

- `BEGIN` / `COMMIT`
- `SET client_encoding = 'UTF8'`
- `DROP CASCADE` + `CREATE` + FK
- Vista `vista_arancel_completo`

---

## Plan de limpieza (5 fases)

### Fase 1 — Reconstruir CSV maestro limpio (prioridad alta)

**Objetivo:** Un `arancel_completo_limpio.csv` con textos correctos y partidas completas.

1. Usar como referencia de textos:
   - `partidas.csv` → descripciones de partidas
   - `subpartidas.csv` → descripciones de subpartidas + AEC/unidad
   - `capitulos.csv`, `secciones.csv`, `notas_legales.csv`
2. Fusionar filas de `arancel_completo.csv` (estructura jerárquica / notas / orden de páginas).
3. Insertar las **~300 partidas faltantes** desde `partidas.csv` con sus subpartidas de `subpartidas.csv`.

**Script a crear:** `scripts/fusionar_fuentes_limpio.py`

### Fase 2 — Des-pegado de textos (prioridad alta)

**Objetivo:** Separar palabras fusionadas.

Estrategias (en orden):

1. **Reemplazo por diccionario** desde `partidas.csv` / `subpartidas.csv` (match por código).
2. **Reglas para MAYÚSCULAS:** insertar espacio antes de palabras clave (`DE`, `DEL`, `LA`, `LAS`, `Y`, `O`, `CON`, `PARA`, `FRESCA`, etc.).
3. **Nombres científicos:** espacio antes de mayúscula en `OncorhynchusNerka` → `Oncorhynchus Nerka`.
4. **Validación manual** de muestra aleatoria (50 filas por capítulo).

**Script a crear:** `scripts/despegar_textos.py`

### Fase 3 — Reparar AEC y columnas técnicas (prioridad media)

1. Re-parsear columnas `aec`, `ex_aec`, `regimen_importacion`, `unidad` desde descripciones mal unidas.
2. Corregir casos `14BIT`, `15E`, etc. (unir dígitos + unidad).
3. Validar que productos con código de 10 dígitos tengan AEC cuando corresponda.

**Script a crear:** `scripts/reparar_campos_tecnicos.py`

### Fase 4 — Regenerar SQL PRO (prioridad alta)

```bash
python scripts/fusionar_fuentes_limpio.py   # → datos/arancel_completo_limpio.csv
python scripts/despegar_textos.py
python scripts/reparar_campos_tecnicos.py
python scripts/constructor_final.py         # apuntar al CSV limpio
python scripts/agregar_vista.py
python scripts/auditoria_completa.py
```

**Criterios de éxito:**

- Partidas SQL ≥ 1.200 (o justificar diferencia con PDF oficial)
- Palabras pegadas en SQL < 50 (ideal: 0 en productos finales)
- 0 códigos intermedios faltantes
- AEC inválidos (`de`, `kg` como AEC) = 0

### Fase 5 — Validación contra PDF (prioridad media)

1. Muestra aleatoria: 100 códigos → comparar descripción SQL vs PDF (`Arancel_24-04-25.pdf`).
2. Revisar `productos_para_revisar_pdf.txt` (ya generado antes).
3. Documentar excepciones aceptadas.

---

## Qué NO tocar

- Versiones SQL antiguas (`_limpio`, `_unificado`, etc.) — archivar, no mezclar.
- `constructor_final.py` — lógica de jerarquía es correcta; solo cambiar entrada CSV.
- Estructura de tablas en SQL — ya está bien.

---

## Orden recomendado antes de GitHub

1. ⛔ No publicar `arancel_venezuela_PRO.sql` actual como “final limpio”.
2. ✅ Ejecutar Fases 1–4.
3. ✅ Pasar auditoría con umbrales de Fase 4.
4. ✅ Reemplazar `datos/arancel_completo.csv` por versión limpia.
5. ✅ Regenerar `sql/arancel_venezuela_PRO.sql`.
6. ✅ Entonces sí: `git init` y subir `arancel-venezuela-release`.

---

## Scripts de auditoría disponibles

```bash
python scripts/diagnostico_calidad.py      # CSV: pegadas y cortes
python scripts/verificar_intermedios.py    # códigos intermedios
python scripts/auditoria_completa.py       # reporte integral → auditoria_reporte.txt
python scripts/analisis_pegadas.py         # clasifica MAYÚSCULAS vs mixtas
python scripts/compare_partidas.py         # partidas faltantes vs partidas.csv
```
