import csv
import re
import sys
from collections import defaultdict

sys.stdout.reconfigure(encoding='utf-8')

input_csv  = r'c:\Users\usuario\Documents\archivos cmd\arancel_completo_corregido.csv'
output_sql = r'c:\Users\usuario\Documents\archivos cmd\arancel_venezuela_PRO.sql'

print("Construyendo Arancel con Herencia Total (todos los niveles como filas)...")

MAPA_SECCIONES = {
    1:  ("I",    "ANIMALES VIVOS Y PRODUCTOS DEL REINO ANIMAL"),
    6:  ("II",   "PRODUCTOS DEL REINO VEGETAL"),
    15: ("III",  "GRASAS Y ACEITES ANIMALES, VEGETALES O DE ORIGEN MICROBIANO Y PRODUCTOS DE SU DESDOBLAMIENTO; GRASAS ALIMENTICIAS ELABORADAS; CERAS DE ORIGEN ANIMAL O VEGETAL"),
    16: ("IV",   "PRODUCTOS DE LAS INDUSTRIAS ALIMENTARIAS; BEBIDAS, LÍQUIDOS ALCOHÓLICOS Y VINAGRE; TABACO Y SUCEDÁNEOS DEL TABACO ELABORADOS; PRODUCTOS, INCLUSO CON NICOTINA, DESTINADOS PARA LA INHALACIÓN SIN COMBUSTIÓN; OTROS PRODUCTOS QUE CONTENGAN NICOTINA DESTINADOS A LA ABSORCIÓN DE NICOTINA EN EL CUERPO HUMANO"),
    25: ("V",    "PRODUCTOS MINERALES"),
    28: ("VI",   "PRODUCTOS DE LAS INDUSTRIAS QUÍMICAS O DE LAS INDUSTRIAS CONEXAS"),
    39: ("VII",  "PLÁSTICO Y SUS MANUFACTURAS; CAUCHO Y SUS MANUFACTURAS"),
    41: ("VIII", "PIELES, CUEROS, PELETERÍA Y MANUFACTURAS DE ESTAS MATERIAS; ARTÍCULOS DE TALABARTERÍA O GUARNICIONERÍA; ARTÍCULOS DE VIAJE, BOLSOS DE MANO (CARTERAS) Y CONTINENTES SIMILARES; MANUFACTURAS DE TRIPA"),
    44: ("IX",   "MADERA, CARBÓN VEGETAL Y MANUFACTURAS DE MADERA; CORCHO Y SUS MANUFACTURAS; MANUFACTURAS DE ESPARTERÍA O CESTERÍA"),
    47: ("X",    "PASTA DE MADERA O DE LAS DEMÁS MATERIAS FIBROSAS CELULÓSICAS; PAPEL O CARTÓN PARA RECICLAR (DESPERDICIOS Y DESECHOS); PAPEL Y CARTÓN Y SUS MANUFACTURAS"),
    50: ("XI",   "MATERIAS TEXTILES Y SUS MANUFACTURAS"),
    64: ("XII",  "CALZADO, SOMBREROS Y DEMÁS TOCADOS, PARAGUAS, QUITASOLES, BASTONES, LÁTIGOS, FUSTAS, Y SUS PARTES; PLUMAS PREPARADAS Y ARTÍCULOS DE PLUMAS O DE PLUMÓN; FLORES ARTIFICIALES; MANUFACTURAS DE CABELLO"),
    68: ("XIII", "MANUFACTURAS DE PIEDRA, YESO FRAGUABLE, CEMENTO, AMIANTO (ASBESTO), MICA O MATERIAS ANÁLOGAS; PRODUCTOS CERÁMICOS; VIDRIO Y SUS MANUFACTURAS"),
    71: ("XIV",  "PERLAS NATURALES (FINAS)* O CULTIVADAS, PIEDRAS PRECIOSAS O SEMIPRECIOSAS, METALES PRECIOSOS, CHAPADOS DE METAL PRECIOSO (PLAQUÉ) Y MANUFACTURAS DE ESTAS MATERIAS; BISUTERÍA; MONEDAS"),
    72: ("XV",   "METALES COMUNES Y MANUFACTURAS DE ESTOS METALES"),
    84: ("XVI",  "MÁQUINAS Y APARATOS, MATERIAL ELÉCTRICO Y SUS PARTES; APARATOS DE GRABACIÓN O REPRODUCCIÓN DE SONIDO, APARATOS DE GRABACIÓN O REPRODUCCIÓN DE IMAGEN Y SONIDO EN TELEVISIÓN, Y LAS PARTES Y ACCESORIOS DE ESTOS APARATOS"),
    86: ("XVII", "MATERIAL DE TRANSPORTE"),
    90: ("XVIII","INSTRUMENTOS Y APARATOS DE ÓPTICA, FOTOGRAFÍA O CINEMATOGRAFÍA, DE MEDIDA, CONTROL O PRECISIÓN; INSTRUMENTOS Y APARATOS MEDICOQUIRÚRGICOS; APARATOS DE RELOJERÍA; INSTRUMENTOS DE MÚSICA; PARTES Y ACCESORIOS DE ESTOS INSTRUMENTOS O APARATOS"),
    93: ("XIX",  "ARMAS, MUNICIONES, Y SUS PARTES Y ACCESORIOS"),
    94: ("XX",   "MERCANCÍAS Y PRODUCTOS DIVERSOS"),
    97: ("XXI",  "OBJETOS DE ARTE O COLECCIÓN Y ANTIGÜEDADES"),
    98: ("XXII", "MERCANCÍAS SOMETIDAS A TRATAMIENTOS ARANCELARIOS ESPECIALES"),
}

