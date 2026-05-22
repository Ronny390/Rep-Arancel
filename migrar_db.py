#!/usr/bin/env python3
import os
import sys
import subprocess

def main():
    print("=" * 68)
    print("      MIGRACIÓN DE BASE DE DATOS - ARANCEL DE ADUANAS VENEZUELA      ")
    print("=" * 68)
    print("\nEste script ejecutará el archivo SQL principal en su servidor PostgreSQL.\n")

    default_host = "localhost"
    default_port = "5432"
    default_user = "postgres"
    default_db = "arancel_venezuela"

    host = input(f"Servidor (Host) [{default_host}]: ").strip() or default_host
    port = input(f"Puerto [{default_port}]: ").strip() or default_port
    user = input(f"Usuario [{default_user}]: ").strip() or default_user
    db = input(f"Nombre de Base de Datos [{default_db}]: ").strip() or default_db

    sql_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "sql", "arancel_venezuela_PRO_perfect.sql")

    if not os.path.exists(sql_path):
        print(f"\n[ERROR] No se encuentra el archivo SQL en: {sql_path}")
        return

    print("\n" + "=" * 68)
    print(f"Configuración de conexión:")
    print(f"  Servidor: {host}:{port}")
    print(f"  Usuario:  {user}")
    print(f"  Base BD:  {db}")
    print(f"  Archivo:  {sql_path}")
    print("=" * 68 + "\n")

    # Intentar importar psycopg2 para conexión nativa o usar psql
    try:
        import psycopg2
        from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

        print("[1/3] Conectando a PostgreSQL para verificar la base de datos...")
        # Conectar a la BD postgres inicial
        conn = psycopg2.connect(host=host, port=port, user=user, dbname="postgres")
        conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
        cur = conn.cursor()

        # Verificar si la base de datos existe
        cur.execute("SELECT 1 FROM pg_catalog.pg_database WHERE datname = %s", (db,))
        exists = cur.fetchone()

        if not exists:
            print(f"Creando base de datos '{db}'...")
            cur.execute(f'CREATE DATABASE "{db}";')
        else:
            print(f"La base de datos '{db}' ya existe.")

        cur.close()
        conn.close()

        print(f"\n[2/3] Conectando a '{db}' y cargando el esquema y datos...")
        conn_db = psycopg2.connect(host=host, port=port, user=user, dbname=db)
        cur_db = conn_db.cursor()
        
        with open(sql_path, 'r', encoding='utf-8') as f:
            sql_content = f.read()

        print("Ejecutando sentencias SQL (esto puede tardar unos momentos)...")
        cur_db.execute(sql_content)
        conn_db.commit()
        
        # Verificar conteo de tablas
        cur_db.execute("""
            SELECT table_name FROM information_schema.tables 
            WHERE table_schema='public'
        """)
        tablas = [r[0] for r in cur_db.fetchall()]
        print(f"\n[3/3] Verificación exitosa. Tablas instaladas ({len(tablas)}):")
        print("  " + ", ".join(tablas))

        cur_db.close()
        conn_db.close()

        print("\n" + "=" * 68)
        print(f"[ÉXITO] Migración completada exitosamente en la BD '{db}'.")
        print("=" * 68)

    except ImportError:
        print("[AVISO] La librería 'psycopg2' no está instalada. Ejecutando mediante el comando CLI 'psql'...")
        
        # Verificar si existe createdb
        try:
            print(f"[1/2] Verificando/Creando base de datos '{db}'...")
            subprocess.run(["createdb", "-h", host, "-p", port, "-U", user, db], capture_output=True)
        except Exception:
            pass

        print(f"\n[2/2] Ejecutando psql para cargar el script SQL...")
        cmd = ["psql", "-h", host, "-p", port, "-U", user, "-d", db, "-f", sql_path]
        res = subprocess.run(cmd)

        if res.returncode == 0:
            print("\n" + "=" * 68)
            print(f"[ÉXITO] Migración completada exitosamente en la BD '{db}'.")
            print("=" * 68)
        else:
            print("\n[ERROR] Ocurrió un fallo durante la ejecución de psql.")
    
    except Exception as e:
        print(f"\n[ERROR] Ocurrió un error inesperado:\n{e}")

if __name__ == "__main__":
    main()
