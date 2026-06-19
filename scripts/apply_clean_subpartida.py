import pathlib, re, json

# Paths
sql_path = pathlib.Path(r"C:/Users/usuario/Desktop/New diseño/sql/dml_08_subpartida_full.sql")
report_path = pathlib.Path(r"C:/Users/usuario/Desktop/New diseño/scripts/clean_report.json")

# Regex to capture the description field (third quoted string in the VALUES list)
# Example line:
# INSERT INTO SUBPARTIDA (..., 'codigo', '- - - Los demás 14BK u', ...);
# We capture everything between the second and third single quotes after VALUES.
desc_pattern = re.compile(r"INSERT INTO SUBPARTIDA.*?VALUES\s*\([^,]+,\s*'[^']+',\s*'(?P<desc>[^']*)'", re.IGNORECASE)

# Regex to strip trailing metadata (units, codes, numbers).
# It removes any trailing sequence that starts with a space, then a number, then optional space and a code like BK, 0A, kg, u, m³, E, 20E, etc., potentially followed by more characters until the end.
meta_pattern = re.compile(r"\s+\d+\s*(?:BK|0A|kg|u|m³|E|20E|[A-Z]{1,3})[^']*$", re.IGNORECASE)
# Additionally remove a solitary trailing number (the AEC code) like " 14" or " 15" at the end of the description.
trailing_aec = re.compile(r"\s+\d+$")

changes = []  # For the report

with sql_path.open("r", encoding="utf-8") as f:
    lines = f.readlines()

new_lines = []
for idx, line in enumerate(lines, start=1):
    m = desc_pattern.search(line)
    if m:
        original_desc = m.group('desc')
        # First remove known metadata patterns
        cleaned_desc = meta_pattern.sub('', original_desc).strip()
        # Then remove a solitary trailing number (AEC code)
        cleaned_desc = trailing_aec.sub('', cleaned_desc).strip()
        if cleaned_desc != original_desc:
            new_line = line.replace(f"'" + original_desc + "'", f"'" + cleaned_desc + "'")
            new_lines.append(new_line)
            changes.append({
                "line": idx,
                "original": original_desc,
                "cleaned": cleaned_desc
            })
        else:
            new_lines.append(line)
    else:
        new_lines.append(line)

# Write cleaned SQL back
with sql_path.open("w", encoding="utf-8") as f:
    f.writelines(new_lines)

# Write a simple JSON report for review
with report_path.open("w", encoding="utf-8") as f:
    json.dump(changes, f, ensure_ascii=False, indent=2)

print(f"Cleaning completed. {len(changes)} description(s) modified. Report saved to {report_path}")
