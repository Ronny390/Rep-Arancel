import re

def clean_subpartidas():
    subpartida_file = 'sql/dml_08_subpartida_final.sql'
    
    with open(subpartida_file, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        
    cleaned_lines = []
    missing_tariffs = []
    missing_regimes = []
    
    # Regex for description tail extraction
    # Groups:
    # 1: Clean description
    # 2: Tarifa AEC (usually 1-2 digits, maybe .5, maybe BK)
    # 3: ExAEC (optional, typically 10E, 20E, 0A, etc. Let's say it always has at least one letter to avoid confusing with regimen, except if it's explicitly parsed. Actually, let's keep it simple: 1 to 3 chars, letters and digits, starting with digit)
    # 4: Regimen (optional, digits, commas, and spaces)
    # 5: Unidad (optional)
    
    # Let's use the simplest reliable regex for the majority of the cases:
    # Most corrupted lines look like: "... 10 20E 3,5,6 kg" or "... 2 5,6 u" or "... 10 3,5,6 kg"
    
    desc_pattern = re.compile(r"^(.*?)\s+([0-9]{1,2})(?:\s+([0-9]{1,2}[A-Z]{1,2}))?(?:\s+([0-9,\s]+))?(?:\s+(u|kg|l|m|t|kWh|kW|mg|mm|cm|pa|par|pares))?$")
    
    unit_map = {
        '1000 kWh': '1',
        '2u': '2', 'pa': '2', 'par': '2', 'pares': '2',
        'kg': '3',
        'm': '4',
        'u': '5'
    }
    
    insert_pattern = re.compile(r"^(INSERT INTO SUBPARTIDA .*? VALUES \()(\d+),\s*'([^']+)',\s*'(.*?)',\s*(\d+),\s*(\d+),\s*(NULL|\d+),\s*(NULL|\d+)\);(.*)$")

    count_fixed = 0

    for line in lines:
        if 'INSERT INTO SUBPARTIDA' not in line:
            cleaned_lines.append(line)
            continue
            
        m = insert_pattern.search(line)
        if m:
            prefix = m.group(1)
            fk = m.group(2)
            codigo = m.group(3)
            desc = m.group(4)
            es_term = m.group(5)
            fk_part = m.group(6)
            fk_unidad = m.group(7)
            fk_padre = m.group(8)
            suffix = m.group(9)
            
            # Check if description has garbage
            # But only apply if desc ends with a known unit, or numbers, and is not a normal string ending in numbers (like "vitamina B12")
            # We enforce that group 2 is one of the valid tariffs: 0, 2, 4, 6, 8, 10, 12, 14, 16, 20, 35
            
            m_desc = desc_pattern.search(desc)
            if m_desc:
                aec = m_desc.group(2)
                if aec in ['0', '2', '4', '6', '8', '10', '12', '14', '16', '20', '35']:
                    clean_desc = m_desc.group(1).strip()
                    exaec = m_desc.group(3)
                    regimenes = m_desc.group(4)
                    
                    # Extra safety: if clean_desc is empty or super short, something is wrong
                    if len(clean_desc) > 3:
                        # Extract Unit
                        extracted_unit = m_desc.group(5)
                        if extracted_unit and extracted_unit in unit_map:
                            fk_unidad = unit_map[extracted_unit]
                            
                        # Extract Tarifa
                        exaec_sql = f"'{exaec}'" if exaec else "NULL"
                        missing_tariffs.append(f"INSERT INTO TARIFA_AD_VALOREM (codigo_aec, codigo_exaec, valor_numerico_aec, fk_subpartida) VALUES ('{aec}', {exaec_sql}, {aec}, {fk});\n")
                        
                        # Extract Regimen
                        if regimenes:
                            # Split by commas or spaces
                            regs = re.findall(r'\d+', regimenes)
                            for reg in regs:
                                missing_regimes.append(f"INSERT INTO SUBPARTIDA_REGIMEN (fk_subpartida, fk_regimen) VALUES ({fk}, {reg});\n")
                                
                        # We reconstruct the line
                        new_line = f"{prefix}{fk}, '{codigo}', '{clean_desc}', {es_term}, {fk_part}, {fk_unidad}, {fk_padre});{suffix}\n"
                        cleaned_lines.append(new_line)
                        count_fixed += 1
                        continue

        cleaned_lines.append(line)

    with open(subpartida_file, 'w', encoding='utf-8') as f:
        f.writelines(cleaned_lines)
        
    if missing_tariffs:
        with open('sql/dml_12_tarifas_corregidas.sql', 'w', encoding='utf-8') as f:
            f.write("SET SQLBLANKLINES ON;\n")
            f.write("-- DML: TARIFAS CORREGIDAS (EXTRAIDAS DE TEXTOS SUCIOS)\n")
            f.writelines(missing_tariffs)
            f.write("COMMIT;\n")
            
    if missing_regimes:
        with open('sql/dml_13_regimenes_corregidos.sql', 'w', encoding='utf-8') as f:
            f.write("SET SQLBLANKLINES ON;\n")
            f.write("-- DML: REGIMENES CORREGIDOS (EXTRAIDOS DE TEXTOS SUCIOS)\n")
            f.writelines(missing_regimes)
            f.write("COMMIT;\n")
            
    print(f"✅ Se corrigieron {count_fixed} descripciones de subpartidas.")
    print(f"✅ Se extrajeron {len(missing_tariffs)} tarifas faltantes -> sql/dml_12_tarifas_corregidas.sql")
    print(f"✅ Se extrajeron {len(missing_regimes)} regimenes faltantes -> sql/dml_13_regimenes_corregidos.sql")

if __name__ == '__main__':
    clean_subpartidas()
