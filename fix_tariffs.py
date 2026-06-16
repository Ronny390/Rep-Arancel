import re

def process_tariffs():
    # 1. Parse existing dml_03
    existing = {}
    with open('sql/dml_03_tarifa_ad_valorem.sql', 'r', encoding='utf-8') as f:
        for line in f:
            m = re.search(r'VALUES \(([^,]+),\s*([^,]+),\s*(\d+)\)', line)
            if m:
                aec = m.group(1).strip()
                exaec = m.group(2).strip()
                fk = m.group(3).strip()
                if aec.endswith('.0'): aec = aec[:-2]
                if exaec == 'NULL': exaec = ''
                existing[fk] = (aec, exaec)

    # 2. Parse and fix dml_08
    fixed_subpartidas = []
    extracted = {}
    with open('sql/dml_08_subpartida.sql', 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    for line in lines:
        if 'INSERT INTO SUBPARTIDA' not in line:
            fixed_subpartidas.append(line)
            continue
            
        m = re.search(r'(INSERT INTO SUBPARTIDA.*?VALUES \()(\d+),\s*\'([^\']+)\',\s*\'(.*?)\'(.*)', line)
        if m:
            prefix = m.group(1)
            fk = m.group(2)
            codigo = m.group(3)
            desc = m.group(4)
            suffix = m.group(5)
            
            # Check for bad suffix in desc
            # Pattern: matches space + (numbers optionally followed by BK or just OBIT/0BIT) + optional space + (0A or --) at the end of string
            m_desc = re.search(r'\s+([0-9]{1,3}(?:\.[0-9]+)?BK?|[0O]BIT)\s*(0A|--)?$', desc)
            if m_desc:
                aec = m_desc.group(1)
                exaec = m_desc.group(2) if m_desc.group(2) else ''
                # Clean desc
                desc = desc[:m_desc.start()]
                extracted[fk] = (aec, exaec)
                
            fixed_subpartidas.append(f"{prefix}{fk}, '{codigo}', '{desc}'{suffix}\n")
        else:
            fixed_subpartidas.append(line)
            
    with open('sql/dml_08_subpartida.sql', 'w', encoding='utf-8', newline='\n') as f:
        for l in fixed_subpartidas:
            f.write(l)

    # 3. Combine and rewrite dml_03
    combined = {}
    combined.update(existing)
    combined.update(extracted)
    
    with open('sql/dml_03_tarifa_ad_valorem.sql', 'w', encoding='utf-8', newline='\n') as f:
        f.write("SET SQLBLANKLINES ON;\n")
        f.write("-- DML: TARIFA_AD_VALOREM\n")
        for fk in sorted(combined.keys(), key=lambda x: int(x)):
            aec, exaec = combined[fk]
            
            # numeric value logic
            val_num = 'NULL'
            m_num = re.search(r'^([0-9]+(?:\.[0-9]+)?)', aec)
            if m_num:
                val_num = m_num.group(1)
            
            # format strings for SQL
            aec_sql = f"'{aec}'"
            exaec_sql = f"'{exaec}'" if exaec else "NULL"
            
            f.write(f"INSERT INTO TARIFA_AD_VALOREM (codigo_aec, codigo_exaec, valor_numerico_aec, fk_subpartida) VALUES ({aec_sql}, {exaec_sql}, {val_num}, {fk});\n")
            
    print(f"Extracted {len(extracted)} tariffs from descriptions.")
    print(f"Combined total: {len(combined)} tariffs.")

if __name__ == '__main__':
    process_tariffs()
