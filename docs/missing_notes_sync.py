import csv
import json
import PyPDF2
from pathlib import Path

csv_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Notas_Legales.csv")
pdf_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Arancel_24-04-25.pdf")

# Load notes from CSV
notes = []
with csv_path.open(encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        notes.append({
            "tipo": row["Tipo"].strip(),
            "seccion": row["Seccion"].strip(),
            "capitulo": row["Capitulo"].strip(),
            "texto": row["Texto"].strip()
        })

# Extract PDF text
with pdf_path.open('rb') as f:
    reader = PyPDF2.PdfReader(f)
    pdf_text = "\n".join(page.extract_text() or "" for page in reader.pages)

missing = []
for note in notes:
    txt = note["texto"].replace('"', '').strip()
    if txt and txt not in pdf_text:
        missing.append(note)

# Output missing notes
print(f"Missing notes count: {len(missing)}")
for m in missing:
    # Use encode errors ignore to avoid Unicode errors
    tipo = m['tipo']
    seccion = m['seccion']
    capitulo = m['capitulo']
    texto = m['texto']
    print(f"Tipo: {tipo}, Seccion: {seccion}, Capitulo: {capitulo}, Texto: {texto}")
