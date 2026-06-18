import re

test_cases = [
    "- En canales o medias canales 10 20E 3,5,6 kg",
    "- - De peso inferior a 50 kg 2 10E 5,6 u",
    "- - Sin trocear, frescos o refrigerados 10 3,5,6 kg",
    "- - Sin trocear, congelados 10 10",
    "algo normal sin errores",
    "- Los demás 4 5,10 10 u",
    "- - Las demás 4 10",
    "- - De la especie ovina 2 10E 3,5,6 kg"
]

def parse_corrupted(desc):
    # Let's search from right to left.
    # We look for a space followed by digits as the start of the "corrupted" tail.
    # The corrupted tail consists of tokens: Tarifa (number), optional ExAEC (number/letter), optional Regimen (numbers and commas), optional Unidad (letters).
    # Since the description shouldn't end with random unattached numbers, we can find the FIRST isolated number near the end.
    
    # Let's split by space
    tokens = desc.split()
    
    # We look backwards to find the first token that is NOT a tariff/regimen/unit token.
    # A tariff/regimen/unit token is:
    # - exactly a number (e.g. 2, 10, 14)
    # - a number with letters (e.g. 10E, 20E, 14BK)
    # - numbers with commas (e.g. 5,6 , 3,5,6)
    # - a unit (kg, u, l, m, t)
    
    units = {'u', 'kg', 'l', 'm', 't', 'kwh', 'kw', 'mg', 'mm', 'cm'}
    
    tail_tokens = []
    while tokens:
        last = tokens[-1]
        
        is_unit = last.lower() in units
        is_regimen = bool(re.match(r'^[\d,]+$', last)) and ',' in last
        is_tarifa_or_exa = bool(re.match(r'^[0-9]+[A-Z]*$', last)) or bool(re.match(r'^[A-Z0-9]+$', last) and any(c.isdigit() for c in last))
        
        # '10' is is_tarifa_or_exa.
        
        if is_unit or is_regimen or is_tarifa_or_exa:
            tail_tokens.insert(0, tokens.pop())
        else:
            break
            
    clean_desc = " ".join(tokens)
    
    # If the tail has at least 1 token, and the first token is a number (Tarifa AEC)
    if tail_tokens and bool(re.match(r'^\d+$', tail_tokens[0])):
        tarifa = tail_tokens[0]
        # the rest could be ExAEC, Regimen, Unidad
        exa = None
        reg = None
        uni = None
        
        idx = 1
        # ExAEC is usually something like '10E', '20E', '10', '0A'
        if idx < len(tail_tokens) and (re.match(r'^[0-9]+[A-Z]+$', tail_tokens[idx]) or re.match(r'^[A-Z0-9]+$', tail_tokens[idx])):
            # wait, if it's just '10', it could be ExAEC, or it could be Regimen if there is no comma.
            # But Regimen can also be just '10'.
            # Usually if there are two numbers like '10' '10', the second is Regimen or ExAEC.
            # Let's assume if it has letters it's ExAEC.
            if any(c.isalpha() for c in tail_tokens[idx]):
                if tail_tokens[idx].lower() not in units:
                    exa = tail_tokens[idx]
                    idx += 1
            else:
                # it's purely numbers. Is it Regimen or ExAEC?
                # Regimen usually has commas, but can be single '10'.
                # Let's say if the NEXT token is unit or end, it's Regimen. 
                pass
                
        # Any remaining tokens with commas or numbers are Regimen
        while idx < len(tail_tokens):
            if tail_tokens[idx].lower() in units:
                uni = tail_tokens[idx]
            else:
                if reg is None:
                    reg = tail_tokens[idx]
                else:
                    reg += "," + tail_tokens[idx] # combine them if there's multiple? Like 5,10 10 -> 5,10,10
            idx += 1
            
        print(f"DESC: {desc}")
        print(f"  Clean: {clean_desc}")
        print(f"  AEC:   {tarifa}")
        print(f"  ExAEC: {exa}")
        print(f"  Regim: {reg}")
        print(f"  Uni:   {uni}")
        print("---")

for t in test_cases:
    parse_corrupted(t)
