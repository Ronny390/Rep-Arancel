import re, os

BASE  = os.path.join(os.environ["USERPROFILE"], "Desktop", "New dise\u00f1o")
DOCS  = os.path.join(BASE, "docs")
SQL   = os.path.join(BASE, "sql")
os.makedirs(SQL, exist_ok=True)

def read_md(path):
    with open(path, encoding="utf-8", errors="replace") as f:
        return f.readlines()

def md_rows(lines):
    return [l for l in lines if l.startswith("|") and "---" not in l and not l.startswith("| ID") and not l.startswith("| id")]

def cols(line):
    c = [x.strip() for x in line.split("|")]
    return [x for x in c if x != ""]

def esc(s):
    return s.replace("'", "''")

BATCH = 500

# =============================================================================
# DML 05: SECCION
# Columnas MD: ID_seccion | Numero de seccion | Descripcion de seccion | ...
# =============================================================================
print("Generando DML 05 SECCION...")
rows = md_rows(read_md(os.path.join(DOCS, "seccion_table.md")))
out  = os.path.join(SQL, "dml_05_seccion.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: SECCION (22 secciones del Arancel venezolano)\n\nINSERT ALL\n")
    for l in rows:
        c = cols(l)
        if len(c) < 3: continue
        romano = esc(c[1])
        titulo = esc(c[2])
        f.write("  INTO SECCION (numero_romano, titulo) VALUES ('{}', '{}')\n".format(romano, titulo))
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")
print("  OK ->", out, "({} filas)".format(len(rows)))

# =============================================================================
# DML 06: CAPITULO
# Columnas MD: ID_capitulo | ID_seccion | Numero de capitulo | Descripcion | ...
# =============================================================================
print("Generando DML 06 CAPITULO...")
rows = md_rows(read_md(os.path.join(DOCS, "capitulo_table.md")))
out  = os.path.join(SQL, "dml_06_capitulo.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: CAPITULO (98 capitulos)\n-- NOTA: fk_seccion = ID_seccion del MD\n\nINSERT ALL\n")
    for l in rows:
        c = cols(l)
        if len(c) < 4: continue
        fk_sec = c[1]
        codigo = str(int(c[2])).zfill(2)  # 01, 02 ... 98
        desc   = esc(c[3])
        f.write("  INTO CAPITULO (codigo_2digitos, descripcion, fk_seccion) VALUES ('{}', '{}', {})\n".format(codigo, desc, fk_sec))
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")
print("  OK ->", out, "({} filas)".format(len(rows)))

# =============================================================================
# DML 07: PARTIDA
# Columnas MD: ID_partida | ID_capitulo | Codigo | Descripcion | ...
# Limpiar la descripcion: quitar texto mezclado de notas al final
# =============================================================================
print("Generando DML 07 PARTIDA...")
rows = md_rows(read_md(os.path.join(DOCS, "partida_table.md")))
out  = os.path.join(SQL, "dml_07_partida.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: PARTIDA (~1276 partidas)\n-- NOTA: fk_capitulo = ID_capitulo del MD\n\n")
    for i in range(0, len(rows), BATCH):
        f.write("INSERT ALL\n")
        for l in rows[i:i+BATCH]:
            c = cols(l)
            if len(c) < 4: continue
            fk_cap = c[1]
            codigo = esc(c[2])
            # Limpiar descripcion: cortar en "CAPITULO" o "SECCION" si aparece mezclado
            desc_raw = c[3]
            for marker in ["CAPITULO", "SECCION IV", "SECCION V", "SECCION", "Notas."]:
                idx = desc_raw.find(marker)
                if idx > 10:
                    desc_raw = desc_raw[:idx].strip()
            desc = esc(desc_raw)
            f.write("  INTO PARTIDA (codigo_4digitos, descripcion, fk_capitulo) VALUES ('{}', '{}', {})\n".format(codigo, desc, fk_cap))
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")
print("  OK ->", out, "({} filas)".format(len(rows)))

# =============================================================================
# DML 08: SUBPARTIDA
# Columnas MD: ID_sub | ID_partida | Codigo | Descripcion | AEC | Ex.AEC | Imp | Exp | Unidad
# es_terminal = 1 si AEC tiene valor numerico, 0 si esta vacio
# fk_subpartida_padre: inferido por prefijo de codigo
# =============================================================================
print("Generando DML 08 SUBPARTIDA...")
rows = md_rows(read_md(os.path.join(DOCS, "subpartida_table.md")))

# Paso 1: construir mapa codigo -> id_sub (para resolver padres)
code_to_id = {}
subpartidas = []
for l in rows:
    c = cols(l)
    if len(c) < 5: continue
    id_sub   = c[0]
    fk_part  = c[1]
    codigo   = c[2]
    desc_raw = c[3]
    aec_raw  = c[4]
    # Determinar unidad y exaec de columnas restantes
    exaec_raw, unidad_raw = "", ""
    for val in c[5:]:
        if re.match(r"^\d+E$", val): exaec_raw = val
        elif re.match(r"^[a-zA-Z][a-zA-Z0-9]*$", val) and len(val) <= 4: unidad_raw = val
    # es_terminal: tiene AEC numerico
    es_terminal = 1 if (aec_raw and re.match(r"^\d+(\.\d+)?$", aec_raw)) else 0
    code_to_id[codigo] = int(id_sub)
    subpartidas.append({
        "id": int(id_sub),
        "fk_part": fk_part,
        "codigo": codigo,
        "desc": desc_raw,
        "es_terminal": es_terminal,
        "unidad": unidad_raw,
    })

