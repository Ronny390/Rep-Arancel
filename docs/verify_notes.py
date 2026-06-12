import csv
import re
from pathlib import Path
import sys
from PyPDF2 import PdfReader

# Paths (adjust if needed)
pdf_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Arancel_24-04-25.pdf")
seccion_md = Path(r"C:/Users/usuario/Desktop/New diseño/docs/seccion_table.md")
notas_csv = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Notas_Legales.csv")

# Helper to extract section numbers from seccion_table.md
section_numbers = []
with seccion_md.open('r', encoding='utf-8') as f:
    for line in f:
        # lines like: | 1 | I | ANIMALES VIVOS ...
        parts = [p.strip() for p in line.split('|')]
        if len(parts) >= 3 and parts[0] == '' and parts[1].isdigit():
            section_numbers.append(int(parts[1]))

# Load notes CSV and collect sections that have any "Nota de Sección"
sections_with_notes = set()
with notas_csv.open('r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        tipo = row['Tipo'].strip()
        if tipo.startswith('Nota de Sección'):
            sec = row['Seccion'].strip()
            if sec:
                try:
                    sections_with_notes.add(int(sec))
                except ValueError:
                    pass

# Extract full text from PDF
reader = PdfReader(str(pdf_path))
full_text = "\n".join(page.extract_text() or '' for page in reader.pages)
full_text_lower = full_text.lower()

# Verify sections that have no notes according to CSV
sections_without_notes = [s for s in section_numbers if s not in sections_with_notes]

print("Secciones sin notas según CSV (total {}):".format(len(sections_without_notes)))
for sec in sections_without_notes:
    # simple heuristic: search for "sección <num>" and "nota" near each other
    pattern = re.compile(r"sección\s+{}.*nota".format(sec), re.IGNORECASE)
    found = bool(pattern.search(full_text))
    print(f"- Sección {sec}: {'ENCONTRADA nota en PDF' if found else 'Sin nota en PDF'}")

# Also check capítulos without notas
# Collect capítulo numbers from CSV where Tipo starts with 'Nota de Capítulo'
capitulos_with_notes = set()
with notas_csv.open('r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        tipo = row['Tipo'].strip()
        if tipo.startswith('Nota de Capítulo'):
            cap = row['Capitulo'].strip()
            if cap:
                try:
                    capitulos_with_notes.add(int(cap))
                except ValueError:
                    pass

# Get list of capítulos from capitulo_table.md (similar parsing)
capitulo_md = Path(r"C:/Users/usuario/Desktop/New diseño/docs/capitulo_table.md")
capitulo_numbers = []
with capitulo_md.open('r', encoding='utf-8') as f:
    for line in f:
        parts = [p.strip() for p in line.split('|')]
        if len(parts) >= 3 and parts[0] == '' and parts[1].isdigit():
            capitulo_numbers.append(int(parts[1]))

capitulos_without_notes = [c for c in capitulo_numbers if c not in capitulos_with_notes]
print("\nCapítulos sin notas según CSV (total {}):".format(len(capitulos_without_notes)))
for cap in capitulos_without_notes:
    # heuristic search similar to sections
    pattern = re.compile(r"capítulo\s+{}.*nota".format(cap), re.IGNORECASE)
    found = bool(pattern.search(full_text))
    print(f"- Capítulo {cap}: {'ENCONTRADA nota en PDF' if found else 'Sin nota en PDF'}")
