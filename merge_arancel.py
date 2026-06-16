import re

def main():
    # 1. Read old subpartidas
    old_code_to_unidad = {}
    old_id_to_code = {}
    
    # Read dml_08_subpartida.sql and dml_10_subpartida_faltantes.sql
    for filename in ['sql/dml_08_subpartida.sql', 'sql/dml_10_subpartida_faltantes.sql']:
        try:
            with open(filename, 'r', encoding='utf-8') as f:
                for line in f:
                    m = re.search(r"VALUES \((\d+),\s*'([^']+)',.*?,\s*(NULL|\d+),\s*(NULL|\d+)\);", line)
                    if m:
                        id_sub = int(m.group(1))
                        code = m.group(2)
                        fk_unidad = m.group(3)
                        
                        old_id_to_code[id_sub] = code
                        if fk_unidad != 'NULL':
                            old_code_to_unidad[code] = fk_unidad
        except FileNotFoundError:
            pass

    # 2. Read old regimens
    code_to_regimens = {}
    try:
        with open('sql/dml_04_subpartida_regimen.sql', 'r', encoding='utf-8') as f:
            for line in f:
                m = re.search(r"VALUES \((\d+),\s*(\d+)\);", line)
                if m:
                    id_sub = int(m.group(1))
                    fk_regimen = int(m.group(2))
                    code = old_id_to_code.get(id_sub)
                    if code:
                        if code not in code_to_regimens:
                            code_to_regimens[code] = []
                        code_to_regimens[code].append(fk_regimen)
    except FileNotFoundError:
        pass

    # 3. Read new subpartidas from dml_08_subpartida_full.sql
    # Wait, my full script already created dml_08_subpartida_full.sql.
    # Let's read it and replace the fk_unidad and collect the mappings for regimens.
    new_lines = []
    new_regimen_lines = []
    
    with open('sql/dml_08_subpartida_full.sql', 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith("INSERT INTO SUBPARTIDA"):
                # Example: INSERT INTO SUBPARTIDA (id_subpartida, codigo_10digitos, descripcion, es_terminal, fk_partida, fk_unidad, fk_subpartida_padre) VALUES (1, '0101.21.00.10', 'Reproductores de raza pura: - Para carreras', 1, 1, NULL, NULL);
                m = re.search(r"VALUES \((\d+),\s*'([^']+)'", line)
                if m:
                    new_id = int(m.group(1))
                    code = m.group(2)
                    
                    # Update fk_unidad
                    if code in old_code_to_unidad:
                        # Replace NULL before fk_subpartida_padre
                        line = re.sub(r", NULL, (NULL|\d+)\);", f", {old_code_to_unidad[code]}, \g<1>);", line)
                    
                    new_lines.append(line)
                    
                    # Add regimens
                    if code in code_to_regimens:
                        for reg in code_to_regimens[code]:
                            new_regimen_lines.append(f"INSERT INTO SUBPARTIDA_REGIMEN (fk_subpartida, fk_regimen) VALUES ({new_id}, {reg});\n")
            else:
                new_lines.append(line)

    # 4. Write back the updated dml_08_subpartida_full.sql
    with open('sql/dml_08_subpartida_final.sql', 'w', encoding='utf-8') as f:
        for line in new_lines:
            f.write(line)
            
    # 5. Write the new regimen script
    with open('sql/dml_04_subpartida_regimen_final.sql', 'w', encoding='utf-8') as f:
        f.write("SET SQLBLANKLINES ON;\n")
        f.write("-- DML: SUBPARTIDA_REGIMEN (RECONSTRUIDO)\n")
        for line in new_regimen_lines:
            f.write(line)
        f.write("COMMIT;\n")

    print("Archivos dml_08_subpartida_final.sql y dml_04_subpartida_regimen_final.sql generados exitosamente.")

if __name__ == '__main__':
    main()
