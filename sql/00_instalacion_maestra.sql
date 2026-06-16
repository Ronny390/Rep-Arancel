SET SQLBLANKLINES ON;
-- ==============================================================================
-- SCRIPT MAESTRO DE INSTALACIÓN - ARANCEL DE ADUANAS DE VENEZUELA
-- ==============================================================================
-- Este script orquesta la ejecución secuencial de la estructura (DDL) 
-- y la carga de datos (DML) respetando la integridad referencial (Llaves Foráneas).
-- ==============================================================================
SET DEFINE OFF;
SET ECHO ON;
PROMPT =========================================================
PROMPT 0. BORRANDO ESTRUCTURAS ANTERIORES
PROMPT =========================================================
@@00_drop_tablas.sql
PROMPT =========================================================
PROMPT 1. CREANDO ESTRUCTURA DE LA BASE DE DATOS (TABLAS Y VISTAS)
PROMPT =========================================================
@@arancel_venezuela_oracle_ddl.sql
@@02_vistas_metabase.sql
PROMPT =========================================================
PROMPT 2. CARGANDO CATÁLOGOS BASE (UNIDADES Y REGÍMENES)
PROMPT =========================================================
@@dml_01_unidad_fisica.sql
@@dml_02_regimen_legal.sql
PROMPT =========================================================
PROMPT 3. CARGANDO JERARQUÍA ARANCELARIA
PROMPT =========================================================
@@dml_05_seccion.sql
@@dml_06_capitulo.sql
@@dml_07_partida.sql
@@dml_08_subpartida.sql
@@dml_10_subpartida_faltantes.sql
PROMPT =========================================================
PROMPT 4. CARGANDO DATOS COMPLEMENTARIOS (TARIFAS Y REGÍMENES POR SUBPARTIDA)
PROMPT =========================================================
@@dml_03_tarifa_ad_valorem.sql
@@dml_11_tarifa_faltantes.sql
@@dml_04_subpartida_regimen.sql
PROMPT =========================================================
PROMPT 5. CARGANDO NOTAS LEGALES
PROMPT =========================================================
@@dml_09_nota_legal.sql
PROMPT =========================================================
PROMPT INSTALACIÓN COMPLETADA CON ÉXITO
PROMPT =========================================================
EXIT;
