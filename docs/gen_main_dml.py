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

REGIMENES = {
    1: "Importacion o Exportacion Prohibida.",
    2: "Importacion o Exportacion Reservada al Ejecutivo Nacional.",
    3: "Permiso del Ministerio del Poder Popular con competencia en materia de salud.",
    4: "Permiso del Ministerio del Poder Popular con competencia en materia de industrias y produccion nacional.",
    5: "Certificado Sanitario del Pais de Origen.",
    6: "Permiso Sanitario del Ministerio del Poder Popular con competencia en materia de agricultura productiva y tierras.",
    7: "Permiso del Ministerio del Poder Popular con competencia en materia de defensa.",
    8: "Licencia de Importacion administrada por el Ministerio del Poder Popular con competencia en materia de alimentacion.",
    9: "Licencia de Importacion administrada por el Ministerio del Poder Popular con competencia en materia de comercio exterior.",
    10: "Permiso del Ministerio del Poder Popular con competencia en materia de ecosocialismo.",
    11: "Permiso del Ministerio del Poder Popular con competencia en materia de petroleo.",
    12: "Registro Sanitario expedido por el Ministerio del Poder Popular con competencia en materia de salud.",
    13: "Registro Sanitario expedido por el Ministerio del Poder Popular con competencia en materia de agricultura productiva y tierras.",
    14: "Permiso del Ministerio del Poder Popular con competencia en materia de alimentacion.",
    15: "Permiso del Ministerio del Poder Popular con competencia en materia de ciencia, tecnologia e innovacion.",
    16: "Licencia de Importacion administrada por el Ministerio del Poder Popular con competencia en materia de industrias y produccion nacional.",
    17: "Permiso del Ministerio del Poder Popular con competencia en materia de energia electrica.",
    18: "Permiso del Ministerio del Poder Popular con competencia en materia de pesca y acuicultura.",
    19: "Certificado del Proceso Kimberley.",
    20: "Constancia de Registro de Norma Venezolana COVENIN o Registro de Reglamento Tecnico administrado por el Servicio Desconcentrado de Normalizacion, Calidad, Metrologia y Reglamentos Tecnicos (SENCAMER), dependiente jerarquicamente del Ministerio del Poder popular con competencia en comercio nacional.",
    21: "Permiso del Registro Nacional Unico de Operadores de Sustancias Quimicas Controladas."
}

NOMBRES_UNIDAD = {
    "kg": "Kilogramo",
    "c/t": "Quilate",
    "m": "Metro",
    "m2": "Metro Cuadrado",
    "m3": "Metro Cubico",
    "cm3": "Centimetro Cubico",
    "l": "Litro",
    "1000 kWh": "Mil kilovatios hora",
    "u": "Unidades o articulos",
    "2u": "Par",
    "12u": "Docena",
    "1000u": "Miles de unidades o articulos"
}

