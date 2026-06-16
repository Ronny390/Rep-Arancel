@echo off
echo =========================================================
echo   INSTALADOR AUTOMATICO - ARANCEL DE ADUANAS DE VENEZUELA
echo =========================================================
echo.
echo Verificando si Docker esta instalado...
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Docker no esta instalado o no esta en ejecucion.
    echo Por favor instala Docker Desktop y vuelve a intentarlo.
    pause
    exit /b
)

echo.
echo [1/3] Iniciando la magia con Docker Compose...
echo Esto descargara e instalara Oracle Database y Metabase.
echo (La primera vez puede tardar varios minutos dependiendo de tu internet)
docker-compose up -d

echo.
echo [2/3] Base de datos y BI levantados en segundo plano.
echo.
echo [3/3] Oracle esta construyendo las tablas e inyectando las 8,300+ tarifas...
echo Por favor, espera 2 minutos antes de abrir Metabase.
echo.
echo Listo! Todo el ecosistema ha sido configurado.
echo Puedes abrir tu navegador en: http://localhost:3000 (Metabase)
echo.
pause
