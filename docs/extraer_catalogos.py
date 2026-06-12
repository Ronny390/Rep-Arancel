"""
Script: extraer_catalogos.py
Propósito: Extraer desde subpartida_table.md los datos faltantes para:
  - UNIDAD_FISICA   (catálogo de unidades únicas: kg, u, m, l...)
  - TARIFA_AD_VALOREM (AEC y ExAEC por subpartida)
  - REGIMEN_LEGAL   (catálogo de los 21 regímenes con descripción)
  - SUBPARTIDA_REGIMEN (relación N:M subpartida <-> régimen)
Genera 4 archivos SQL DML listos para ejecutar en Oracle.
"""

import re
import os

BASE_DIR   = r"c:\Users\usuario\Desktop\New diseno"
INPUT_MD   = os.path.join(BASE_DIR, "docs", "subpartida_table.md")
OUTPUT_DIR = os.path.join(BASE_DIR, "sql")
os.makedirs(OUTPUT_DIR, exist_ok=True)

REGIMENES = {
    1:  "Libre importacion",
    2:  "Permiso sanitario - MPPS (Ministerio de Salud)",
    3:  "Permiso sanitario - INSAI (Agricultura y Tierras)",
    4:  "Autorizacion ambiental - MINEA",
    5:  "Permiso sanitario - SASA (Servicio Autonomo de Sanidad Agropecuaria)",
    6:  "Permiso MPPA (Ministerio de Pesca y Agricultura)",
    7:  "Certificado de origen SENCAMER",
    8:  "Permiso especial - MPPS (sustancias peligrosas)",
    9:  "Autorizacion MPPEE (Energia Electrica)",
    10: "Permiso MPPAT (Ambiente y Turismo - fauna silvestre)",
    11: "Autorizacion MPPCTI (Ciencia y Tecnologia)",
    12: "Autorizacion MPPRE (Relaciones Exteriores)",
    13: "Permiso especial - Ministerio de Defensa",
    14: "Autorizacion MPPEE (Energia Electrica - hidrocarburos)",
    15: "Permiso sanitario de importacion SASA - Vegetal",
    16: "Certificado de calidad SENCAMER",
    17: "Permiso MPPC (Comercio - cuotas de importacion)",
    18: "Certificado sanitario de origen (productos pesqueros)",
    19: "Autorizacion especial MPPPF (Planificacion y Finanzas)",
    20: "Permiso especial de importacion - MPPT (Turismo)",
    21: "Otros permisos o autorizaciones especiales",
}

NOMBRES_UNIDAD = {
    "kg": "Kilogramo",
    "u":  "Unidad",
    "l":  "Litro",
    "m":  "Metro",
    "m2": "Metro cuadrado",
    "m3": "Metro cubico",
    "t":  "Tonelada metrica",
    "g":  "Gramo",
    "ml": "Mililitro",
    "cm": "Centimetro",
}

# Leer y procesar el archivo
print("Leyendo:", INPUT_MD)
with open(INPUT_MD, encoding="utf-8", errors="replace") as f:
    lines = f.readlines()

data_lines = [l for l in lines
              if l.startswith("|") and "---" not in l and not l.startswith("| ID")]

unidades_set    = set()
tarifas         = []
subp_regimenes  = {}
regimenes_usados = set()

print(f"  Procesando {len(data_lines)} filas...")

