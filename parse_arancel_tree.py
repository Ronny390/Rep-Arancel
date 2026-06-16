import pdfplumber
import re
import sys

def main():
    print("=" * 60)
    print("RECONSTRUCCIÓN DE LA JERARQUÍA DEL ARANCEL")
    print("=" * 60)

    print("\n[1/6] Leyendo PDF con pdfplumber...")
    all_lines = []
    with pdfplumber.open('docs/Arancel_24-04-25.pdf') as pdf:
        total = len(pdf.pages)
        for i, page in enumerate(pdf.pages):
            if i % 50 == 0:
                print(f"  Procesando página {i}/{total}...")
            text = page.extract_text(layout=True, x_tolerance=1.5)
            if text:
                all_lines.extend(text.split('\n'))

    print("\n[2/6] Uniendo líneas fragmentadas y extrayendo TODOS los códigos...")
    # Captura cualquier código que empiece con 4 dígitos y tenga sub-niveles (ej. 8536.4, 8536.41, 8536.41.00.00)
    # Se asegura de que no atrape texto basura.
    code_pattern = re.compile(r'^\s*(\d{4}(?:\.\d{1,2})+)\s+(.*)')
    
    # También capturamos partidas (ej. 85.36) para saber en qué partida estamos, aunque no se inserten en SUBPARTIDA.
    partida_pattern = re.compile(r'^\s*(\d{2}\.\d{2})\s+(.*)')
    
    merged = []
    for line in all_lines:
        if not line.strip():
            continue
            
        m_code = code_pattern.match(line)
        m_partida = partida_pattern.match(line)
        
        if m_code or m_partida:
            merged.append(line.strip())
        else:
            if merged:
                merged[-1] += ' ' + line.strip()

    print(f"  Total líneas unidas: {len(merged)}")
    
    # Leer IDs de Partidas existentes
    print("\n[3/6] Leyendo SQL de partidas existentes...")
    partidas = {}
    partida_id = 0
    try:
        with open('sql/dml_07_partida.sql', 'r', encoding='utf-8') as f:
            for line in f:
                m = re.search(r"VALUES \('(\d{2}\.\d{2})'", line)
                if m:
                    partida_id += 1
                    partidas[m.group(1)] = partida_id
    except FileNotFoundError:
        print("ERROR: No se encuentra sql/dml_07_partida.sql")
        sys.exit(1)

    print("\n[4/6] Construyendo el árbol jerárquico...")
    
    subpartidas = []
    parent_stack = {}  # level -> id_subpartida
    next_id = 1
    
    current_fk_partida = None
    
    for line in merged:
        m_partida = partida_pattern.match(line)
        if m_partida:
            p_code = m_partida.group(1)
            if p_code in partidas:
                current_fk_partida = partidas[p_code]
                # Resetear la pila al cambiar de partida
                parent_stack = {}
            continue
            
        m_code = code_pattern.match(line)
        if m_code:
            code = m_code.group(1)
            raw = m_code.group(2)
            
            if not current_fk_partida:
                # Tratar de inferir la partida a partir del código (primeros 4 dígitos)
                p_code = code[:2] + '.' + code[2:4]
                if p_code in partidas:
                    current_fk_partida = partidas[p_code]
                else:
                    continue # Ignorar si no encontramos la partida
            
            # Limpiar espacios
            raw = re.sub(r'\s+', ' ', raw)
            
            # Contar guiones iniciales para determinar el nivel
            dash_m = re.match(r'^((?:-\s*)+)(.*)', raw)
            if dash_m:
                dashes_str = dash_m.group(1)
                content = dash_m.group(2)
                level = dashes_str.count('-')
                dashes_prefix = dashes_str.strip() + " "
            else:
                level = 0
                content = raw
                dashes_prefix = ""
                
            # Extraer tarifas
            aec = None
            exaec = None
            val_num = 'NULL'
            desc = content
            
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
                    
            if aec:
                num_match = re.search(r'^(\d+(?:\.\d+)?)', aec)
                val_num = num_match.group(1) if num_match else 'NULL'
            
            # Limpieza final de descripcion (añadimos los guiones para mantener el formato visual original)
            desc = f"{dashes_prefix}{desc}".strip()
            for garbage in ['GACETA', 'REPBLICA', 'SSEE', 'Extraordinario', 'Cdigo']:
                idx = desc.find(garbage)
                if idx != -1:
                    desc = desc[:idx].strip()
            desc = desc[:1000].replace("'", "''")
            
            # Determinar el padre
            fk_subpartida_padre = 'NULL'
            if level > 1:
                # El padre es el último nodo visto en el nivel anterior
                parent_id = parent_stack.get(level - 1)
                if parent_id:
                    fk_subpartida_padre = parent_id
            
            # Registrar este nodo en la pila
            parent_stack[level] = next_id
            
            subpartidas.append({
                'id': next_id,
                'codigo': code,
                'desc': desc,
                'fk_partida': current_fk_partida,
                'fk_padre': fk_subpartida_padre,
                'aec': aec,
                'exaec': exaec,
                'val_num': val_num
            })
            next_id += 1

    print(f"  Total subpartidas extraídas: {len(subpartidas)}")

    print("\n[5/6] Calculando es_terminal...")
    # Un nodo es terminal si su ID NO está en la lista de padres de ningún otro nodo
    padres_ids = set(s['fk_padre'] for s in subpartidas if s['fk_padre'] != 'NULL')
    
    for s in subpartidas:
        if s['id'] not in padres_ids:
            s['es_terminal'] = 1
        else:
            s['es_terminal'] = 0

    print("\n[6/6] Generando archivo SQL dml_08_subpartida_full.sql...")
    with open('sql/dml_08_subpartida_full.sql', 'w', encoding='utf-8') as f:
        f.write("SET SQLBLANKLINES ON;\n")
        f.write("-- ========================================================\n")
        f.write("-- DML: SUBPARTIDAS CON JERARQUIA COMPLETA\n")
        f.write("-- ========================================================\n\n")
        
        for s in subpartidas:
            f.write(
                f"INSERT INTO SUBPARTIDA (id_subpartida, codigo_10digitos, descripcion, "
                f"es_terminal, fk_partida, fk_unidad, fk_subpartida_padre) "
                f"VALUES ({s['id']}, '{s['codigo']}', '{s['desc']}', {s['es_terminal']}, "
                f"{s['fk_partida']}, NULL, {s['fk_padre']});\n"
            )
            
            if s['aec'] is not None:
                exaec_sql = f"'{s['exaec']}'" if s['exaec'] else 'NULL'
                f.write(
                    f"INSERT INTO TARIFA_AD_VALOREM (codigo_aec, codigo_exaec, "
                    f"valor_numerico_aec, fk_subpartida) VALUES ('{s['aec']}', {exaec_sql}, "
                    f"{s['val_num']}, {s['id']});\n"
                )
        f.write("\nCOMMIT;\n")

    print("\n¡Proceso completado exitosamente!")
    print(f"Archivo generado: sql/dml_08_subpartida_full.sql con {len(subpartidas)} registros.")

if __name__ == '__main__':
    main()