# ── Estructuras de datos ──────────────────────────────────────────────────────
secciones_list  = []
secciones_vistas= set()
capitulos       = []
caps_vistos     = set()
partidas        = []
subpartidas     = []
notas_legales   = []
regimenes_set   = set()
subpartida_regimen = []

current_sec_id  = 1
current_cap_id  = 0
current_par_id  = 0
current_target  = 'S'       # 'S' = sección, 'C' = capítulo
ctx             = defaultdict(str)   # contexto de niveles (guiones), SIN límite fijo

last_item = None
last_item_key = None
last_ctx_key = None

# Sección I por defecto
sec_i = {'nombre': 'SECCIÓN I', 'descripcion': MAPA_SECCIONES[1][1]}
secciones_list.append(sec_i)
secciones_vistas.add('I')
last_item = sec_i
last_item_key = 'descripcion'
last_ctx_key = None

re_cap   = re.compile(r"^CAP.TULO\s+(\d+)$", re.IGNORECASE)
re_nota  = re.compile(r"^(\d+)\.\s")

def reset_ctx():
    ctx.clear()
    global last_ctx_key
    last_ctx_key = None

# ── Lectura del CSV ───────────────────────────────────────────────────────────
with open(input_csv, 'r', encoding='utf-8', errors='ignore') as f:
    reader = csv.DictReader(f, delimiter=';')
    for row in reader:
        codigo = row.get('codigo', '').strip()
        desc   = row.get('descripcion', '').strip()
        if not desc:
            continue
            
        # Intentar arreglar algunos textos pegados comunes (heurística básica)
        reemplazos = [
            ("CARNEDE", "CARNE DE "),
            ("LECHEY", "LECHE Y "),
            ("DELAESPECIE", "DE LA ESPECIE "),
            ("LOSDEMAS", "LOS DEMAS "),
            ("LASDEMAS", "LAS DEMAS "),
            ("ENCERÁMICA", "EN CERÁMICA"),
            ("FRITADEVIDRIOY", "FRITA DE VIDRIO Y "),
            ("DEMÁSVIDRIOS", "DEMÁS VIDRIOS"),
            ("ENPOLVO", "EN POLVO"),
            ("CONSTITUIDOSPORPRODUCTOSMEZCLADOS", "CONSTITUIDOS POR PRODUCTOS MEZCLADOS"),
            ("EXCEPTOLOSPRODUCTOSDELASPARTIDAS", "EXCEPTO LOS PRODUCTOS DE LAS PARTIDAS"),
            ("PREPARADOSPARAUSOSTERAPÉUTICOSOPROFILÁCTICOS", "PREPARADOS PARA USOS TERAPÉUTICOS O PROFILÁCTICOS"),
            ("MATERIALDETRANSPORTE", "MATERIAL DE TRANSPORTE"),
            ("DELTIPODELOSCOMPRENDIDOSENLA", "DEL TIPO DE LOS COMPRENDIDOS EN LA"),
            ("VENTAALPORMENOR", "VENTA AL POR MENOR"),
            ("OCOMOPREPARACIONESOARTÍCULOSTALES", "O COMO PREPARACIONES O ARTÍCULOS TALES"),
            ("PRODUCTOSLAMINADOSPLANOSDEHIERROOACEROSINALEAR", "PRODUCTOS LAMINADOS PLANOS DE HIERRO O ACERO SIN ALEAR"),
            ("PANTALONESLARGOS", "PANTALONES LARGOS"),
            ("CILINDROSYDEMÁSELEMENTOSIMPRESORESDELAPARTIDA", "CILINDROS Y DEMÁS ELEMENTOS IMPRESORES DE LA PARTIDA"),
            ("UTILIZADOSPARAESCRIBIR", "UTILIZADOS PARA ESCRIBIR"),
            ("IMPRIMIRUOTROSFINESGRÁFICOSY", "IMPRIMIR U OTROS FINES GRÁFICOS Y "),
            ("PAPELDELASPARTIDAS", "PAPEL DE LAS PARTIDAS"),
            ("PAPELYCARTÓNHECHOSA", "PAPEL Y CARTÓN HECHOS A"),
            ("SUEROSCONANTICUERPOS", "SUEROS CON ANTICUERPOS"),
            ("DEMÁSFRACCIONESDELASANGREY", "DEMÁS FRACCIONES DE LA SANGRE Y "),
            ("OBTENIDOSPORPROCESOSBIOTECNOLÓGICOS", "OBTENIDOS POR PROCESOS BIOTECNOLÓGICOS"),
            ("AUNQUENOSEANDECONSTITUCIÓNQUÍMICADEFINIDA", "AUNQUE NO SEAN DE CONSTITUCIÓN QUÍMICA DEFINIDA"),
            ("SUPLEMENTARIASYSUSANHÍDRIDOS", "SUPLEMENTARIAS Y SUS ANHÍDRIDOS"),
            ("OENHOJASDEFORMACUADRADA", "O EN HOJAS DE FORMA CUADRADA"),
            ("INSTRUMENTOSYAPARATOSDEMEDICINA", "INSTRUMENTOS Y APARATOS DE MEDICINA"),
            ("LOSDEMÁSAPARATOSDEEMISIÓN", "LOS DEMÁS APARATOS DE EMISIÓN"),
            ("DISTINTOSDELOSAPARATOS", "DISTINTOS DE LOS APARATOS"),
            ("TRANSMISIÓNORECEPCIÓN", "TRANSMISIÓN O RECEPCIÓN"),
            ("EXCEPTOLOSDELAPARTIDA", "EXCEPTO LOS DE LA PARTIDA"),
            ("ANCHURASUPERIOROIGUALA", "ANCHURA SUPERIOR O IGUAL A "),
            ("CONCENTRADASOCONADICIÓNDEAZÚCAR", "CONCENTRADAS O CON ADICIÓN DE AZÚCAR"),
            ("MECANISMOSDECAMBIODELANZADERA", "MECANISMOS DE CAMBIO DE LANZADERA"),
            ("TEJIDOSDEFIBRASSINTÉTICASDISCONTINUASCONUNCONTENIDO", "TEJIDOS DE FIBRAS SINTÉTICAS DISCONTINUAS CON UN CONTENIDO"),
            ("COMPRENDIDASENOTRAPARTE", "COMPRENDIDAS EN OTRA PARTE"),
            ("CONUNCONTENIDODEACEITESDE", "CON UN CONTENIDO DE ACEITES DE "),
            ("PETRÓLEOODEMINERAL", "PETRÓLEO O DE MINERAL"),
            ("DESECADOS,INCLUSOPULVERIZADOS", "DESECADOS, INCLUSO PULVERIZADOS"),
            ("EXTRACTOSDEGLÁNDULASO", "EXTRACTOS DE GLÁNDULAS O "),
            ("HEPARINAYSUSSALES", "HEPARINA Y SUS SALES"),
            ("RECIPIENTES PARA EL TRANSPORTEOENVASADO, DEVIDRIO", "RECIPIENTES PARA EL TRANSPORTE O ENVASADO, DE VIDRIO"),
            ("LOSDEMÁSTUBOSYPERFILESHUECOS", "LOS DEMÁS TUBOS Y PERFILES HUECOS"),
            ("TUBOSYACCESORIOSDETUBERIA", "TUBOS Y ACCESORIOS DE TUBERIA"),
            ("(POREJEMPLO:JUNTAS", "(POR EJEMPLO: JUNTAS"),
            ("MANTECA(MANTEQUILLA)*YDEMÁSMATERIASGRASASDELALECHE;", "MANTECA (MANTEQUILLA)* Y DEMÁS MATERIAS GRASAS DE LA LECHE; "),
            ("MANTECA(MANTEQUILLA)*", "MANTECA (MANTEQUILLA)*")
        ]
        
        for malo, bueno in reemplazos:
            desc = desc.replace(malo, bueno)
        
        # Espacio después de coma o punto y coma si sigue una letra
        desc = re.sub(r'([,;])([A-Za-zÁÉÍÓÚáéíóúÑñ])', r'\1 \2', desc)

        # ── 1. CAPÍTULO ───────────────────────────────────────────────────────
        m = re_cap.match(desc)
        if m and not codigo:
            num = int(m.group(1))
            if num not in caps_vistos:
                if num in MAPA_SECCIONES:
                    romano, nombre_sec = MAPA_SECCIONES[num]
                    if romano not in secciones_vistas:
                        new_sec = {'nombre': f'SECCIÓN {romano}', 'descripcion': nombre_sec}
                        secciones_list.append(new_sec)
                        secciones_vistas.add(romano)
                        last_item = new_sec
                        last_item_key = 'descripcion'
                        last_ctx_key = None
                    current_sec_id = len(secciones_list)
                    current_target = 'S'
                new_cap = {'numero': str(num), 'descripcion': '', 'id_sec': current_sec_id}
                capitulos.append(new_cap)
                current_cap_id = len(capitulos)
                caps_vistos.add(num)
                current_target = 'C'
                last_item = new_cap
                last_item_key = 'descripcion'
                last_ctx_key = None
                reset_ctx()
            continue

        # ── 2. LÍNEAS SIN CÓDIGO ──────────────────────────────────────────────
        if not codigo:
            # Detectar encabezados intermedios: "0106.1 - Mamíferos:" en descripción
            # Patrón: código numérico con punto + guion + descripción
            m_nivel = re.match(r'^(\d{4}\.\d[\d\.]*)\s*-+\s*(.+)', desc)
            if m_nivel and current_par_id > 0:
                cod_intermedio = re.sub(r'[^0-9]', '', m_nivel.group(1))
                desc_intermedia = m_nivel.group(2).rstrip(':').strip()
                guiones_inter = len(desc) - len(desc.lstrip('-')) if desc.startswith('-') else 1

                # Construir herencia para este nivel intermedio
                herencia_i = partidas[current_par_id - 1]['descripcion'] + ' > '
                for k in sorted(k for k in ctx if ctx[k]):
                    if ctx[k] != desc_intermedia:
                        herencia_i += ctx[k] + ' > '

                descripcion_inter = herencia_i + '- ' + desc_intermedia

                # Guardar en contexto y como fila
                ctx[guiones_inter] = desc_intermedia
                for k in list(ctx.keys()):
                    if k > guiones_inter:
                        ctx[k] = ''

                s_inter = {
                    'codigo': cod_intermedio,
                    'descripcion': descripcion_inter,
                    'aec': '', 'ex': '', 'unidad': '',
                    'id_par': current_par_id,
                }
                subpartidas.append(s_inter)
                last_item = s_inter
                last_item_key = 'descripcion'
                last_ctx_key = guiones_inter
                continue

            if re_nota.match(desc) or desc.startswith('Nota') or desc.startswith('a)') or desc.startswith('-'):
                pid = current_cap_id if current_target == 'C' else current_sec_id
                if pid > 0:
                    n = {'tipo': current_target, 'parent_id': pid, 'texto': desc}
                    notas_legales.append(n)
                    last_item = n
                    last_item_key = 'texto'
                    last_ctx_key = None
            elif current_target == 'C' and current_cap_id > 0 \
                    and not capitulos[current_cap_id - 1]['descripcion'] and len(desc) > 3:
                capitulos[current_cap_id - 1]['descripcion'] = desc
                last_item = capitulos[current_cap_id - 1]
                last_item_key = 'descripcion'
                last_ctx_key = None
            elif last_item is not None:
                last_item[last_item_key] += ' ' + desc
                if last_ctx_key is not None:
                    ctx[last_ctx_key] += ' ' + desc
            continue

        # ── 3. PARTIDA (formato XX.XX) ────────────────────────────────────────
        # Añadido: verificar que el código empiece con el número del capítulo actual para descartar falsos positivos
        if re.match(r'^\d{2}\.\d{2}$', codigo):
            cod_par = re.sub(r'[^0-9]', '', codigo)
            
            # Filtro para descartar referencias a otras partidas dentro de notas legales
            cap_actual_num = capitulos[current_cap_id - 1]['numero'] if current_cap_id > 0 else '01'
            
            es_falso_positivo = False
            
            # 1. El código no corresponde al capítulo actual
            if cap_actual_num.zfill(2) != cod_par[:2]:
                es_falso_positivo = True
            
            # 2. La descripción no empieza con mayúscula o comillas (las partidas verdaderas casi siempre son en mayúscula)
            if desc and not desc[0].isupper() and desc[0] not in ['"', '“', '«', "'", '‘']:
                es_falso_positivo = True
                
            if es_falso_positivo:
                # Es un falso positivo, tratar como nota legal
                pid = current_cap_id if current_target == 'C' else current_sec_id
                if pid > 0:
                    n = {'tipo': current_target, 'parent_id': pid, 'texto': desc}
                    notas_legales.append(n)
                    last_item = n
                    last_item_key = 'texto'
                    last_ctx_key = None
                continue
                
            if current_cap_id == 0:
                new_cap = {'numero': '1', 'descripcion': 'ANIMALES VIVOS', 'id_sec': 1}
                capitulos.append(new_cap)
                current_cap_id = 1
                caps_vistos.add(1)
                last_item = new_cap
                last_item_key = 'descripcion'
                last_ctx_key = None
            
            new_par = {'codigo': cod_par, 'descripcion': desc, 'id_cap': current_cap_id}
            partidas.append(new_par)
            current_par_id = len(partidas)
            last_item = new_par
            last_item_key = 'descripcion'
            last_ctx_key = None
            reset_ctx()
            continue

        # ── 4. SUBPARTIDAS / NIVELES INTERMEDIOS ─────────────────────────────
        if re.match(r'^\d', codigo):
            cod_clean   = re.sub(r'[^0-9]', '', codigo)
            # Contar guiones al inicio de la descripción
            guiones     = len(desc) - len(desc.lstrip('-'))
            texto_limpio= desc.lstrip('- ').strip()

            # Construir herencia:
            # Primero el nombre de la Partida
            herencia = ''
            if current_par_id > 0:
                herencia = partidas[current_par_id - 1]['descripcion'] + ' > '

            # Luego los niveles intermedios YA guardados, menores al nivel actual
            niveles_activos = sorted(k for k in ctx if ctx[k])
            for k in niveles_activos:
                if guiones == 0 or k < guiones:   # final: todos; intermedio: solo anteriores
                    if ctx[k] != texto_limpio:
                        herencia += ctx[k] + ' > '

            descripcion_final = herencia + desc

            # Actualizar contexto si es nivel intermedio
            if guiones > 0:
                ctx[guiones] = texto_limpio
                # Limpiar niveles más profundos
                for k in list(ctx.keys()):
                    if k > guiones:
                        ctx[k] = ''

            # Insertar SIEMPRE (intermedio o final)
            if current_par_id > 0:
                s_final = {
                    'codigo': cod_clean,
                    'descripcion': descripcion_final,
                    'aec':    row.get('aec', ''),
                    'ex':     row.get('ex_aec', ''),
                    'unidad': row.get('unidad', ''),
                    'id_par': current_par_id,
                }
                subpartidas.append(s_final)
                last_item = s_final
                last_item_key = 'descripcion'
                last_ctx_key = guiones if guiones > 0 else None

                current_subp_id = len(subpartidas)
                
                # Procesar Regímenes Legales (filtramos códigos sucios que no comiencen por dígito)
                imp = row.get('regimen_importacion', '')
                exp = row.get('regimen_exportacion', '')
                
                for r in re.split(r'[,;]', imp):
                    r_clean = r.strip()
                    if r_clean and re.match(r'^\d+[A-Za-z]*$', r_clean):
                        regimenes_set.add(r_clean)
                        subpartida_regimen.append({'id_subpartida': current_subp_id, 'codigo_regimen': r_clean, 'tipo': 'IMP'})
                        
                for r in re.split(r'[,;]', exp):
                    r_clean = r.strip()
                    if r_clean and re.match(r'^\d+[A-Za-z]*$', r_clean):
                        regimenes_set.add(r_clean)
                        subpartida_regimen.append({'id_subpartida': current_subp_id, 'codigo_regimen': r_clean, 'tipo': 'EXP'})

