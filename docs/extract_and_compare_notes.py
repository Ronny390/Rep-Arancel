import csv
import re
import json
from pathlib import Path

BASE_DIR = Path(r"C:/Users/usuario/Desktop/New diseño/docs")
MD_PATH = BASE_DIR / "Arancel_24-04-25.md"
CSV_PATH = BASE_DIR / "Notas_Legales.csv"
SECCION_MD_PATH = BASE_DIR / "seccion_table.md"
CAPITULO_MD_PATH = BASE_DIR / "capitulo_table.md"
REPORT_PATH = BASE_DIR / "reporte_discrepancias_notas.md"

def load_tables():
    secciones = {}
    capitulos = {}
    
    with open(SECCION_MD_PATH, 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith('|') and not line.startswith('| ID_seccion |') and not line.startswith('|---|'):
                parts = [p.strip() for p in line.split('|')]
                if len(parts) >= 4:
                    secciones[parts[2]] = parts[1]
                    
    with open(CAPITULO_MD_PATH, 'r', encoding='utf-8') as f:
        for line in f:
            if line.startswith('|') and not line.startswith('| ID_capitulo |') and not line.startswith('|---|'):
                parts = [p.strip() for p in line.split('|')]
                if len(parts) >= 4:
                    capitulos[parts[3]] = parts[2]
                    
    return secciones, capitulos

def normalize_text(text):
    text = text.replace('', '') # remove weird chars
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def extract_notes_from_md():
    with open(MD_PATH, 'r', encoding='utf-8', errors='replace') as f:
        lines = f.readlines()

    current_section = None
    current_chapter = None
    current_note_type = None
    
    extracted_notes = []
    current_note_text = []

    # Regex patterns
    re_section = re.compile(r'^SECCI[OÓ]N\s+([A-Z]+)', re.IGNORECASE)
    re_chapter = re.compile(r'^CAP[IÍ]TULO\s+(\d+)', re.IGNORECASE)
    
    re_note_headers = re.compile(r'^(Notas? de Secci[oó]n\.|Notas?\.|Notas? de Cap[ií]tulo\.|Notas? Complementarias?[:\.]?|Notas? de subpartida[:\.]?)$', re.IGNORECASE)
    
    re_ignore = re.compile(r'^(GACETA OFICIAL|C[oó]digo|AEC|Ex\.AEC|Importaci[oó]n|Exportaci[oó]n|F[ií]sica|---|Unidad|\(\d+\))$')

    def save_current_note():
        if current_note_text and current_note_type:
            text = " ".join(current_note_text)
            text = normalize_text(text)
            if text:
                extracted_notes.append({
                    "Seccion": current_section,
                    "Capitulo": current_chapter,
                    "Tipo": current_note_type,
                    "Texto": text
                })
        current_note_text.clear()

    i = 0
    while i < len(lines):
        line = lines[i].strip()
        
        if not line or re_ignore.match(line) or line.isdigit():
            i += 1
            continue

        # Check section
        m_sec = re_section.match(line)
        if m_sec:
            save_current_note()
            current_section = m_sec.group(1)
            current_chapter = None
            current_note_type = None
            i += 1
            continue
            
        # Check chapter
        m_cap = re_chapter.match(line)
        if m_cap:
            save_current_note()
            current_chapter = m_cap.group(1)
            current_note_type = None
            i += 1
            continue

        # Check note header
        m_note = re_note_headers.match(line)
        if m_note:
            save_current_note()
            # Determine normalized note type based on context
            header = line.lower()
            if 'complementaria' in header:
                current_note_type = 'Nota Complementaria'
            elif 'subpartida' in header:
                current_note_type = 'Nota de Subpartida'
            elif current_chapter:
                current_note_type = 'Nota de Capítulo'
            elif current_section:
                current_note_type = 'Nota de Sección'
            else:
                current_note_type = 'Nota'
            i += 1
            continue

        # If we are inside a note block
        if current_note_type:
            # If it starts with a tariff code like 01.01 or 0101.10, we stop note collection until a new note header appears
            if re.match(r'^\d{2}\.\d{2}', line) or re.match(r'^\d{4}\.', line):
                save_current_note()
                current_note_type = None
            else:
                current_note_text.append(line)
                
        i += 1

    save_current_note()
    return extracted_notes

def load_csv_notes():
    csv_notes = []
    with open(CSV_PATH, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            csv_notes.append(row)
    return csv_notes

def run_comparison():
    print("Extrayendo notas del MD...")
    extracted = extract_notes_from_md()
    
    print("Cargando notas del CSV...")
    csv_notes = load_csv_notes()
    
    extracted_json_path = BASE_DIR / "notas_extraidas_del_pdf.json"
    with open(extracted_json_path, 'w', encoding='utf-8') as f:
        json.dump(extracted, f, ensure_ascii=False, indent=2)
    print(f"Notas extraídas guardadas en {extracted_json_path}")
    
    # We will just normalize both and compare chunks.
    # Since CSV splits notes by numbers (1. 2. a) b)), we should check if the CSV text exists in the big extracted text block for that section/chapter.
    
    # Let's group extracted notes by Seccion/Capitulo/Tipo
    extracted_map = {}
    for note in extracted:
        key = (note['Seccion'] or '', note['Capitulo'] or '', note['Tipo'] or '')
        if key not in extracted_map:
            extracted_map[key] = ""
        extracted_map[key] += " " + note['Texto']
        
    for k in extracted_map:
        extracted_map[k] = normalize_text(extracted_map[k])
        
    missing_in_pdf = []
    found_in_pdf = 0

    # For mapping roman numerals to section numbers if needed
    roman_to_int = {'I':'1','II':'2','III':'3','IV':'4','V':'5','VI':'6','VII':'7','VIII':'8','IX':'9','X':'10','XI':'11','XII':'12','XIII':'13','XIV':'14','XV':'15','XVI':'16','XVII':'17','XVIII':'18','XIX':'19','XX':'20','XXI':'21','XXII':'22'}

    for row in csv_notes:
        csv_text = normalize_text(row['Texto'])
        if not csv_text:
            continue
            
        csv_sec = str(row.get('Seccion', '')).strip()
        csv_cap = str(row.get('Capitulo', '')).strip()
        csv_tipo = str(row.get('Tipo', '')).strip()
        
        # We need to map csv_sec (which is an integer 1-22) to Roman numeral if we want to search in our extracted_map
        # Or we can just search in ALL extracted text for that chapter/section
        
        # Let's do a broad search: just check if csv_text is anywhere in the combined extracted text for safety, or specifically in its section/chapter
        found_exact = False
        found_anywhere = False
        found_where = []
        
        # Find corresponding key
        for (e_sec, e_cap, e_tipo), e_text in extracted_map.items():
            # Basic matching logic
            sec_match = True
            if csv_sec:
                # If CSV section is '1', it should match 'I'
                rom = [k for k,v in roman_to_int.items() if v == csv_sec]
                if rom and rom[0] != e_sec:
                    sec_match = False
            
            cap_match = True
            if csv_cap and csv_cap != e_cap:
                cap_match = False
                
            if sec_match and cap_match:
                # Simple substring search
                if csv_text.lower() in e_text.lower():
                    found_exact = True
                    break
        
        if found_exact:
            found_in_pdf += 1
        else:
            for (e_sec, e_cap, e_tipo), e_text in extracted_map.items():
                if csv_text.lower() in e_text.lower():
                    found_anywhere = True
                    found_where.append(f"Sección {e_sec}, Cap {e_cap}, {e_tipo}")
            
            row['found_anywhere'] = found_anywhere
            row['found_where'] = ", ".join(found_where)
            missing_in_pdf.append(row)

    print(f"Total notas CSV: {len(csv_notes)}")
    print(f"Encontradas en PDF: {found_in_pdf}")
    print(f"No encontradas en PDF: {len(missing_in_pdf)}")

    with open(REPORT_PATH, 'w', encoding='utf-8') as f:
        f.write("# Reporte de Discrepancias de Notas Legales\n\n")
        f.write(f"- Total de renglones en CSV: {len(csv_notes)}\n")
        f.write(f"- Encontrados en PDF en su sección correcta: {found_in_pdf}\n")
        f.write(f"- Faltantes o reubicados: {len(missing_in_pdf)}\n\n")
        
        f.write("## Notas del CSV con discrepancias\n")
        for m in missing_in_pdf:
            f.write(f"**Tipo:** {m['Tipo']} | **Sección CSV:** {m.get('Seccion','')} | **Capítulo CSV:** {m.get('Capitulo','')}\n")
            if m['found_anywhere']:
                f.write(f"⚠️ **Encontrada en lugar equivocado:** {m['found_where']}\n")
            else:
                f.write("❌ **NO ENCONTRADA EN ABSOLUTO**\n")
            f.write(f"> {m['Texto']}\n\n")

    print(f"Reporte guardado en {REPORT_PATH}")

if __name__ == "__main__":
    run_comparison()
