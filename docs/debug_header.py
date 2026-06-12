import csv, sys
from pathlib import Path
csv_path = Path(r"C:/Users/usuario/Desktop/New diseño/docs/Notas_Legales.csv")
with csv_path.open('r', encoding='utf-8-sig') as f:
    reader = csv.reader(f)
    header = next(reader)
    print('Header raw entries:')
    for h in header:
        print(repr(h))
