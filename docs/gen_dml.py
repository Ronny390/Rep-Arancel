import re, os
BASE_DIR = os.path.join(os.environ['USERPROFILE'], 'Desktop', 'New dise\u00f1o')
INPUT_MD = os.path.join(BASE_DIR, 'docs', 'subpartida_table.md')
OUTPUT_DIR = os.path.join(BASE_DIR, 'sql')
os.makedirs(OUTPUT_DIR, exist_ok=True)
REGIMENES = {1:'Libre importacion',2:'Permiso sanitario MPPS',3:'Permiso INSAI',4:'Autorizacion MINEA',5:'Permiso SASA',6:'Permiso MPPA Pesca',7:'Certificado SENCAMER',8:'Permiso MPPS sustancias peligrosas',9:'Autorizacion MPPEE Energia',10:'Permiso MPPAT fauna silvestre',11:'Autorizacion MPPCTI Ciencia',12:'Autorizacion MPPRE Exteriores',13:'Permiso Ministerio Defensa',14:'Autorizacion MPPEE Hidrocarburos',15:'Permiso SASA Vegetal',16:'Certificado calidad SENCAMER',17:'Permiso MPPC cuotas importacion',18:'Certificado sanitario pesqueros',19:'Autorizacion MPPPF Finanzas',20:'Permiso MPPT Turismo',21:'Otros permisos especiales'}
NOMBRES = {'kg':'Kilogramo','u':'Unidad','l':'Litro','m':'Metro','t':'Tonelada metrica','g':'Gramo','m2':'Metro cuadrado','m3':'Metro cubico'}
with open(INPUT_MD, encoding='utf-8', errors='replace') as f:
    lines = f.readlines()
data = [l for l in lines if l.startswith('|') and '---' not in l and not l.startswith('| ID')]
unidades, tarifas, subp_reg, reg_usados = set(), [], {}, set()
for line in data:
    cols = [c.strip() for c in line.split('|')]
    cols = [c for c in cols if c]
    if len(cols) < 5: continue
    id_sub, aec_raw = cols[0], cols[4]
    exaec_raw, regs_raw, unidad_raw = '', [], ''
    for val in cols[5:]:
        if re.match(r'^\d+E$', val): exaec_raw = val
        elif ',' in val and re.match(r'^[\d,]+$', val): regs_raw.append(val)
        elif re.match(r'^\d+$', val) and 1<=int(val)<=21: regs_raw.append(val)
        elif re.match(r'^[a-zA-Z][a-zA-Z0-9]*$', val) and len(val)<=4: unidad_raw = val
    if unidad_raw: unidades.add(unidad_raw)
    try:
        id_i = int(id_sub)
        aec_v = float(aec_raw) if re.match(r'^\d+(\.\d+)?$', aec_raw) else None
        ex_v = float(re.match(r'^(\d+)', exaec_raw).group(1)) if exaec_raw else None
        if aec_v is not None: tarifas.append((id_i, aec_v, ex_v))
    except: pass
    try:
        id_i = int(id_sub); cs = set()
        for c in regs_raw:
            for tok in c.split(','):
                t2 = re.sub(r'[^0-9]','',tok)
                if t2.isdigit() and 1<=int(t2)<=21: cs.add(int(t2)); reg_usados.add(int(t2))
        if cs: subp_reg[id_i] = cs
    except: pass
print('Unidades:', sorted(unidades))
print('Tarifas:', len(tarifas))
print('Regimenes:', sorted(reg_usados))
print('NM pairs:', len(subp_reg))
BATCH = 500
with open(os.path.join(OUTPUT_DIR,'dml_01_unidad_fisica.sql'),'w',encoding='utf-8') as f:
    f.write('-- DML: UNIDAD_FISICA\nINSERT ALL\n')
    for s in sorted(unidades): f.write("  INTO UNIDAD_FISICA (sigla, nombre) VALUES ('{}', '{}')\n".format(s, NOMBRES.get(s,s.upper())))
    f.write('SELECT 1 FROM DUAL;\nCOMMIT;\n')
with open(os.path.join(OUTPUT_DIR,'dml_02_regimen_legal.sql'),'w',encoding='utf-8') as f:
    f.write('-- DML: REGIMEN_LEGAL\nINSERT ALL\n')
    for c in range(1,22): f.write("  INTO REGIMEN_LEGAL (codigo_regimen, descripcion) VALUES ({}, '{}')\n".format(c, REGIMENES.get(c,str(c))))
    f.write('SELECT 1 FROM DUAL;\nCOMMIT;\n')
with open(os.path.join(OUTPUT_DIR,'dml_03_tarifa_ad_valorem.sql'),'w',encoding='utf-8') as f:
    f.write('-- DML: TARIFA_AD_VALOREM\n')
    for i in range(0,len(tarifas),BATCH):
        f.write('INSERT ALL\n')
        for id_s,aec,ex in tarifas[i:i+BATCH]: f.write("  INTO TARIFA_AD_VALOREM (porcentaje_aec,porcentaje_exaec,fk_subpartida) VALUES ({},{},{})\n".format(aec, ex if ex is not None else 'NULL', id_s))
        f.write('SELECT 1 FROM DUAL;\nCOMMIT;\n\n')
items = [(id_s,c) for id_s,cs in subp_reg.items() for c in sorted(cs)]
with open(os.path.join(OUTPUT_DIR,'dml_04_subpartida_regimen.sql'),'w',encoding='utf-8') as f:
    f.write('-- DML: SUBPARTIDA_REGIMEN\n')
    for i in range(0,len(items),BATCH):
        f.write('INSERT ALL\n')
        for id_s,c in items[i:i+BATCH]: f.write('  INTO SUBPARTIDA_REGIMEN (fk_subpartida,fk_regimen) VALUES ({},{})\n'.format(id_s,c))
        f.write('SELECT 1 FROM DUAL;\nCOMMIT;\n\n')
print('DML generados correctamente en:', OUTPUT_DIR)
