FROM postgres:15-alpine

# Set environment variables (you can override them at runtime)
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgress   # <-- Cambia esta contraseña
ENV POSTGRES_DB=arancel_venezuela

# Copiar el script SQL al contenedor
COPY arancel_venezuela_PRO_perfect.sql /docker-entrypoint-initdb.d/01_init.sql

# Exponer el puerto estándar de PostgreSQL
EXPOSE 5432

# No other commands are needed – the official postgres image will run the
# scripts in /docker-entrypoint-initdb.d/ on the first start of the container.
