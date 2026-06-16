"""
Script v3: Extrae subpartidas faltantes usando pdfplumber con layout=True.
"""
import pdfplumber
import re

def main():
    print("=" * 60)
    print("COMPLETACIÓN DEL ARANCEL v3 (pdfplumber layout)")
    print("=" * 60)

    print("\n[1/6] Leyendo PDF con pdfplumber...")
    all_lines = []
    with pdfplumber.open('docs/Arancel_24-04-25.pdf') as pdf:
        total = len(pdf.pages)
        for i, page in enumerate(pdf.pages):
            if i % 50 == 0:
                print(f"  Procesando página {i}/{total}...")
            # x_tolerance=1.5 fuerza a pdfplumber a insertar espacios 
            # en separaciones más pequeñas, evitando palabras pegadas.
            text = page.extract_text(layout=True, x_tolerance=1.5)
            if text:
                all_lines.extend(text.split('\n'))

    print("\n[2/6] Uniendo líneas fragmentadas...")
    # El patrón de un código de 10 dígitos al inicio de la línea (después de espacios)
    code_pattern = re.compile(r'^\s*(\d{4}\.\d{2}\.\d{2}\.\d{2})\s+(.*)')
    # Partidas, subpartidas cortas (no nos interesan para insertar, pero marcan inicio de algo nuevo)
    other_code_pattern = re.compile(r'^\s*(\d{4}\.\d{2}(?:\.\d{2})?|\d{2}\.\d{2})\s+(.*)')
    
    merged = []
    for line in all_lines:
        if not line.strip():
            continue
            
        m10 = code_pattern.match(line)
        m_other = other_code_pattern.match(line)
        
        if m10 or m_other:
            # Empieza una nueva línea con código
            merged.append(line.strip())
        else:
            # Línea de continuación (suele empezar con muchos espacios)
            if merged:
                merged[-1] += ' ' + line.strip()

    print(f"  Total líneas unidas: {len(merged)}")
    
    pdf_records = {}
    for line in merged:
        m = code_pattern.match(line)
        if m:
            code = m.group(1)
            rest = m.group(2)
            pdf_records[code] = rest
            
    print(f"  Códigos 10 dígitos extraídos: {len(pdf_records)}")

    print("\n[3/6] Leyendo SQL existente...")
    existing_codes = set()
    max_id = 0
    with open('sql/dml_08_subpartida.sql', 'r', encoding='utf-8') as f:
        for line in f:
            m = re.search(r"VALUES \((\d+),\s*'(\d{4}\.\d{2}\.\d{2}\.\d{2})'", line)
            if m:
                sid = int(m.group(1))
                existing_codes.add(m.group(2))
                if sid > max_id:
                    max_id = sid
                    
    partidas = {}
    partida_id = 0
    with open('sql/dml_07_partida.sql', 'r', encoding='utf-8') as f:
        for line in f:
            m = re.search(r"VALUES \('(\d{2}\.\d{2})'", line)
            if m:
                partida_id += 1
                partidas[m.group(1)] = partida_id

    missing = {k: v for k, v in pdf_records.items() if k not in existing_codes}
    print(f"  Faltantes reales: {len(missing)}")

    print("\n[4/6] Generando INSERTs...")
    next_id = max_id + 1
    new_subpartidas = []
    new_tariffs = []
    skipped = 0

    for code in sorted(missing.keys()):
        raw = missing[code]
        partida_code = code[:2] + '.' + code[2:4]
        fk_partida = partidas.get(partida_code)
        
        if not fk_partida:
            skipped += 1
            continue
            
        # Limpiar raw de espacios dobles
        raw = re.sub(r'\s+', ' ', raw)
        
        # Extraer guiones
        dash_m = re.match(r'^(-+)\s*(.*)', raw)
        if dash_m:
            dashes = dash_m.group(1)
            content = dash_m.group(2)
        else:
            dashes = ''
            content = raw
            
        aec = None
        exaec = None
        desc = content
        
        # Parsear valores finales: AEC, RegLegal, ExAEC (opcional), Unidad
        # Ejemplo: "marinos y morsas... 4 5,10 10 u"
        tariff_m = re.search(
            r'\s+(\d{1,3}(?:\.\d+)?(?:BK)?|[0O]BIT|OBIT)\s+'
            r'([\d,]+)\s+'
            r'(?:(\d+)\s+)?'
            r'([a-zA-Z\u2113]{1,3})\s*$',
            content
        )
        if tariff_m:
            aec = tariff_m.group(1)
            exaec = tariff_m.group(3)
            desc = content[:tariff_m.start()].strip()
        else:
            simple_m = re.search(r'\s+(\d{1,3}(?:\.\d+)?(?:BK)?|[0O]BIT|OBIT)\s+(0A|--)\s*$', content)
            if simple_m:
                aec = simple_m.group(1)
                exaec = simple_m.group(2) if simple_m.group(2) != '--' else None
                desc = content[:simple_m.start()].strip()
                
        # Limpieza final de descripcion
        desc = f"{dashes} {desc}".strip()
        desc = desc.replace("'", "''")
        
        es_terminal = 1 if aec is not None else 0
        
        new_subpartidas.append(
            f"INSERT INTO SUBPARTIDA (id_subpartida, codigo_10digitos, descripcion, "
            f"es_terminal, fk_partida, fk_unidad, fk_subpartida_padre) "
            f"VALUES ({next_id}, '{code}', '{desc}', {es_terminal}, {fk_partida}, NULL, NULL);"
        )
        
        if aec is not None:
            num_match = re.search(r'^(\d+(?:\.\d+)?)', aec)
            val_num = num_match.group(1) if num_match else 'NULL'
            exaec_sql = f"'{exaec}'" if exaec else 'NULL'
            new_tariffs.append(
                f"INSERT INTO TARIFA_AD_VALOREM (codigo_aec, codigo_exaec, "
                f"valor_numerico_aec, fk_subpartida) VALUES ('{aec}', {exaec_sql}, "
                f"{val_num}, {next_id});"
            )
            
        next_id += 1

    print("\n[5/6] Escribiendo archivos SQL...")
    with open('sql/dml_10_subpartida_faltantes.sql', 'w', encoding='utf-8') as f:
        f.write("SET SQLBLANKLINES ON;\n")
        f.write(f"-- DML: SUBPARTIDAS FALTANTES ({len(new_subpartidas)})\n\n")
        f.write('\n'.join(new_subpartidas) + "\nCOMMIT;\n")
        
    with open('sql/dml_11_tarifa_faltantes.sql', 'w', encoding='utf-8') as f:
        f.write("SET SQLBLANKLINES ON;\n")
        f.write(f"-- DML: TARIFAS FALTANTES ({len(new_tariffs)})\n\n")
        f.write('\n'.join(new_tariffs) + "\nCOMMIT;\n")

    print("\n[6/6] RESUMEN:")
    print(f"  Subpartidas generadas: {len(new_subpartidas)}")
    print(f"  Tarifas generadas: {len(new_tariffs)}")
    print(f"  Ejemplo 1: {new_subpartidas[0][:150]}")
    print(f"  Ejemplo 2: {new_subpartidas[1][:150]}")

if __name__ == '__main__':
    main()
