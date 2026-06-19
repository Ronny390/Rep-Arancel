import re
sql_path = 'sql/dml_08_subpartida_final.sql'
with open(sql_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

desc_pattern = re.compile(r"INSERT INTO SUBPARTIDA.*?VALUES\s*\([^,]+,\s*'[^']+',\s*'(?P<desc>[^']*)'", re.IGNORECASE)
meta_pattern = re.compile(r"\s+(?:\d+[\d\.,\sE]*)(?:BK|0A|OBK|0BK|14BK|kg|u|m³|cm³|ℓ|l|g|ml|E|20E|cm3|%)(?:\s.*)?$", re.IGNORECASE)
trailing_aec = re.compile(r"\s+\d+$")

new_lines = []
changes = 0
for line in lines:
    m = desc_pattern.search(line)
    if m:
        orig = m.group('desc')
        cleaned = meta_pattern.sub('', orig).strip()
        cleaned = trailing_aec.sub('', cleaned).strip()
        if cleaned != orig:
            line = line.replace("'" + orig + "'", "'" + cleaned + "'")
            changes += 1
    new_lines.append(line)

with open(sql_path, 'w', encoding='utf-8') as f:
    f.writelines(new_lines)
print(f'Recleaned {changes} lines in final.')
