#!/bin/bash
echo "========================================================="
echo "Iniciando auto-instalación del Arancel de Aduanas..."
echo "========================================================="

# Navegar a la carpeta donde están montados nuestros scripts
cd /opt/oracle/sql_scripts

# Ejecutar el script maestro usando sqlplus
sqlplus system/postgres@FREEPDB1 @00_instalacion_maestra.sql

echo "========================================================="
echo "Auto-instalación completada."
echo "========================================================="
