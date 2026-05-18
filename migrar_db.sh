#!/usr/bin/env bash
set -e

echo "====================================================================="
echo "      MIGRACIÓN DE BASE DE DATOS - ARANCEL DE ADUANAS VENEZUELA      "
echo "====================================================================="
echo ""

DB_HOST=${DB_HOST:-"localhost"}
DB_PORT=${DB_PORT:-"5432"}
DB_USER=${DB_USER:-"postgres"}
DB_NAME=${DB_NAME:-"arancel_venezuela"}

read -p "Servidor (Host) [$DB_HOST]: " INPUT_HOST
DB_HOST=${INPUT_HOST:-$DB_HOST}

read -p "Puerto [$DB_PORT]: " INPUT_PORT
DB_PORT=${INPUT_PORT:-$DB_PORT}

read -p "Usuario [$DB_USER]: " INPUT_USER
DB_USER=${INPUT_USER:-$DB_USER}

read -p "Nombre de Base de Datos [$DB_NAME]: " INPUT_DB
DB_NAME=${INPUT_DB:-$DB_NAME}

echo ""
echo "====================================================================="
echo "Resumen de conexión:"
echo "Servidor: $DB_HOST:$DB_PORT"
echo "Usuario:  $DB_USER"
echo "Base BD:  $DB_NAME"
echo "Archivo:  sql/arancel_venezuela_PRO.sql"
echo "====================================================================="
echo ""

if ! command -v psql &> /dev/null; then
    echo "[ERROR] No se encuentra la herramienta 'psql'."
    echo "Asegúrese de instalar PostgreSQL client en su sistema."
    echo "  Ubuntu/Debian: sudo apt install postgresql-client"
    echo "  macOS (Homebrew): brew install postgresql"
    exit 1
fi

echo "[1/2] Verificando si existe la base de datos '$DB_NAME'..."
if ! psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$DB_NAME'" | grep -q 1; then
    echo "Creando base de datos '$DB_NAME'..."
    createdb -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" "$DB_NAME"
else
    echo "La base de datos '$DB_NAME' ya existe."
fi

echo ""
echo "[2/2] Ejecutando script de importación SQL..."
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f "sql/arancel_venezuela_PRO.sql"

echo ""
echo "====================================================================="
echo "[ÉXITO] Migración completada exitosamente en la BD '$DB_NAME'."
echo "====================================================================="
