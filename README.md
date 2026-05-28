# Arancel Venezuela 2024–2025

Repositorio para cargar el arancel aduanero venezolano en **PostgreSQL**. Incluye el script SQL final, datos CSV, scripts de migración y despliegue con Docker.

**Objetivo del proyecto:** ver [objetivo.md](objetivo.md).

**Repositorio:** https://github.com/Ronny390/Rep-Arancel

---

## Inicio rápido (recomendado: Docker)

La forma **más fácil** de ejecutar el proyecto es con **Docker**: no necesitas instalar PostgreSQL ni Python en tu máquina. El contenedor crea la base de datos y carga el arancel automáticamente en el primer arranque.

**Requisitos:** [Docker](https://docs.docker.com/get-docker/) 20.10+ y [Docker Compose](https://docs.docker.com/compose/install/) 2.0+.

```bash
git clone https://github.com/Ronny390/Rep-Arancel.git
cd Rep-Arancel
docker compose up -d --build
```

Comprobar que todo cargó:

```bash
docker compose ps
docker exec -it arancel_postgres psql -U postgres -d arancel_venezuela -c "\dt"
```

**Conexión a la base de datos:**

| Parámetro | Valor por defecto |
|-----------|-------------------|
| Host | `localhost` |
| Puerto | `5432` |
| Base de datos | `arancel_venezuela` |
| Usuario | `postgres` |
| Contraseña | `postgress` |

> Cambia la contraseña en `docker-compose.yml` y `Dockerfile` antes de usar en producción.

**Detener / reiniciar:**

```bash
docker compose stop          # detener sin borrar datos
docker compose start         # volver a levantar
docker compose down          # detener y quitar contenedor
docker compose down -v       # borrar también los datos (recarga el SQL en el próximo up)
```

Guía completa de Docker: [Instalación con Docker](#instalación-con-docker-recomendado).

---

## Requisitos

### Ruta rápida (Docker) — recomendada

| Herramienta | Versión mínima |
|-------------|----------------|
| Git | 2.30+ |
| Docker | 20.10+ |
| Docker Compose | 2.0+ |

### Rutas alternativas (sin Docker)

| Herramienta | Versión mínima | Uso |
|-------------|----------------|-----|
| PostgreSQL | 12+ | Base de datos en el host |
| Python | 3.9+ | `migrar_db.py` |
| pip | 21+ | `requirements.txt` |
| psql / createdb | — | `migrar_db.sh` / `migrar_db.bat` |

---

## Estructura del repositorio

```
Rep-Arancel/
├── objetivo.md                 # Propósito y criterios del proyecto
├── README.md                   # Esta guía de instalación
├── PLAN_LIMPIEZA.md            # Auditoría y limpieza de datos
├── Dockerfile                  # Imagen PostgreSQL con carga automática
├── docker-compose.yml          # Servicio PostgreSQL (método recomendado)
├── arancel_venezuela_PRO_perfect.sql   # SQL usado por Docker al iniciar
├── sql/
│   └── arancel_venezuela_PRO_perfect.sql   # Script principal
├── migrar_db.py                # Migración sin Docker (Python)
├── migrar_db.sh / migrar_db.bat
├── requirements.txt
├── datos_csv/                  # CSV fuente (respaldo / regeneración)
├── docs/                       # Documentación de tablas
├── oracle/                     # Vía alternativa Oracle (opcional)
└── auditoria_reporte.txt
```

### Archivo SQL principal

```text
sql/arancel_venezuela_PRO_perfect.sql
```

Crea tablas, carga datos e incluye la vista `vista_arancel_completo`.

### Modelo de datos (PostgreSQL)

| Tabla | Descripción |
|-------|-------------|
| `secciones` | Nivel superior del arancel |
| `capitulos` | Capítulos por sección |
| `partidas` | Partidas (código de 4 dígitos) |
| `subpartidas` | Subpartidas con AEC, unidad, etc. |
| `notas_legales` | Notas por sección o capítulo |
| `regimen_legal_catalogo` | Catálogo de regímenes |
| `subpartida_regimen` | Relación subpartida–régimen |
| `vista_arancel_completo` | Vista unificada para consultas y BI |

Detalle de columnas: carpeta [docs/](docs/).

---

## Instalación con Docker (recomendado)

PostgreSQL 15 en contenedor. En el **primer arranque** ejecuta el script SQL y deja la base lista.

### Paso 1: Clonar

```bash
git clone https://github.com/Ronny390/Rep-Arancel.git
cd Rep-Arancel
```

### Paso 2: (Opcional) Ajustar credenciales

Edita la misma contraseña en ambos archivos:

- `docker-compose.yml` → `POSTGRES_PASSWORD`
- `Dockerfile` → `POSTGRES_PASSWORD`

### Paso 3: Levantar el servicio

```bash
docker compose up -d --build
```

La primera vez puede tardar varios minutos (descarga de imagen + carga del SQL).

### Paso 4: Verificar

```bash
docker compose ps
docker exec -it arancel_postgres psql -U postgres -d arancel_venezuela -c "\dt"
```

Conteo de registros:

```bash
docker exec -it arancel_postgres psql -U postgres -d arancel_venezuela -c "
SELECT 'secciones' AS tabla, COUNT(*) FROM secciones
UNION ALL SELECT 'capitulos', COUNT(*) FROM capitulos
UNION ALL SELECT 'partidas', COUNT(*) FROM partidas
UNION ALL SELECT 'subpartidas', COUNT(*) FROM subpartidas
UNION ALL SELECT 'notas_legales', COUNT(*) FROM notas_legales;"
```

### Conectar desde otra aplicación

| Parámetro | Valor (Docker en el mismo equipo) |
|-----------|-----------------------------------|
| Host | `localhost` (o IP del servidor) |
| Puerto | `5432` |
| Base de datos | `arancel_venezuela` |
| Usuario | `postgres` |
| Contraseña | la de `docker-compose.yml` |
| SSL | no requerido en entorno local |

### Recargar la base desde cero

El SQL solo corre cuando el volumen de datos está vacío:

```bash
docker compose down -v
docker compose up -d --build
```

### Despliegue en otro servidor

1. Instalar Docker y Docker Compose en el servidor.
2. Clonar el repositorio o copiar el proyecto completo.
3. Ajustar contraseñas en `docker-compose.yml` y `Dockerfile`.
4. Ejecutar `docker compose up -d --build`.
5. Abrir el puerto `5432` en el firewall si otras máquinas deben conectarse.
6. Respaldar cuando esté validado:

```bash
docker exec arancel_postgres pg_dump -U postgres -d arancel_venezuela -Fc > arancel_backup.dump
```

---

## Otros métodos de instalación

Usa estas opciones solo si **no puedes** usar Docker (PostgreSQL ya instalado en el host, políticas de la empresa, etc.).

| Método | Comando | Cuándo usarlo |
|--------|---------|---------------|
| Python | `python migrar_db.py` | Tienes Python; quieres asistente interactivo |
| Shell (psql) | `./migrar_db.sh` | Linux/macOS con cliente PostgreSQL |
| Batch (psql) | `migrar_db.bat` | Windows con cliente PostgreSQL |
| psql manual | Ver abajo | Scripts propios o CI sin contenedores |

### Python

```bash
python -m venv venv
source venv/bin/activate          # Linux/macOS
# venv\Scripts\activate           # Windows
pip install -r requirements.txt
python migrar_db.py
```

Valores por defecto: host `localhost`, puerto `5432`, usuario `postgres`, base `arancel_venezuela`.

### Shell o Batch (psql)

```bash
chmod +x migrar_db.sh && ./migrar_db.sh    # Linux/macOS
```

```cmd
migrar_db.bat                               REM Windows
```

### Migración manual con psql

```bash
createdb -U postgres arancel_venezuela
psql -h localhost -U postgres -d arancel_venezuela \
  -f sql/arancel_venezuela_PRO_perfect.sql
```

Windows:

```cmd
psql -h localhost -U postgres -d arancel_venezuela -f sql\arancel_venezuela_PRO_perfect.sql
```

### Variables de entorno (`migrar_db.sh`)

```bash
export DB_HOST=192.168.1.10
export DB_PORT=5432
export DB_USER=postgres
export DB_NAME=arancel_venezuela
./migrar_db.sh
```

---

## Verificación post-instalación

### Con Docker

```bash
docker exec -it arancel_postgres psql -U postgres -d arancel_venezuela -c "\dt"
```

### Sin Docker (PostgreSQL en el host)

```bash
psql -U postgres -d arancel_venezuela -c "\dt"
```

### Consulta de ejemplo

```sql
SELECT codigo_subpartida, descripcion, aec
FROM vista_arancel_completo
WHERE codigo_subpartida LIKE '0101%'
LIMIT 10;
```

---

## Datos CSV y regeneración

La carpeta `datos_csv/` contiene los conjuntos del pipeline de limpieza. **No hace falta importarlos** si usas Docker o el script SQL: los datos ya van incluidos. Sirven para auditoría o regeneración. Ver [PLAN_LIMPIEZA.md](PLAN_LIMPIEZA.md) y [auditoria_reporte.txt](auditoria_reporte.txt).

---

## Oracle (opcional)

Vía alternativa en [docs/README_oracle.md](docs/README_oracle.md) y carpeta `oracle/`. El flujo principal del repositorio es PostgreSQL con Docker.

---

## Solución de problemas

| Problema | Solución |
|----------|----------|
| `docker: command not found` | Instala Docker; en Linux añade tu usuario al grupo `docker` |
| Puerto `5432` en uso | Cambia el mapeo en `docker-compose.yml` (ej. `"5433:5432"`) |
| Docker no carga datos / tablas vacías | Volumen ya inicializado: `docker compose down -v` y `up` de nuevo |
| Carga muy lenta la primera vez | Normal (~29k líneas SQL); revisa logs: `docker compose logs -f postgres` |
| Error de autenticación (sin Docker) | Revisa usuario/contraseña y `pg_hba.conf` |
| `psql: command not found` (sin Docker) | Instala cliente PostgreSQL o usa `migrar_db.py` |
| Script SQL no encontrado | Ejecuta comandos desde la raíz del repo clonado |

---

## Contribuciones

Las pull requests son bienvenidas. Para cambios en datos o SQL, revisa [PLAN_LIMPIEZA.md](PLAN_LIMPIEZA.md) y actualiza `auditoria_reporte.txt` si corresponde.
