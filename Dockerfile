FROM postgres:15-alpine

# Variables por defecto (puedes sobreescribirlas en docker-compose.yml)
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgress
ENV POSTGRES_DB=arancel_venezuela

# Copiar el script SQL al contenedor (se ejecuta solo en el primer arranque)
COPY arancel_venezuela_PRO_perfect.sql /docker-entrypoint-initdb.d/01_init.sql

EXPOSE 5432
