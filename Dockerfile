# Dockerfile for Arancel Venezuela migration

# Use official Python image (slim for smaller size)
FROM python:3.11-slim

# Install PostgreSQL client (psql) for DB connection
RUN apt-get update && apt-get install -y \ 
    postgresql-client && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy only needed files
COPY requirements.txt ./
COPY migrar_db.py ./
COPY sql/ ./sql/
COPY data/ ./data/
COPY docs/ ./docs/
COPY README.md ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Default command runs the migration script
CMD ["python", "migrar_db.py"]
