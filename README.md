# Arancel de Aduanas de Venezuela (Edición 2024-2025) - PostgreSQL & Metabase Ready

Este repositorio contiene la estructura relacional normalizada y los scripts automatizados de migración para el **Arancel de Aduanas de Venezuela (Decreto Extraordinario N° 6.804 / Gaceta Oficial)**. 

Está diseñado específicamente para garantizar la integridad referencial en sistemas empresariales, plataformas de aduanas y para integrarse de forma nativa con herramientas de inteligencia de negocios (BI) como **Metabase**.

---

## 📂 Estructura del Repositorio

```text
arancel_venezuela_repo/
├── migrar_db.bat                <-- Script ejecutable en Windows para migrar la BD
├── migrar_db.sh                 <-- Script ejecutable en Linux/macOS para migrar la BD
├── migrar_db.py                 <-- Asistente robusto en Python para cargar la BD
├── sql/
│   └── arancel_venezuela_PRO.sql <-- Script maestro de DDL e INSERTs (Secciones, Capítulos, Partidas, Subpartidas y Notas)
├── datos_csv/
│   ├── secciones.csv            <-- Datos estructurados de Secciones (I - XXII)
│   ├── capitulos.csv            <-- Datos estructurados de Capítulos (01 - 98)
│   ├── partidas.csv             <-- Datos estructurados de Partidas (ej. 01.01)
│   ├── subpartidas.csv          <-- Datos estructurados de Subpartidas con AEC, ex_AEC y Unidades
│   ├── notas_legales.csv        <-- Notas Legales de Secciones y Capítulos
│   └── arancel_completo.csv     <-- Sábana completa consolidada
├── scripts/
│   ├── constructor_final.py     <-- Script que procesa los CSV y genera el SQL maestro
│   └── agregar_vista.py         <-- Script para regenerar la vista Metabase
└── docs/
    ├── Arancel_24-04-25.pdf     <-- Documento Oficial Original en PDF
    └── Arancel_24-04-25.md      <-- Documento estructurado en texto Markdown
```

---

## 🏛 Estructura Relacional de la Base de Datos

El diseño normalizado distribuye la nomenclatura arancelaria en las siguientes tablas interconectadas:

```
[ secciones ] <--- (1:N) --- [ capitulos ] <--- (1:N) --- [ partidas ] <--- (1:N) --- [ subpartidas ]
      ^                          ^
      |                          |
    (1:N)                      (1:N)
      |                          |
      +---- [ notas_legales ] ---+
```

### 📊 Vista Integrada (`vista_arancel_completo`)
Para reportes inmediatos y dashboards en **Metabase** o **PowerBI**, la base de datos incluye la vista `vista_arancel_completo` que desnormaliza la jerarquía completa en una sola fila por cada producto, permitiendo filtrar y agrupar instantáneamente por sección, capítulo o régimen.

---

## 🚀 Instalación y Migración Rápida

Puede migrar toda la base de datos a su servidor **PostgreSQL** local o en la nube utilizando cualquiera de los scripts provistos según su sistema operativo.

### Opción 1: En Windows (Doble Clic)
1. Asegúrese de tener PostgreSQL instalado e incluido en las variables de entorno (`PATH`).
2. Haga doble clic en el archivo **`migrar_db.bat`**.
3. El asistente le preguntará los datos de conexión (o puede presionar `INTRO` para usar los valores por defecto: `localhost:5432`, usuario `postgres`, BD `arancel_venezuela`).

### Opción 2: En Python (Multiplataforma)
Si tiene Python instalado, este script verifica de forma nativa la existencia de la base de datos y ejecuta la carga de datos de manera robusta:
```bash
python migrar_db.py
```

### Opción 3: En Linux / macOS
Ejecute el script de terminal:
```bash
chmod +x migrar_db.sh
./migrar_db.sh
```

### Opción 4: Manual desde CLI (`psql`)
Si prefiere cargar el script directamente desde la consola:
```bash
createdb -U postgres arancel_venezuela
psql -U postgres -d arancel_venezuela -f sql/arancel_venezuela_PRO.sql
```

---

## 🛠 Cómo publicar este repositorio en GitHub

Para subir este directorio completo a su cuenta de GitHub por primera vez, abra una terminal (Símbolo del Sistema, PowerShell o Git Bash) dentro de esta carpeta y siga estos pasos:

1. **Inicializar Git:**
   ```bash
   git init
   ```
2. **Añadir todos los archivos al índice:**
   ```bash
   git add .
   ```
3. **Crear el commit inicial:**
   ```bash
   git commit -m "Commit inicial: Estructura y scripts de migración del Arancel de Aduanas de Venezuela"
   ```
4. **Conectar con su repositorio en GitHub:**
   *(Cree un nuevo repositorio vacío en GitHub y reemplace la URL)*
   ```bash
   git branch -M main
   git remote add origin https://github.com/SU_USUARIO/arancel-venezuela.git
   ```
5. **Subir los archivos:**
   ```bash
   git push -u origin main
   ```

---

## 📝 Licencia y Mantenimiento
Este proyecto y sus datos están organizados para el cumplimiento normativo e integración tecnológica aduanera en Venezuela.