# Crear catálogo oficial de regímenes según el Artículo 21 del Arancel
MAPA_REGIMENES = {
    "1": "Importación o Exportación Prohibida.",
    "2": "Importación o Exportación Reservada al Ejecutivo Nacional.",
    "3": "Permiso del Ministerio del Poder Popular con competencia en materia de salud.",
    "4": "Permiso del Ministerio del Poder Popular con competencia en materia de industrias y producción nacional.",
    "5": "Certificado Sanitario del País de Origen.",
    "6": "Permiso Sanitario del Ministerio del Poder Popular con competencia en materia de agricultura productiva y tierras.",
    "7": "Permiso del Ministerio del Poder Popular con competencia en materia de defensa.",
    "8": "Licencia de Importación administrada por el Ministerio del Poder Popular con competencia en materia de alimentación.",
    "9": "Licencia de Importación administrada por el Ministerio del Poder Popular con competencia en materia de comercio exterior.",
    "10": "Permiso del Ministerio del Poder Popular con competencia en materia de ecosocialismo.",
    "11": "Permiso del Ministerio del Poder Popular con competencia en materia de petróleo.",
    "12": "Registro Sanitario expedido por el Ministerio del Poder Popular con competencia en materia de salud.",
    "13": "Registro Sanitario expedido por el Ministerio del Poder Popular con competencia en materia de agricultura productiva y tierras.",
    "14": "Permiso del Ministerio del Poder Popular con competencia en materia de alimentación.",
    "15": "Permiso del Ministerio del Poder Popular con competencia en materia de ciencia, tecnología e innovación.",
    "16": "Licencia de Importación administrada por el Ministerio del Poder Popular con competencia en materia de industrias y producción nacional.",
    "17": "Permiso del Ministerio del Poder Popular con competencia en materia de energía eléctrica.",
    "18": "Permiso del Ministerio del Poder Popular con competencia en materia de pesca y acuicultura.",
    "19": "Certificado del Proceso Kimberley.",
    "20": "Constancia de Registro de Norma Venezolana COVENIN o Registro de Reglamento Técnico administrado por SENCAMER con competencia en comercio nacional.",
    "21": "Permiso del Registro Nacional Único de Operadores de Sustancias Químicas Controladas."
}

