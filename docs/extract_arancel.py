import sys, json
from pathlib import Path
import PyPDF2
pdf_path = r"C:\\Users\\usuario\\Desktop\\New diseño\\docs\\Arancel_24-04-25.pdf"
with open(pdf_path, 'rb') as f:
    reader = PyPDF2.PdfReader(f)
    full_text = "\n".join(page.extract_text() or '' for page in reader.pages)
print(full_text)
