import os, re

BASE_DIR = os.path.join(os.environ['USERPROFILE'], 'Desktop', 'New dise\u00f1o')
INPUT_MD = os.path.join(BASE_DIR, 'docs', 'subpartida_table.md')

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

# Solo las unidades oficiales
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

with open(INPUT_MD, encoding='utf-8', errors='replace') as f:
    lines = f.readlines()

data_lines = [l for l in lines if l.startswith("|") and "---" not in l and not l.startswith("| ID")]

unidades_encontradas = set()
regimenes_encontrados = set()
tarifas_aec = set()
tarifas_exaec = set()
total_subpartidas_con_tarifa = 0

for line in data_lines:
    cols = [c.strip() for c in line.split("|")]
    cols = [c for c in cols if c]
    if len(cols) < 4: continue
    
    desc_raw = cols[3]
    aec_raw = cols[4] if len(cols) > 4 else ""
    exaec_raw = ""
    unidad = ""
    regs = []

    # Extraer de columnas normales si existe AEC
    if aec_raw and re.match(r'^\d+(\.\d+)?$', aec_raw):
        total_subpartidas_con_tarifa += 1
        tarifas_aec.add(aec_raw)
        for val in cols[5:]:
            if re.match(r'^[\d,]+$', val):
                for tok in val.split(','):
                    if tok.isdigit() and 1 <= int(tok) <= 21: regimenes_encontrados.add(int(tok))
            elif re.match(r'^\d+E$', val):
                tarifas_exaec.add(val)
            elif re.match(r'^[a-zA-Z/0-9\.]{1,8}$', val) and not val.isdigit():
                unidad = val
                
    # EXTRAER DE DESCRIPCIONES ROTAS
    elif not aec_raw or aec_raw == "":
        m = re.search(r'\s+(\d+(?:\.\d+)?)\s+([\d\sE]+)?\s*([a-zA-Z/0-9\.]+)$', desc_raw)
        if m:
            total_subpartidas_con_tarifa += 1
            aec = m.group(1)
            tarifas_aec.add(aec)
            regs_y_exaec = m.group(2)
            u_cand = m.group(3)
            
            if regs_y_exaec:
                for tok in regs_y_exaec.split():
                    if 'E' in tok:
                        tarifas_exaec.add(tok)
                    elif tok.isdigit() and 1 <= int(tok) <= 21: 
                        regimenes_encontrados.add(int(tok))
            
            if u_cand and not u_cand.isdigit():
                unidad = u_cand

    # Filtrar solo unidades oficiales (U.F.)
    if unidad:
        # Unificar
        if unidad.lower() == 'kg': unidad = 'kg'
        elif unidad.lower() in ['kw', 'kwh', '1000kwh']: unidad = '1000 kWh'
        elif unidad == '1.000u' or unidad == '1000u': unidad = '1000u'
        elif unidad == '2u' or unidad == 'par': unidad = '2u'
        
        # Guardar solo si esta en las U.F. oficiales
        if unidad in NOMBRES_UNIDAD:
            unidades_encontradas.add(unidad)

out_path = os.path.join(BASE_DIR, 'docs', 'catalogos_extraidos.md')
with open(out_path, 'w', encoding='utf-8') as f:
    f.write("# Catálogos Extraídos del Arancel\n\n")
    f.write("A continuación se presentan los valores extraídos de la tabla de subpartidas con las correcciones aplicadas y filtrados SOLO para las Unidades Físicas (U.F.) oficiales.\n\n")
    
    f.write("## 1. Unidades Físicas (U.F.) Oficiales Encontradas\n")
    f.write("| Sigla | Nombre |\n|---|---|\n")
    for u in sorted(unidades_encontradas):
        f.write(f"| {u} | {NOMBRES_UNIDAD.get(u, 'DESCONOCIDO')} |\n")
        
    f.write("\n## 2. Regímenes Legales (Textos Oficiales Gaceta)\n")
    f.write("| Código | Descripción |\n|---|---|\n")
    for r in range(1, 22):
        f.write(f"| {r} | {REGIMENES.get(r, 'DESCONOCIDO')} |\n")
        
    f.write("\n## 3. Resumen de Tarifas Ad Valorem (AEC y ExAEC)\n")
    f.write(f"Se identificaron tarifas para **{total_subpartidas_con_tarifa}** subpartidas terminales.\n\n")
    f.write("### Porcentajes AEC encontrados (Arancel Externo Común):\n")
    f.write(", ".join(sorted(tarifas_aec, key=float)) + "\n\n")
    f.write("### Porcentajes ExAEC encontrados (Excepciones):\n")
    f.write(", ".join(sorted(tarifas_exaec)) + "\n\n")

print("Generado md en:", out_path)
