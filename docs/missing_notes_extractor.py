import csv
import json
import PyPDF2
from pathlib import Path

csv_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Notas_Legales.csv")
pdf_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Arancel_24-04-25.pdf")
output_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/missing_notes.json")

# Read PDF text
pdf_reader = PyPDF2.PdfReader(str(pdf_path))
pdf_text = "".join(page.extract_text() or "" for page in pdf_reader.pages)

missing = []
with open(csv_path, newline='', encoding='utf-8') as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        texto = row.get('Texto', '').strip()
        # If Texto is empty, skip
        if not texto:
            continue
        # Check if exact texto appears in pdf_text (case-sensitive)
        if texto not in pdf_text:
            missing.append({
                "Tipo": row.get('Tipo'),
                "Seccion": row.get('Seccion'),
                "Capitulo": row.get('Capitulo'),
                "Texto": texto
            })

with open(output_path, 'w', encoding='utf-8') as outjson:
    json.dump(missing, outjson, ensure_ascii=False, indent=2)

print(f"Missing notes count: {len(missing)}")