for line in data_lines:
    cols = [c.strip() for c in line.split("|")]
    cols = [c for c in cols if c != ""]
    if len(cols) < 5:
        continue

    id_sub  = cols[0]
    aec_raw = cols[4] if len(cols) > 4 else ""

    # Clasificar columnas restantes por contenido
    exaec_raw  = ""
    regs_raw   = []
    unidad_raw = ""

    for val in cols[5:]:
        if re.match(r"^\d+E$", val):
            exaec_raw = val
        elif re.match(r"^[\d,]+$", val) and "," in val:
            regs_raw.append(val)
        elif re.match(r"^\d+$", val) and 1 <= int(val) <= 21:
            regs_raw.append(val)
        elif re.match(r"^[a-zA-Z][a-zA-Z0-9]*$", val) and len(val) <= 4:
            unidad_raw = val

    if unidad_raw:
        unidades_set.add(unidad_raw)

    try:
        id_sub_int = int(id_sub)
        aec_val = float(aec_raw) if aec_raw and re.match(r"^\d+(\.\d+)?$", aec_raw) else None
        exaec_val = None
        if exaec_raw:
            m = re.match(r"^(\d+(\.\d+)?)E?$", exaec_raw)
            if m:
                exaec_val = float(m.group(1))
        if aec_val is not None:
            tarifas.append((id_sub_int, aec_val, exaec_val))
    except ValueError:
        pass

    try:
        id_sub_int = int(id_sub)
        codigos = set()
        for campo in regs_raw:
            for tok in campo.split(","):
                tok = re.sub(r"[^0-9]", "", tok)
                if tok.isdigit() and 1 <= int(tok) <= 21:
                    codigos.add(int(tok))
                    regimenes_usados.add(int(tok))
        if codigos:
            subp_regimenes[id_sub_int] = codigos
    except ValueError:
        pass

print(f"  Unidades unicas   : {len(unidades_set)} -> {sorted(unidades_set)}")
print(f"  Tarifas           : {len(tarifas)}")
print(f"  Regimenes usados  : {sorted(regimenes_usados)}")
print(f"  Relaciones N:M    : {len(subp_regimenes)}")

BATCH = 500

# DML 1: UNIDAD_FISICA
out = os.path.join(OUTPUT_DIR, "dml_01_unidad_fisica.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: UNIDAD_FISICA\n\nINSERT ALL\n")
    for sigla in sorted(unidades_set):
        nombre = NOMBRES_UNIDAD.get(sigla, sigla.upper())
        f.write(f"  INTO UNIDAD_FISICA (sigla, nombre) VALUES ('{sigla}', '{nombre}')\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")
print("  Generado:", out)

# DML 2: REGIMEN_LEGAL
out = os.path.join(OUTPUT_DIR, "dml_02_regimen_legal.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: REGIMEN_LEGAL\n\nINSERT ALL\n")
    for codigo in range(1, 22):
        desc = REGIMENES.get(codigo, f"Regimen {codigo}")
        f.write(f"  INTO REGIMEN_LEGAL (codigo_regimen, descripcion) VALUES ({codigo}, '{desc}')\n")
    f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n")
print("  Generado:", out)

# DML 3: TARIFA_AD_VALOREM
out = os.path.join(OUTPUT_DIR, "dml_03_tarifa_ad_valorem.sql")
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: TARIFA_AD_VALOREM\n\n")
    for i in range(0, len(tarifas), BATCH):
        f.write("INSERT ALL\n")
        for (id_s, aec, exaec) in tarifas[i:i+BATCH]:
            ex = str(exaec) if exaec is not None else "NULL"
            f.write(f"  INTO TARIFA_AD_VALOREM (porcentaje_aec, porcentaje_exaec, fk_subpartida)"
                    f" VALUES ({aec}, {ex}, {id_s})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")
print("  Generado:", out)

# DML 4: SUBPARTIDA_REGIMEN
out = os.path.join(OUTPUT_DIR, "dml_04_subpartida_regimen.sql")
items = [(id_s, cod) for id_s, cs in subp_regimenes.items() for cod in sorted(cs)]
with open(out, "w", encoding="utf-8") as f:
    f.write("-- DML: SUBPARTIDA_REGIMEN\n\n")
    for i in range(0, len(items), BATCH):
        f.write("INSERT ALL\n")
        for (id_s, cod) in items[i:i+BATCH]:
            f.write(f"  INTO SUBPARTIDA_REGIMEN (fk_subpartida, fk_regimen) VALUES ({id_s}, {cod})\n")
        f.write("SELECT 1 FROM DUAL;\nCOMMIT;\n\n")
print("  Generado:", out)

print("\nTodos los DML generados en:", OUTPUT_DIR)
