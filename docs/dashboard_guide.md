# Guía de Dashboards para Arancel en Metabase

A continuación te propongo una serie de "Preguntas" (cuadros) altamente valiosas que puedes crear en Metabase para armar un **Dashboard de Inteligencia Arancelaria** de nivel profesional.

> [!TIP]
> Acabo de añadir un campo oculto llamado `"Es Terminal"` a la vista principal. Al crear cualquier gráfica estadística (conteos, promedios), asegúrate de agregar el filtro **`Es Terminal = 1`** para evitar contar dos veces las subpartidas "padre" y obtener datos 100% reales.

## 0. Buscador General de Aranceles (Tabla Principal)
Esta es la tabla gigante y detallada que sirve como corazón del Dashboard. Muestra toda la información jerárquica y te permite buscar orgánicamente.
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Métrica**: Datos sin agrupar (Raw Data)
* **Filtros**: Búsqueda libre
* **Visualización**: Tabla (Ocultando desde los ajustes de Metabase la columna "Búsqueda Normalizada").
* **SQL Directo**:
  ```sql
  SELECT *
  FROM VW_BUSCADOR_MAESTRO
  [[ WHERE "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  ```

## 1. Métrica Principal: Total de Subpartidas (Big Number)
Un número grande que muestre la cantidad exacta de productos transables.
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Métrica**: Cuenta de filas
* **Filtros**: `Es Terminal` = 1
* **Visualización**: Número
* **SQL Directo**:
  ```sql
  SELECT COUNT(*) AS "Total Subpartidas" 
  FROM VW_BUSCADOR_MAESTRO 
  WHERE "Es Terminal" = 1
  [[ AND "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  ```

## 2. Promedio de Arancel AEC (Gauge / Medidor)
Muestra la tasa promedio de impuestos de importación ad-valorem.
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Métrica**: Promedio de `Porcentaje Arancel (%)`
* **Filtros**: `Es Terminal` = 1
* **Visualización**: Medidor (Gauge) configurado de 0 a 35%.
* **SQL Directo**:
  ```sql
  SELECT ROUND(AVG("Porcentaje Arancel (%)"), 2) AS "Arancel Promedio (%)" 
  FROM VW_BUSCADOR_MAESTRO 
  WHERE "Es Terminal" = 1
  [[ AND "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  ```

## 3. Top 10 Capítulos con más Subpartidas (Gráfico de Barras Horizontales)
Te permite identificar qué industrias o sectores tienen mayor nivel de especificación en el país.
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Agrupar por**: `Capítulo`
* **Métrica**: Cuenta de filas
* **Filtros**: `Es Terminal` = 1
* **Orden**: Descendente por Cuenta. Limitar a 10.
* **Visualización**: Gráfico de Barras Horizontales (Row Chart).
* **SQL Directo**:
  ```sql
  SELECT "Capítulo", COUNT(*) AS "Cantidad de Productos"
  FROM VW_BUSCADOR_MAESTRO
  WHERE "Es Terminal" = 1
  [[ AND "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  GROUP BY "Capítulo"
  ORDER BY 2 DESC
  FETCH FIRST 10 ROWS ONLY
  ```

## 4. Distribución de Tasas Arancelarias (Histograma/Barras)
Muestra cuántos productos pagan 0%, 5%, 15%, etc.
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Agrupar por**: `Porcentaje Arancel (%)`
* **Métrica**: Cuenta de filas
* **Filtros**: `Es Terminal` = 1
* **Visualización**: Gráfico de Barras.
* **SQL Directo**:
  ```sql
  SELECT "Tarifa AEC", COUNT(*) AS "Cantidad de Productos"
  FROM VW_BUSCADOR_MAESTRO
  WHERE "Es Terminal" = 1
  [[ AND "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  GROUP BY "Tarifa AEC"
  ORDER BY "Tarifa AEC" ASC
  ```

## 5. Tabla de Subpartidas Críticas (Mayor Arancel)
Una tabla plana que muestra rápidamente aquellos productos con aranceles del 35% (o el máximo que posea tu país).
* **Datos**: Tabla `VW_BUSCADOR_MAESTRO`
* **Métrica**: Datos sin agrupar (Raw Data)
* **Filtros**: `Es Terminal` = 1  Y  `Porcentaje Arancel (%)` >= 20
* **Orden**: Porcentaje Arancel (%) Descendente
* **Visualización**: Tabla.
* **SQL Directo**:
  ```sql
  SELECT "Código Subpartida", "Descripción del Producto", "Tarifa AEC"
  FROM VW_BUSCADOR_MAESTRO
  WHERE "Es Terminal" = 1 AND "Porcentaje Arancel (%)" >= 20
  [[ AND "Búsqueda Normalizada" LIKE '%' || UPPER({{buscar}}) || '%' ]]
  ORDER BY "Porcentaje Arancel (%)" DESC
  ```

## ¿Cómo armar el Dashboard?
1. Crea cada una de estas "Preguntas" en Metabase usando el modo **SQL**.
2. Al pegar el código, asegúrate de decirle a Metabase en la barra lateral derecha que la variable `buscar` es de tipo **Texto**.
3. Guarda cada pregunta y añádelas a tu Dashboard.
4. En tu Dashboard, añade un **Filtro de Texto** y vincúlalo a la variable `buscar` de todas las tarjetas. ¡Todo el panel se actualizará sincronizado!
