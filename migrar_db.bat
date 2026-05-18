@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

echo =====================================================================
echo       MIGRACIÓN DE BASE DE DATOS - ARANCEL DE ADUANAS VENEZUELA
echo =====================================================================
echo.

:: Valores por defecto
set "DB_HOST=localhost"
set "DB_PORT=5432"
set "DB_USER=postgres"
set "DB_NAME=arancel_venezuela"

echo Pulse INTRO para usar los valores por defecto o escriba su propia configuracion:
echo.

set /p "INPUT_HOST=Servidor (Host) [%DB_HOST%]: "
if not "!INPUT_HOST!"=="" set "DB_HOST=!INPUT_HOST!"

set /p "INPUT_PORT=Puerto [%DB_PORT%]: "
if not "!INPUT_PORT!"=="" set "DB_PORT=!INPUT_PORT!"

set /p "INPUT_USER=Usuario [%DB_USER%]: "
if not "!INPUT_USER!"=="" set "DB_USER=!INPUT_USER!"

set /p "INPUT_DB=Nombre de Base de Datos [%DB_NAME%]: "
if not "!INPUT_DB!"=="" set "DB_NAME=!INPUT_DB!"

echo.
echo =====================================================================
echo Resumen de conexion:
echo Servidor: %DB_HOST%:%DB_PORT%
echo Usuario:  %DB_USER%
echo Base BD:  %DB_NAME%
echo Archivo:  sql\arancel_venezuela_PRO.sql
echo =====================================================================
echo.

:: Comprobar si psql esta en el PATH
where psql >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] No se encuentra 'psql' en las variables de entorno PATH.
    echo Asegurese de tener PostgreSQL instalado e incluido en el PATH del sistema.
    echo.
    echo Puede intentar ejecutar la migracion con el script de Python:
    echo     python migrar_db.py
    echo.
    pause
    exit /b 1
)

echo [1/2] Verificando existencia de la base de datos '%DB_NAME%'...
psql -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='%DB_NAME%'" | findstr "1" >nul
if %ERRORLEVEL% neq 0 (
    echo Creando base de datos '%DB_NAME%'...
    createdb -h %DB_HOST% -p %DB_PORT% -U %DB_USER% "%DB_NAME%"
    if !ERRORLEVEL! neq 0 (
        echo [ERROR] No se pudo crear la base de datos '%DB_NAME%'.
        pause
        exit /b 1
    )
) else (
    echo La base de datos '%DB_NAME%' ya existe.
)

echo.
echo [2/2] Ejecutando script de importacion SQL (esto puede tomar unos momentos)...
psql -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d "%DB_NAME%" -f "sql\arancel_venezuela_PRO.sql"

if %ERRORLEVEL% equ 0 (
    echo.
    echo =====================================================================
    echo [EXITO] Migracion completada correctamente en la BD '%DB_NAME%'.
    echo =====================================================================
) else (
    echo.
    echo [ERROR] Ocurrio un error durante la ejecucion del script SQL.
)

echo.
pause
