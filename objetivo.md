# Objetivo del repositorio

## Propósito

Empaquetar el **arancel aduanero de Venezuela (2024–2025)** para cargarlo en **PostgreSQL**, con:

- Datos estructurados en **CSV** (`datos_csv/`)
- Scripts de **migración** (Python, shell y batch)
- Despliegue reproducible con **Docker** y **Docker Compose**

El repositorio debe permitir que cualquier equipo clone el proyecto, ejecute la migración y disponga de la base de datos lista para consultas, reportes o integración con otras aplicaciones, **sin depender de herramientas externas de automatización**.

## Resultado esperado

Al completar la instalación, el operador debe tener:

1. Una base de datos PostgreSQL llamada `arancel_venezuela` (o el nombre configurado).
2. Tablas jerárquicas del arancel: secciones, capítulos, partidas, subpartidas, notas legales y regímenes.
3. La vista `vista_arancel_completo` para consultas unificadas y herramientas de BI.
4. Documentación clara en `README.md` para repetir el proceso en otro servidor u organización.

## Alcance

| Incluido | No incluido |
|----------|-------------|
| Script SQL final (`sql/arancel_venezuela_PRO_perfect.sql`) | Flujos de automatización visual (n8n, etc.) |
| CSV de respaldo y regeneración | CI/CD preconfigurado (se puede añadir después) |
| Migración local y en contenedor | Despliegue gestionado en la nube (paso manual del operador) |
| Documentación del modelo en `docs/` | Oracle como vía principal (existe en `oracle/` como alternativa documentada) |

## Criterios de éxito

- Clonar el repositorio y cargar la BD en **menos de 30 minutos** siguiendo solo el README.
- Vía principal documentada: **Docker** (`docker compose up -d --build`).
- Vías alternativas: **Python**, **psql** y scripts shell/batch.
- Rutas y comandos del README coinciden con los archivos reales del repositorio.
- Sin referencias a servicios ajenos al propósito (automatización, orquestación de workflows, etc.).

## Documentación relacionada

- [README.md](README.md) — Instalación paso a paso
- [PLAN_LIMPIEZA.md](PLAN_LIMPIEZA.md) — Historial y calidad de los datos
- [docs/](docs/) — Esquema de tablas y fuentes del arancel