# =============================================================================
# DML 05, 06, 07: SECCION, CAPITULO, PARTIDA (Iguales)
# =============================================================================
print("Generando DML 05 SECCION...")
rows = md_rows(read_md(os.path.join(DOCS, "seccion_table.md")))
with open(os.path.join(SQL, "dml_05_seccion.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: SECCION (22 secciones)\n\nINSERT ALL\n")
    for l in rows:
        c = cols(l)
        if len(c) >= 3: f.write(f"  INTO SECCION (numero_romano, titulo) VALUES ('{esc(c[1])}', '{esc(c[2])}')\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")

print("Generando DML 06 CAPITULO...")
rows = md_rows(read_md(os.path.join(DOCS, "capitulo_table.md")))
with open(os.path.join(SQL, "dml_06_capitulo.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: CAPITULO (98 capitulos)\n\nINSERT ALL\n")
    for l in rows:
        c = cols(l)
        if len(c) >= 4: f.write(f"  INTO CAPITULO (codigo_2digitos, descripcion, fk_seccion) VALUES ('{str(int(c[2])).zfill(2)}', '{esc(c[3])}', {c[1]})\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")

print("Generando DML 07 PARTIDA...")
rows = md_rows(read_md(os.path.join(DOCS, "partida_table.md")))
with open(os.path.join(SQL, "dml_07_partida.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: PARTIDA (~1276 partidas)\n\n")
    for i in range(0, len(rows), BATCH):
        f.write("INSERT ALL\n")
        for l in rows[i:i+BATCH]:
            c = cols(l)
            if len(c) < 4: continue
            desc_raw = c[3]
            for marker in ["CAPITULO", "SECCION IV", "SECCION V", "SECCION", "Notas."]:
                idx = desc_raw.find(marker)
                if idx > 10: desc_raw = desc_raw[:idx].strip()
            f.write(f"  INTO PARTIDA (codigo_4digitos, descripcion, fk_capitulo) VALUES ('{esc(c[2])}', '{esc(desc_raw)}', {c[1]})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")

# =============================================================================
# DML 08, 01, 02, 03, 04: SUBPARTIDAS, UNIDADES, TARIFAS, REGIMENES
# =============================================================================
print("Generando Catalogos y Subpartidas...")
rows = md_rows(read_md(os.path.join(DOCS, "subpartida_table.md")))

code_to_id = {}
subpartidas = []
unidades_usadas = set()
tarifas = []
subp_regimenes = {}

for l in rows:
    c = cols(l)
    if len(c) < 5: continue
    id_sub  = int(c[0])
    fk_part = int(c[1])
    codigo  = c[2]
    desc_raw = c[3]
    aec_raw  = c[4] if len(c) > 4 else ""
    exaec_raw = ""
    unidad = ""
    regs_subp = set()

    if aec_raw and re.match(r'^\d+(\.\d+)?$', aec_raw):
        tarifas.append((id_sub, float(aec_raw), None)) # ExAEC se actualiza abajo
        for val in c[5:]:
            if re.match(r'^[\d,]+$', val):
                for tok in val.split(','):
                    if tok.isdigit() and 1 <= int(tok) <= 21: regs_subp.add(int(tok))
            elif re.match(r'^\d+E$', val):
                exaec_raw = val
            elif re.match(r'^[a-zA-Z/0-9\.]{1,8}$', val) and not val.isdigit():
                unidad = val
    elif not aec_raw or aec_raw == "":
        m = re.search(r'^(.*?)\s+(\d+(?:\.\d+)?)\s+([\d\sE]+)?\s*([a-zA-Z/0-9\.]+)$', desc_raw)
        if m:
            desc_raw = m.group(1).strip()
            aec = m.group(2)
            tarifas.append((id_sub, float(aec), None))
            regs_str = m.group(3)
            u_cand = m.group(4)
            if regs_str:
                for tok in regs_str.split():
                    if 'E' in tok: exaec_raw = tok
                    elif tok.isdigit() and 1 <= int(tok) <= 21: regs_subp.add(int(tok))
            if u_cand and not u_cand.isdigit():
                unidad = u_cand

    if exaec_raw:
        # Update tarifa tuple with ExAEC
        tarifas[-1] = (tarifas[-1][0], tarifas[-1][1], float(exaec_raw.replace('E', '')))

    # Filtrado y unificacion de la unidad usando la lista OFICIAL U.F.
    if unidad:
        if unidad.lower() == 'kg': unidad = 'kg'
        elif unidad.lower() in ['kw', 'kwh', '1000kwh']: unidad = '1000 kWh'
        elif unidad == '1.000u' or unidad == '1000u': unidad = '1000u'
        elif unidad == '2u' or unidad == 'par': unidad = '2u'
        
        if unidad not in NOMBRES_UNIDAD:
            unidad = "" # Descartar las que son simples abreviaturas pero NO unidades fisicas
        else:
            unidades_usadas.add(unidad)

    if regs_subp:
        subp_regimenes[id_sub] = regs_subp

    es_terminal = 1 if (id_sub in [t[0] for t in tarifas]) else 0
    code_to_id[codigo] = id_sub
    subpartidas.append({
        "id": id_sub, "fk_part": fk_part, "codigo": codigo, 
        "desc": desc_raw, "es_terminal": es_terminal, "unidad": unidad
    })

def find_parent_id(codigo, code_to_id):
    parts = codigo.split(".")
    if len(parts) < 2: return None
    candidates = []
    for level in range(len(parts)-1, 0, -1):
        parent_parts = parts[:level] + ["00"] * (len(parts) - level)
        candidate = ".".join(parent_parts)
        if candidate != codigo: candidates.append(candidate)
    for cand in candidates:
        if cand in code_to_id and code_to_id[cand] != code_to_id.get(codigo):
            return code_to_id[cand]
    return None

UNIDAD_MAP = {u: i+1 for i, u in enumerate(sorted(unidades_usadas))}

with open(os.path.join(SQL, "dml_01_unidad_fisica.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: UNIDAD_FISICA\nINSERT ALL\n")
    for u, u_id in UNIDAD_MAP.items():
        f.write(f"  INTO UNIDAD_FISICA (id_unidad, sigla, nombre) VALUES ({u_id}, '{u}', '{NOMBRES_UNIDAD.get(u, u)}')\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")

with open(os.path.join(SQL, "dml_02_regimen_legal.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: REGIMEN_LEGAL\nINSERT ALL\n")
    for r in range(1, 22):
        f.write(f"  INTO REGIMEN_LEGAL (codigo_regimen, descripcion) VALUES ({r}, '{REGIMENES.get(r, str(r))}')\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")

with open(os.path.join(SQL, "dml_08_subpartida.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: SUBPARTIDA\n\n")
    for i in range(0, len(subpartidas), BATCH):
        f.write("INSERT ALL\n")
        for s in subpartidas[i:i+BATCH]:
            parent_id = find_parent_id(s["codigo"], code_to_id)
            p_str = str(parent_id) if parent_id else "NULL"
            u_str = str(UNIDAD_MAP[s["unidad"]]) if s["unidad"] else "NULL"
            desc = esc(s["desc"])[:3900]
            f.write(f"  INTO SUBPARTIDA (id_subpartida, codigo_10digitos, descripcion, es_terminal, fk_partida, fk_unidad, fk_subpartida_padre) VALUES ({s['id']}, '{s['codigo']}', '{desc}', {s['es_terminal']}, {s['fk_part']}, {u_str}, {p_str})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")

with open(os.path.join(SQL, "dml_03_tarifa_ad_valorem.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: TARIFA_AD_VALOREM\n\n")
    for i in range(0, len(tarifas), BATCH):
        f.write("INSERT ALL\n")
        for (id_s, aec, exaec) in tarifas[i:i+BATCH]:
            ex = str(exaec) if exaec is not None else "NULL"
            f.write(f"  INTO TARIFA_AD_VALOREM (porcentaje_aec, porcentaje_exaec, fk_subpartida) VALUES ({aec}, {ex}, {id_s})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")

items = [(id_s, c) for id_s, cs in subp_regimenes.items() for c in sorted(cs)]
with open(os.path.join(SQL, "dml_04_subpartida_regimen.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: SUBPARTIDA_REGIMEN\n\n")
    for i in range(0, len(items), BATCH):
        f.write("INSERT ALL\n")
        for (id_s, c) in items[i:i+BATCH]:
            f.write(f"  INTO SUBPARTIDA_REGIMEN (fk_subpartida, fk_regimen) VALUES ({id_s}, {c})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")

print("Generando DML 09 NOTA_LEGAL...")
rows = md_rows(read_md(os.path.join(DOCS, "notas_legales_table.md")))
with open(os.path.join(SQL, "dml_09_nota_legal.sql"), "w", encoding="utf-8") as f:
    f.write("-- DML: NOTA_LEGAL\n\n")
    for i in range(0, len(rows), BATCH):
        f.write("INSERT ALL\n")
        for l in rows[i:i+BATCH]:
            c = cols(l)
            if len(c) < 6: continue
            tipo = "Capitulo"
            if "secc" in c[1].lower(): tipo = "Seccion"
            elif "partida" in c[1].lower(): tipo = "Partida"
            elif "subpartida" in c[1].lower(): tipo = "Subpartida"
            elif "complement" in c[1].lower(): tipo = "Complementaria"
            fk_sec = c[2] if c[2] != "NULL" else "NULL"
            fk_cap = c[3] if c[3] != "NULL" else "NULL"
            f.write(f"  INTO NOTA_LEGAL (tipo_nota, contenido, fk_seccion, fk_capitulo, fk_partida, fk_subpartida) VALUES ('{tipo}', '{esc(c[5])[:3800]}', {fk_sec}, {fk_cap}, NULL, NULL)\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")

print("\nTodos los scripts actualizados correctamente.")
