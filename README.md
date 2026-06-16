# 🇻🇪 Arancel de Aduanas de Venezuela - Base de Datos & BI

![Status](https://img.shields.io/badge/Estado-Completado-success)
![Oracle](https://img.shields.io/badge/Oracle-26ai_Free-red)
![Docker](https://img.shields.io/badge/Docker-Compose-blue)
![Metabase](https://img.shields.io/badge/BI-Metabase-blueviolet)

Este repositorio contiene la arquitectura completa, modelo de datos relacional y scripts DDL/DML para desplegar el **Arancel de Aduanas de Venezuela** oficial. Incluye más de 11,000 subpartidas, notas legales, secciones, y más de 8,300 tarifas arancelarias (AEC y Ex.AEC) soportando la codificación alfanumérica legal (ej. `14BK`, `0A`, `OBIT`).

## 🚀 Despliegue Rápido (One-Click Migration)

Todo el ecosistema está contenerizado. Puedes desplegar la base de datos Oracle (con auto-inyección de todos los registros) y la herramienta de Business Intelligence (Metabase) con un solo clic.

### Prerrequisitos
- **Docker Desktop** instalado y ejecutándose en tu máquina. Si no lo tienes, descárgalo e instálalo gratis desde [docker.com](https://www.docker.com/products/docker-desktop/).

### Opción 1: Instalación Mágica (Recomendada para Windows)
1. Clona o descarga esta carpeta en tu computadora.
2. Da doble clic en el archivo `Instalar_Proyecto.bat`.
3. Espera un par de minutos a que Oracle construya la base de datos internamente.
4. Entra a Metabase en tu navegador web: [http://localhost:3000](http://localhost:3000)

### Opción 2: Instalación por Terminal (Linux/Mac/PowerShell)
Si prefieres usar la terminal en lugar del `.bat`:
```bash
docker-compose up -d
```
Espera 2 minutos mientras el script `init_db.sh` se autoejecuta dentro del contenedor e instala todas las tablas y datos.

---

## 🛠 Instalación Manual (Sin Docker)

Si tu equipo o universidad prefiere no usar Docker y ya cuentan con un servidor **Oracle Database** físico o local, puedes instalar el proyecto manualmente usando DBeaver, SQL Developer, o SQL*Plus:

1. Conéctate a tu base de datos Oracle como `SYSTEM`.
2. Abre el archivo maestro ubicado en `sql/00_instalacion_maestra.sql`.
3. Ejecútalo como un "Script Completo" (en DBeaver usando `Alt + X` o ejecutando `@00_instalacion_maestra.sql` en SQL*Plus).
4. **¡Listo!** El script maestro se encargará de crear las tablas, limpiar instancias anteriores y llamar a todos los módulos DML en el orden correcto.

---

## 🔑 Credenciales por Defecto

**Base de Datos Oracle**
- **Host:** `localhost`
- **Puerto:** `1521`
- **Usuario:** `SYSTEM`
- **Contraseña:** `postgres`
- **SID/Service Name:** `FREEPDB1`

**Metabase (Dashboards)**
- **URL:** `http://localhost:3000`
- **Configuración Inicial (Conexión a Oracle):**
  Al entrar a Metabase por primera vez y crear tu cuenta, elige agregar una base de datos "Oracle" e ingresa exactamente estos datos:
  - **Host:** `oracle-db` *(importante: usar este nombre en lugar de localhost)*
  - **Port:** `1521`
  - **Database Name / Service:** `FREEPDB1`
  - **User:** `SYSTEM`
  - **Password:** `postgres`

*Nota Técnica: Por restricciones legales de Oracle, el driver oficial `ojdbc11.jar` no viene preinstalado en Metabase, pero este repositorio ya lo incluye y lo inyecta automáticamente a través del archivo `docker-compose.yml`.*

---
*Desarrollado para la evaluación universitaria.*