# Paso 2: inferir fk_subpartida_padre
# Logica: para codigo A.B.C.D, buscar A.B.C.00, A.B.00.00, A.00.00.00 en ese orden
def find_parent_id(codigo, code_to_id):
    parts = codigo.split(".")
    if len(parts) < 2: return None
    # Generar candidatos de padre (desde el mas cercano al mas lejano)
    candidates = []
    for level in range(len(parts)-1, 0, -1):
        # Reemplazar los segmentos inferiores con "00"
        parent_parts = parts[:level] + ["00"] * (len(parts) - level)
        candidate = ".".join(parent_parts)
        if candidate != codigo:
            candidates.append(candidate)
    for cand in candidates:
        if cand in code_to_id and code_to_id[cand] != code_to_id.get(codigo):
            return code_to_id[cand]
    return None

# Construir mapa de unidades (necesitamos los IDs que Oracle generara)
# Como son IDENTITY, usaremos un subquery en el INSERT
UNIDAD_IDX = {"kg": 1, "u": 2, "l": 3, "m": 4, "t": 5, "g": 6, "m2": 7, "m3": 8, "Kg": 1, "kW": 9, "kWh": 10, "mg": 11, "mm": 12}

out = os.path.join(SQL, "dml_08_subpartida.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: SUBPARTIDA (~11847 registros)\n")
    f.write("-- es_terminal=1 si tiene AEC numerico, 0 si es agrupacion\n")
    f.write("-- fk_subpartida_padre inferido por prefijo de codigo\n")
    f.write("-- IMPORTANTE: Ejecutar DESPUES de PARTIDA y de la primera carga de SUBPARTIDA\n\n")
    for i in range(0, len(subpartidas), BATCH):
        f.write("INSERT ALL\n")
        for s in subpartidas[i:i+BATCH]:
            parent_id = find_parent_id(s["codigo"], code_to_id)
            parent_str = str(parent_id) if parent_id else "NULL"
            unidad_str = str(UNIDAD_IDX[s["unidad"]]) if s["unidad"] in UNIDAD_IDX else "NULL"
            desc = esc(s["desc"])[:3900]  # truncar para evitar exceso en CLOB inline
            f.write("  INTO SUBPARTIDA (codigo_10digitos, descripcion, es_terminal, fk_partida, fk_unidad, fk_subpartida_padre) VALUES ('{}', '{}', {}, {}, {}, {})\n".format(
                s["codigo"], desc, s["es_terminal"], s["fk_part"], unidad_str, parent_str))
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")
print("  OK ->", out, "({} filas, {} terminales)".format(
    len(subpartidas), sum(1 for s in subpartidas if s["es_terminal"] == 1)))

# =============================================================================
# DML 09: NOTA_LEGAL
# Columnas MD: ID | Nivel_nota | ID_seccion | ID_capitulo | Numero_nota | Texto_nota | ...
# =============================================================================
print("Generando DML 09 NOTA_LEGAL...")
rows = md_rows(read_md(os.path.join(DOCS, "notas_legales_table.md")))
out  = os.path.join(SQL, "dml_09_nota_legal.sql")
notas_ok = 0
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: NOTA_LEGAL\n\n")
    for i in range(0, len(rows), BATCH):
        f.write("INSERT ALL\n")
        for l in rows[i:i+BATCH]:
            c = cols(l)
            if len(c) < 6: continue
            nivel    = c[1]  # "Capitulo", "Seccion", etc.
            fk_sec   = c[2] if c[2] != "NULL" else "NULL"
            fk_cap   = c[3] if c[3] != "NULL" else "NULL"
            texto    = esc(c[5])[:3800]  # truncar para evitar overflow
            # Mapear tipo_nota
            tipo = "Capitulo"
            if "secci" in nivel.lower() or "secc" in nivel.lower(): tipo = "Seccion"
            elif "partida" in nivel.lower(): tipo = "Partida"
            elif "subpartida" in nivel.lower(): tipo = "Subpartida"
            elif "complement" in nivel.lower(): tipo = "Complementaria"
            fk_sec_str = fk_sec if fk_sec != "NULL" else "NULL"
            fk_cap_str = fk_cap if fk_cap != "NULL" else "NULL"
            f.write("  INTO NOTA_LEGAL (tipo_nota, contenido, fk_seccion, fk_capitulo, fk_partida, fk_subpartida) VALUES ('{}', '{}', {}, {}, NULL, NULL)\n".format(
                tipo, texto, fk_sec_str, fk_cap_str))
            notas_ok += 1
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")
print("  OK ->", out, "({} notas)".format(notas_ok))

print("\nTODOS los DML principales generados en:", SQL)
print("Orden de ejecucion completo:")
orden = ["dml_01_unidad_fisica.sql","dml_02_regimen_legal.sql","dml_05_seccion.sql","dml_06_capitulo.sql","dml_07_partida.sql","dml_08_subpartida.sql","dml_03_tarifa_ad_valorem.sql","dml_04_subpartida_regimen.sql","dml_09_nota_legal.sql"]
for i,f in enumerate(orden,1): print("  {}. {}".format(i,f))
