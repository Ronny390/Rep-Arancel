import csv
import os

file_path = r'c:\Users\usuario\Desktop\New diseño\docs\Notas_Legales_Corregido.csv'
temp_path = r'c:\Users\usuario\Desktop\New diseño\docs\Notas_Legales_Corregido_temp.csv'

try:
    with open(file_path, 'r', encoding='utf-8') as f_in, \
         open(temp_path, 'w', encoding='utf-8', newline='') as f_out:
        reader = csv.reader(f_in, delimiter=',')
        writer = csv.writer(f_out, delimiter=';', quoting=csv.QUOTE_MINIMAL)
        for row in reader:
            writer.writerow(row)
    
    # Replace the original file with the new one
    os.replace(temp_path, file_path)
    print("Conversión exitosa")
except Exception as e:
    print(f"Error: {e}")