regimenes_catalogo = []
for i, r in enumerate(sorted(regimenes_set)):
    desc = MAPA_REGIMENES.get(r)
    if not desc:
        num_part = re.sub(r'[^0-9]', '', r)
        if num_part in MAPA_REGIMENES:
            desc = MAPA_REGIMENES[num_part] + f" (Nota/Tratamiento {r})"
        else:
            desc = f"Tratamiento Arancelario / Nota {r}"
    regimenes_catalogo.append({'id_regimen': i+1, 'codigo': r, 'descripcion': desc})

regimen_map = {r['codigo']: r['id_regimen'] for r in regimenes_catalogo}

# ── Función auxiliar ──────────────────────────────────────────────────────────
def clean(t):
    return str(t).replace("'", "''")

# ── Escritura del SQL ─────────────────────────────────────────────────────────
with open(output_sql, 'w', encoding='utf-8') as f:
    f.write("-- ARANCEL VENEZUELA PRO MASTER (ALL LEVELS AS ROWS)\n")
    f.write("ROLLBACK; SET client_encoding = 'UTF8'; BEGIN;\n\n")

    f.write("DROP TABLE IF EXISTS notas_legales CASCADE;\n")
    f.write("DROP TABLE IF EXISTS subpartida_regimen CASCADE;\n")
    f.write("DROP TABLE IF EXISTS regimen_legal_catalogo CASCADE;\n")
    f.write("DROP TABLE IF EXISTS subpartidas   CASCADE;\n")
    f.write("DROP TABLE IF EXISTS partidas      CASCADE;\n")
    f.write("DROP TABLE IF EXISTS capitulos     CASCADE;\n")
    f.write("DROP TABLE IF EXISTS secciones     CASCADE;\n\n")

    f.write("CREATE TABLE secciones   (id_seccion  SERIAL PRIMARY KEY, nombre TEXT, descripcion TEXT);\n")
    f.write("CREATE TABLE capitulos   (id_capitulo SERIAL PRIMARY KEY, id_seccion INT REFERENCES secciones(id_seccion),  numero VARCHAR(10), descripcion TEXT);\n")
    f.write("CREATE TABLE partidas    (id_partida  SERIAL PRIMARY KEY, id_capitulo INT REFERENCES capitulos(id_capitulo), codigo VARCHAR(20), descripcion TEXT);\n")
    f.write("CREATE TABLE subpartidas (id_subpartida SERIAL PRIMARY KEY, id_partida INT REFERENCES partidas(id_partida),  codigo VARCHAR(20), descripcion TEXT, aec VARCHAR(50), ex_aec VARCHAR(50), unidad VARCHAR(50));\n")
    f.write("CREATE TABLE notas_legales (id_nota SERIAL PRIMARY KEY, id_seccion INT REFERENCES secciones(id_seccion), id_capitulo INT REFERENCES capitulos(id_capitulo), texto TEXT);\n")
    f.write("CREATE TABLE regimen_legal_catalogo (id_regimen SERIAL PRIMARY KEY, codigo VARCHAR(50), descripcion TEXT);\n")
    f.write("CREATE TABLE subpartida_regimen (id_subpartida INT REFERENCES subpartidas(id_subpartida), id_regimen INT REFERENCES regimen_legal_catalogo(id_regimen), tipo VARCHAR(3));\n\n")

    for s in secciones_list:
        f.write(f"INSERT INTO secciones (nombre, descripcion) VALUES ('{clean(s['nombre'])}', '{clean(s['descripcion'])}');\n")

    for c in capitulos:
        f.write(f"INSERT INTO capitulos (id_seccion, numero, descripcion) VALUES ({c['id_sec']}, '{clean(c['numero'])}', '{clean(c['descripcion'])}');\n")

    for p in partidas:
        f.write(f"INSERT INTO partidas (id_capitulo, codigo, descripcion) VALUES ({p['id_cap']}, '{clean(p['codigo'])}', '{clean(p['descripcion'])}');\n")

    for s in subpartidas:
        aec = f"'{clean(s['aec'])}'" if s['aec'] else 'NULL'
        ex  = f"'{clean(s['ex'])}'"  if s['ex']  else 'NULL'
        u   = f"'{clean(s['unidad'])}'" if s['unidad'] else 'NULL'
        f.write(f"INSERT INTO subpartidas (id_partida, codigo, descripcion, aec, ex_aec, unidad) "
                f"VALUES ({s['id_par']}, '{clean(s['codigo'])}', '{clean(s['descripcion'])}', {aec}, {ex}, {u});\n")

    for n in notas_legales:
        ids = n['parent_id'] if n['tipo'] == 'S' else 'NULL'
        idc = n['parent_id'] if n['tipo'] == 'C' else 'NULL'
        f.write(f"INSERT INTO notas_legales (id_seccion, id_capitulo, texto) VALUES ({ids}, {idc}, '{clean(n['texto'])}');\n")

    for r in regimenes_catalogo:
        f.write(f"INSERT INTO regimen_legal_catalogo (codigo, descripcion) VALUES ('{clean(r['codigo'])}', '{clean(r['descripcion'])}');\n")

    for sr in subpartida_regimen:
        id_r = regimen_map[sr['codigo_regimen']]
        f.write(f"INSERT INTO subpartida_regimen (id_subpartida, id_regimen, tipo) VALUES ({sr['id_subpartida']}, {id_r}, '{sr['tipo']}');\n")

    f.write("\nCOMMIT;\n")

print(f"¡HECHO! Generado: {output_sql}")
print(f"  Secciones : {len(secciones_list)}")
print(f"  Capítulos : {len(capitulos)}")
print(f"  Partidas  : {len(partidas)}")
print(f"  Subpartidas (todos los niveles): {len(subpartidas)}")
print(f"  Notas     : {len(notas_legales)}")
print(f"  Regímenes únicos: {len(regimenes_catalogo)}")
print(f"  Relaciones Subpartida-Régimen: {len(subpartida_regimen)}")

