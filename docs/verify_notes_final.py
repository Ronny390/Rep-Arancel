import csv
import re
from pathlib import Path
from PyPDF2 import PdfReader

# Paths (adjust if necessary)
BASE = Path(r"C:/Users/usuario/Desktop/New diseño/docs")
PDF_PATH = BASE / "Arancel_24-04-25.pdf"
CSV_PATH = BASE / "Notas_Legales.csv"

# ---------------------------------------------------
# 1. Load notes from CSV (sections and chapters that have any note)
# ---------------------------------------------------
sections_with_notes_csv = set()
chapters_with_notes_csv = set()

with CSV_PATH.open('r', encoding='utf-8-sig') as f:
    reader = csv.DictReader(f)
    for row in reader:
        tipo = row.get('Tipo', '').strip()
        sec = row.get('Seccion', '').strip()
        cap = row.get('Capitulo', '').strip()
        if tipo.startswith('Nota de Sección') and sec:
            try:
                sections_with_notes_csv.add(int(sec))
            except ValueError:
                pass
        if tipo.startswith('Nota de Capítulo') and cap:
            try:
                chapters_with_notes_csv.add(int(cap))
            except ValueError:
                pass

# ---------------------------------------------------
# 2. Extract notes from PDF text
# ---------------------------------------------------
reader = PdfReader(str(PDF_PATH))
full_text = "\n".join(page.extract_text() or '' for page in reader.pages)

# Regex patterns for notes (case‑insensitive, allowing optional whitespace)
section_pat = re.compile(r"Nota\s+de\s+Sección\s+(\d+)", re.IGNORECASE)
chapter_pat = re.compile(r"Nota\s+de\s+Capítulo\s+(\d+)", re.IGNORECASE)

sections_in_pdf = {int(m) for m in section_pat.findall(full_text)}
chapters_in_pdf = {int(m) for m in chapter_pat.findall(full_text)}

# ---------------------------------------------------
# 3. Compare sets and report discrepancies
# ---------------------------------------------------
missing_sections = sections_with_notes_csv - sections_in_pdf
missing_chapters = chapters_with_notes_csv - chapters_in_pdf
extra_sections = sections_in_pdf - sections_with_notes_csv
extra_chapters = chapters_in_pdf - chapters_with_notes_csv

print('=== SECCIONES ===')
print('Con notas según CSV:', sorted(sections_with_notes_csv))
print('Detectadas en PDF      :', sorted(sections_in_pdf))
print('En CSV pero NO en PDF :', sorted(missing_sections))
print('En PDF pero NO en CSV :', sorted(extra_sections))

print('\n=== CAPÍTULOS ===')
print('Con notas según CSV:', sorted(chapters_with_notes_csv))
print('Detectadas en PDF      :', sorted(chapters_in_pdf))
print('En CSV pero NO en PDF :', sorted(missing_chapters))
print('En PDF pero NO en CSV :', sorted(extra_chapters))
