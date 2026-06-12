import csv
import json
from pathlib import Path

BASE_DIR = Path(r"C:/Users/usuario/Desktop/New diseño/docs")
CSV_PATH = BASE_DIR / "Notas_Legales.csv"
JSON_PATH = BASE_DIR / "notas_extraidas_del_pdf.json"
REPORT_ERRORS_PATH = BASE_DIR / "notas_erroneas_a_borrar.md"
CORRECTED_CSV_PATH = BASE_DIR / "Notas_Legales_Corregido.csv"

# Diccionario para convertir números romanos a arábigos para el CSV
ROMAN_TO_INT = {
    'I': '1', 'II': '2', 'III': '3', 'IV': '4', 'V': '5', 'VI': '6', 'VII': '7', 'VIII': '8', 
    'IX': '9', 'X': '10', 'XI': '11', 'XII': '12', 'XIII': '13', 'XIV': '14', 'XV': '15', 
    'XVI': '16', 'XVII': '17', 'XVIII': '18', 'XIX': '19', 'XX': '20', 'XXI': '21', 'XXII': '22'
}

def normalize_text(text):
    import re
    text = text.replace('', '')
    text = re.sub(r'\s+', ' ', text)
    return text.strip()

def fix_csv():
    # 1. Load the original CSV
    csv_notes = []
    with open(CSV_PATH, 'r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        for row in reader:
            csv_notes.append(row)
            
    # 2. Load the clean JSON
    with open(JSON_PATH, 'r', encoding='utf-8') as f:
        extracted = json.load(f)

    # We will build a text pool of the extracted notes for matching to find the "bad" ones
    extracted_map = {}
    for note in extracted:
        key = (note.get('Seccion') or '', note.get('Capitulo') or '', note.get('Tipo') or '')
        if key not in extracted_map:
            extracted_map[key] = ""
        extracted_map[key] += " " + note['Texto']
        
    for k in extracted_map:
        extracted_map[k] = normalize_text(extracted_map[k])

    bad_notes = []

    for row in csv_notes:
        csv_text = normalize_text(row['Texto'])
        if not csv_text:
            continue
            
        csv_sec = str(row.get('Seccion', '')).strip()
        csv_cap = str(row.get('Capitulo', '')).strip()
        
        found_exact = False
        found_anywhere = False
        found_where = []
        
        for (e_sec, e_cap, e_tipo), e_text in extracted_map.items():
            sec_match = True
            if csv_sec:
                rom = [k for k,v in ROMAN_TO_INT.items() if v == csv_sec]
                if rom and rom[0] != e_sec:
                    sec_match = False
            
            cap_match = True
            if csv_cap and csv_cap != e_cap:
                cap_match = False
                
            if sec_match and cap_match:
                if csv_text.lower() in e_text.lower():
                    found_exact = True
                    break
                    
        if not found_exact:
            # Check where it really is
            for (e_sec, e_cap, e_tipo), e_text in extracted_map.items():
                if csv_text.lower() in e_text.lower():
                    found_anywhere = True
                    found_where.append(f"Sección {e_sec}, Cap {e_cap}, {e_tipo}")
            
            row['found_anywhere'] = found_anywhere
            row['found_where'] = ", ".join(found_where)
            bad_notes.append(row)

    # 3. Write the "Bad Notes" to a markdown file for the user to review
    with open(REPORT_ERRORS_PATH, 'w', encoding='utf-8') as f:
        f.write(f"# Notas Erróneas en CSV Original ({len(bad_notes)} registros)\n\n")
        f.write("A continuación se listan las notas del CSV original que tienen asignado un Capítulo/Sección incorrecto, o que no existen en el PDF.\n\n")
        for b in bad_notes:
            f.write(f"**Tipo:** {b['Tipo']} | **Sección CSV:** {b.get('Seccion','')} | **Capítulo CSV:** {b.get('Capitulo','')}\n")
            if b['found_anywhere']:
                f.write(f"⚠️ **Debería estar en:** {b['found_where']}\n")
            else:
                f.write("❌ **No se encuentra en el documento**\n")
            f.write(f"> {b['Texto']}\n\n")

    # 4. Generate the CORRECTED CSV from the JSON
    # The new CSV should have 'Tipo', 'Seccion', 'Capitulo', 'Texto'
    # We will split the text from JSON into sentences/bullet points if possible, or just dump the whole text
    # The JSON has text chunks that might have multiple lines. Let's just output each note object as a row.
    
    with open(CORRECTED_CSV_PATH, 'w', encoding='utf-8-sig', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=['Tipo', 'Seccion', 'Capitulo', 'Texto'])
        writer.writeheader()
        
        for note in extracted:
            sec_roman = note.get('Seccion') or ''
            sec_arabic = ROMAN_TO_INT.get(sec_roman, sec_roman)
            
            writer.writerow({
                'Tipo': note.get('Tipo', ''),
                'Seccion': sec_arabic,
                'Capitulo': note.get('Capitulo', ''),
                'Texto': note.get('Texto', '')
            })

    print(f"Total de notas erróneas identificadas: {len(bad_notes)}")
    print(f"Lista de errores guardada en: {REPORT_ERRORS_PATH}")
    print(f"CSV corregido generado en: {CORRECTED_CSV_PATH}")

if __name__ == "__main__":
    fix_csv()
