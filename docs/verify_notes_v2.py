import csv
import re
from pathlib import Path
from PyPDF2 import PdfReader

# Paths
pdf_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Arancel_24-04-25.pdf")
csv_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Notas_Legales.csv")

# ---------------------------------------------------
# 1. Load notes from CSV (sections and chapters that have any note)
# ---------------------------------------------------
sections_with_notes_csv = set()
chapters_with_notes_csv = set()
with csv_path.open('r', encoding='utf-8') as f:
    reader = csv.reader(f)
    header = next(reader)
    # Normalize header case
    header = [h.strip() for h in header]
    idx_tipo = header.index('Tipo')
    idx_secc = header.index('Seccion')
    idx_cap = header.index('Capitulo')
    for row in reader:
        if not row:
            continue
        tipo = row[idx_tipo].strip()
        sec = row[idx_secc].strip()
        cap = row[idx_cap].strip()
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
reader = PdfReader(str(pdf_path))
full_text = "\n".join(page.extract_text() or '' for page in reader.pages)

# Regex patterns (case‑insensitive)
section_pattern = re.compile(r"Nota\s+de\s+Sección\s+(\d+)", re.IGNORECASE)
chapter_pattern = re.compile(r"Nota\s+de\s+Capítulo\s+(\d+)", re.IGNORECASE)

sections_in_pdf = set(int(m) for m in section_pattern.findall(full_text))
chapters_in_pdf = set(int(m) for m in chapter_pattern.findall(full_text))

# ---------------------------------------------------
# 3. Compare sets
# ---------------------------------------------------
missing_sections = sections_with_notes_csv - sections_in_pdf
missing_chapters = chapters_with_notes_csv - chapters_in_pdf

print('Secciones con notas según CSV:', sorted(sections_with_notes_csv))
print('Secciones con notas detectadas en PDF:', sorted(sections_in_pdf))
print('Secciones con notas en CSV pero NO encontradas en PDF:', sorted(missing_sections))

print('\nCapítulos con notas según CSV:', sorted(chapters_with_notes_csv))
print('Capítulos con notas detectadas en PDF:', sorted(chapters_in_pdf))
print('Capítulos con notas en CSV pero NO encontradas en PDF:', sorted(missing_chapters))
