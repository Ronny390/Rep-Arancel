#!/usr/bin/env python3
"""clean_subpartida.py

Utility script to scan `dml_08_subpartida_final.sql` and generate a JSON file
containing replacement chunks for every `INSERT INTO SUBPARTIDA` line whose
*descripcion* field contains stray numeric/units data (tarifa, unidad física,
peso, etc.).

The script:
  1. Reads the target SQL file.
  2. Detects lines that match the pattern `INSERT INTO SUBPARTIDA … VALUES …`.
  3. Extracts the third quoted value – the *descripcion*.
  4. If the description ends with a trailing fragment that looks like
     "<numbers> <unit> …" (e.g. "10 3,5,18 kg 6.804" or "20E 5,12 ℓ"), the script
     removes that fragment, leaving only the clean textual description.
  5. Writes a JSON file `clean_subpartida_changes.json` with a list of
     replacement chunks suitable for the `multi_replace_file_content` tool.

The produced JSON has the shape:
```
[ {
    "StartLine": <line>,
    "EndLine": <line>,
    "TargetContent": "<original line>",
    "ReplacementContent": "<cleaned line>"
} , ...]
```
"""
import re
import json
import sys
from pathlib import Path

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
SQL_FILE = Path(r"c:\\Users\\usuario\\Desktop\\New diseño\\sql\\dml_08_subpartida_final.sql")
OUTPUT_JSON = Path(r"c:\\Users\\usuario\\Desktop\\New diseño\\scripts\\clean_subpartida_changes.json")

# Units that may appear in the stray fragment (case‑insensitive)
UNITS = [
    "kg",
    "g",
    "l",
    "ml",
    "ℓ",
    "cm³",
    "cm3",
    "cubic\s*centimeters",
    "cubic\s*centimetres",
    "%",
    "e",
]
UNIT_PATTERN = "|".join(UNITS)

# Regex to capture an INSERT line and the description field (third quoted string)
INSERT_RE = re.compile(
    r"^(INSERT INTO SUBPARTIDA .*? VALUES \([^,]+,\s*'[^']+',\s*'(?P<desc>[^']*)',.*);$",
    re.IGNORECASE,
)

# Regex to detect trailing garbage: a space, numbers/commas/points, optional
# whitespace, then a unit token and anything after it.
GARBAGE_RE = re.compile(
    rf"\s[\d\.,\s]+\b(?:{UNIT_PATTERN})\b.*$",
    re.IGNORECASE,
)

def clean_description(desc: str) -> str:
    """Remove trailing garbage from a description if it matches the pattern.
    Returns the original description if no garbage is detected.
    """
    m = GARBAGE_RE.search(desc)
    if m:
        return desc[: m.start()].rstrip()
    return desc

def main() -> None:
    if not SQL_FILE.is_file():
        print(f"SQL file not found: {SQL_FILE}")
        sys.exit(1)

    changes = []
    with SQL_FILE.open(encoding="utf-8") as f:
        for idx, line in enumerate(f, start=1):
            line = line.rstrip("\n")
            m = INSERT_RE.match(line)
            if not m:
                continue
            desc = m.group("desc")
            cleaned = clean_description(desc)
            if cleaned != desc:
                new_line = line.replace(f"'{desc}'", f"'{cleaned}'")
                changes.append({
                    "StartLine": idx,
                    "EndLine": idx,
                    "TargetContent": line,
                    "ReplacementContent": new_line,
                })

    if not changes:
        print("No dirty descriptions found.")
        return

    OUTPUT_JSON.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT_JSON.open("w", encoding="utf-8") as out:
        json.dump(changes, out, indent=2, ensure_ascii=False)
    print(f"Generated {len(changes)} replacement chunks -> {OUTPUT_JSON}")

if __name__ == "__main__":
    main()
