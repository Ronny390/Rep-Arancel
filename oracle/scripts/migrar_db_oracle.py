# -*- coding: utf-8 -*-
"""
Script de Migración del Arancel de Venezuela a Oracle Database
Utiliza la librería oficial moderna 'oracledb' (que reemplaza a cx_Oracle y no requiere Oracle Instant Client).
"""
import os
import csv
import oracledb

# Configuración de Conexión a Oracle
DB_USER = os.getenv("DB_USER", "system")
DB_PASSWORD = os.getenv("DB_PASSWORD", "oracle_pass")
DB_DSN = os.getenv("DB_DSN", "localhost:1521/FREE") # DSN de Oracle 23c/21c/19c

csv_dir = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "datos_csv")

def migrar():
    print("Iniciando conexión a Oracle Database...")
    try:
        # Conexión en modo Thin (puro Python, sin necesidad de clientes nativos de Oracle)
        connection = oracledb.connect(user=DB_USER, password=DB_PASSWORD, dsn=DB_DSN)
        cursor = connection.cursor()
        print("¡Conectado exitosamente!")
        
        # 1. Ejecutar DDL para limpiar y crear tablas
        ddl_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "sql", "oracle", "arancel_venezuela_oracle.sql")
        if os.path.exists(ddl_path):
            print("Creando tablas DDL en Oracle...")
            with open(ddl_path, "r", encoding="utf-8") as ddl_file:
                statements = ddl_file.read().split("/")
                for statement in statements:
                    stmt = statement.strip()
                    if stmt:
                        try:
                            cursor.execute(stmt)
                        except oracledb.DatabaseError as ex:
                            # Ignorar errores al borrar tablas que no existen
                            if "ORA-00942" not in str(ex):
                                print(f"Error DDL: {ex}")
            connection.commit()
            print("Tablas creadas con éxito.")
        
        # 2. Cargar Secciones
        print("Cargando Secciones...")
        with open(os.path.join(csv_dir, "secciones.csv"), "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader) # Saltar cabecera
            for row in reader:
                cursor.execute(
                    "INSERT INTO secciones (id_seccion, nombre, descripcion) VALUES (:1, :2, :3)",
                    (row[0], row[1], row[2])
                )
        
        # 3. Cargar Capítulos
        print("Cargando Capítulos...")
        with open(os.path.join(csv_dir, "capitulos.csv"), "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO capitulos (id_capitulo, id_seccion, numero, descripcion) VALUES (:1, :2, :3, :4)",
                    (row[0], row[1], row[2], row[3])
                )
        
        # 4. Cargar Partidas
        print("Cargando Partidas...")
        with open(os.path.join(csv_dir, "partidas.csv"), "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO partidas (id_partida, id_capitulo, codigo, descripcion) VALUES (:1, :2, :3, :4)",
                    (row[0], row[1], row[2], row[3])
                )
        
        # 5. Cargar Subpartidas
        print("Cargando Subpartidas...")
        with open(os.path.join(csv_dir, "subpartidas.csv"), "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO subpartidas (id_subpartida, id_partida, codigo, descripcion, aec, ex_aec, unidad) VALUES (:1, :2, :3, :4, :5, :6, :7)",
                    (row[0], row[1], row[2], row[3], row[4] or None, row[5] or None, row[6] or None)
                )

        # 6. Cargar Notas Legales
        print("Cargando Notas Legales...")
        with open(os.path.join(csv_dir, "notas_legales.csv"), "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            next(reader)
            for row in reader:
                cursor.execute(
                    "INSERT INTO notas_legales (id_nota, id_seccion, id_capitulo, texto) VALUES (:1, :2, :3, :4)",
                    (row[0], row[1] or None, row[2] or None, row[3])
                )
        
        connection.commit()
        print("¡Migración a Oracle Database completada exitosamente sin errores!")
        
    except Exception as e:
        print(f"Error crítico durante la migración: {e}")
    finally:
        if 'connection' in locals():
            connection.close()

if __name__ == "__main__":
    migrar()
