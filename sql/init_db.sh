#!/bin/bash
echo "========================================================="
echo "Iniciando auto-instalación del Arancel de Aduanas..."
echo "========================================================="

# Navegar a la carpeta donde están montados nuestros scripts
cd /opt/oracle/sql_scripts

# 1. Crear usuario dedicado 'arancel' para que Metabase no oculte las tablas
echo "Creando usuario ARANCEL en la base de datos..."
sqlplus system/postgres@FREEPDB1 <<EOF
CREATE USER arancel IDENTIFIED BY arancel;
GRANT CONNECT, RESOURCE, DBA TO arancel;
EXIT;
EOF

# 2. Ejecutar el script maestro usando el nuevo usuario
echo "Inyectando tablas y datos en el usuario ARANCEL..."
sqlplus arancel/arancel@FREEPDB1 @00_instalacion_maestra.sql

echo "========================================================="
echo "Auto-instalación completada."
echo "========================================================="
