# Arancel Venezuela 2024-2025

Paquete mínimo para cargar en PostgreSQL, publicar en GitHub o migrar a otro entorno.

## Contenido

| Ruta | Descripción |
|------|-------------|
| `sql/arancel_venezuela_PRO_perfect.sql` | Script final: tablas, datos y vista Metabase |
| `datos_csv/` | Conjuntos CSV de datos limpios |
| `migrar_db.py` | Script de migración de base de datos (Python) |
| `requirements.txt` | Dependencias Python |
| `Dockerfile` | Imagen Docker de la aplicación |
| `PLAN_LIMPIEZA.md` | Documentación del proceso de limpieza |

---

# 📦 Título y Descripción

**Arancel Venezuela 2024‑2025** – Un conjunto de scripts y datos para cargar el arancel aduanero venezolano en PostgreSQL, con soporte para despliegue vía Docker y CI/CD (GitHub Actions).

---

# 🛠️ Requisitos Previos

| Herramienta | Versión mínima | Comentario |
|-------------|----------------|-----------|
| **Git** | 2.30+ | Necesario para clonar el repositorio |
| **Python** | 3.9+ | Para ejecutar `migrar_db.py` y scripts auxiliares |
| **pip** | 21+ | Instalación de dependencias |
| **PostgreSQL** | 12+ | Base de datos destino |
| **psycopg2‑binary** (opcional) | – | Conexión nativa desde Python |
| **Docker** | 20.10+ | (Opcional) para despliegue en contenedor |
| **Docker‑Compose** | 2.0+ | (Opcional) para entorno de desarrollo |

> **Nota:** Si `psycopg2` no está disponible, `migrar_db.py` cae automáticamente a usar el cliente `psql`.

---

# 🚀 Instalación y Ejecución Local

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/tu_usuario/arancel_venezuela_repo.git
   cd arancel_venezuela_repo
   ```
2. **Instalar dependencias Python**
   ```bash
   python -m venv venv
   source venv/bin/activate   # Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```
3. **Crear la base de datos PostgreSQL** (si no existe)
   ```bash
   createdb -U postgres arancel_venezuela   # Ajusta el usuario según tu instalación
   ```
4. **Ejecutar la migración**
   ```bash
   python migrar_db.py
   ```
   El script solicitará host, puerto, usuario y nombre de BD (con valores por defecto). Verás un resumen de tablas creadas.
5. **Verificar la carga**
   ```bash
   psql -U postgres -d arancel_venezuela -c "\dt"
   ```
   Deberías observar todas las tablas del arancel.

---

# 📂 Migración de la Base de Datos

El script **`migrar_db.py`** contiene los pasos exactos:

1. **Comprobar existencia del archivo SQL** `sql/arancel_venezuela_PRO_perfect.sql`.
2. **Crear la base de datos** (si no existe) mediante `psycopg2` o `createdb`.
3. **Ejecutar el script SQL completo** contra la base objetivo.
4. **Mostrar listado de tablas creadas** y confirmar éxito.

> **Comando manual alternativo** (sin Python):
> ```bash
> psql -h localhost -U postgres -d arancel_venezuela -f sql/arancel_venezuela_PRO_perfect.sql
> ```

---

# 🌐 Despliegue (Subir al Servidor / Producción)

## Opción 1 – Docker (recomendado)
1. **Construir la imagen**
   ```bash
   docker build -t arancel-venezuela:latest .
   ```
2. **Ejecutar con Docker‑Compose** (crea un `docker-compose.yml` si no existe)
   ```yaml
   version: "3.8"
   services:
     db:
       image: postgres:13-alpine
       environment:
         POSTGRES_USER: postgres
         POSTGRES_PASSWORD: yourpassword
         POSTGRES_DB: arancel_venezuela
       volumes:
         - pgdata:/var/lib/postgresql/data
     app:
       image: arancel-venezuela:latest
       depends_on:
         - db
       environment:
         DB_HOST: db
         DB_PORT: 5432
         DB_USER: postgres
         DB_NAME: arancel_venezuela
         DB_PASSWORD: yourpassword
   volumes:
     pgdata:
   ```
   ```bash
   docker-compose up -d
   ```
3. **Aplicar migración dentro del contenedor** (si la imagen no incluye la base pre‑cargada)
   ```bash
   docker exec -it $(docker ps -q -f "name=app") python migrar_db.py
   ```
## Opción 2 – CI/CD con GitHub Actions
Incluye un workflow `deploy.yml` bajo `.github/workflows/` que:
1. Construye la imagen Docker.
2. Publica la imagen en GitHub Packages o Docker Hub.
3. Despliega a un servidor mediante SSH y `docker-compose pull && docker-compose up -d`.

---

# 📜 Licencia

Este proyecto está bajo la licencia MIT. Consulte el archivo `LICENSE` para más detalles.

---

# 🤝 Contribuciones

¡Las pull‑requests son bienvenidas! Por favor, siga las pautas de estilo descritas en `PLAN_LIMPIEZA.md` y asegúrese de que todos los tests (si los agrega) pasen antes de enviar.
