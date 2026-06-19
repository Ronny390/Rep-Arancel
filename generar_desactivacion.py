import pandas as pd

df = pd.read_excel('docs/3.1.2-Partidas exentadas.xlsx')
# Fix trailing .0 if pandas parsed it as float
codes = df['SUBPARTIDA'].astype(str).str.replace('\.0$', '', regex=True).str.zfill(10).tolist()

sql_lines = ["-- DML 14: Desactivacion logica de partidas exentas"]
for code in codes:
    sql_lines.append(f"UPDATE SUBPARTIDA SET activa = 0 WHERE REPLACE(codigo_10digitos, '.', '') = '{code}';")
sql_lines.append("COMMIT;")

with open('sql/dml_14_desactivar_partidas.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(sql_lines))

print("SQL generada con exito")
