# Diagrama de Entidad-Relación — Arancel de Aduanas Venezuela
## Sistema: Proyecto ING, Sistema Ronny

---

## Correcciones aplicadas respecto al modelo anterior:
1. ✅ Entidad `PARTIDA` definida con sus atributos completos y FK.
2. ✅ Entidades `UNIDAD_FISICA` y `TARIFA_AD_VALOREM` definidas con atributos.
3. ✅ Relación muchos-a-muchos `SUBPARTIDA ↔ REGIMEN_LEGAL` resuelta mediante tabla intermedia `SUBPARTIDA_REGIMEN`.
4. ✅ Entidad `NOTA_LEGAL` incluye las 4 FKs opcionales (nullables) para vincularse a Sección, Capítulo, Partida o Subpartida.

## Decisiones de diseño aplicadas:
- `NOTA_LEGAL` es entidad **unificada** con 4 FKs opcionales (facilita consultas en Metabase).
- `TARIFA_AD_VALOREM` es **tabla separada** (soporta historial con `fecha_vigencia` a futuro).
- Relación `SUBPARTIDA ||--o| TARIFA_AD_VALOREM` es **opcional**: solo las subpartidas terminales tienen tarifa.
- Campo `es_terminal` en `SUBPARTIDA`: bandera (1=declarable/con tarifa, 0=agrupación padre).

---

```mermaid
erDiagram

    SECCION ||--o{ CAPITULO : "contiene"
    SECCION ||--o{ NOTA_LEGAL : "tiene"

    CAPITULO ||--o{ PARTIDA : "contiene"
    CAPITULO ||--o{ NOTA_LEGAL : "tiene"

    PARTIDA ||--o{ SUBPARTIDA : "contiene"
    PARTIDA ||--o{ NOTA_LEGAL : "tiene"

    SUBPARTIDA ||--o| TARIFA_AD_VALOREM : "aplica (si es terminal)"
    SUBPARTIDA }o--|| UNIDAD_FISICA : "medida en"
    SUBPARTIDA ||--o{ NOTA_LEGAL : "complementaria"
    SUBPARTIDA ||--o{ SUBPARTIDA_REGIMEN : "requiere"

    REGIMEN_LEGAL ||--o{ SUBPARTIDA_REGIMEN : "aplica a"

    SECCION {
        int     id_seccion       PK
        string  numero_romano
        string  titulo
    }

    CAPITULO {
        int     id_capitulo      PK
        string  codigo_2digitos
        string  descripcion
        int     fk_seccion       FK
    }

    PARTIDA {
        int     id_partida       PK
        string  codigo_4digitos
        string  descripcion
        int     fk_capitulo      FK
    }

    SUBPARTIDA {
        int     id_subpartida    PK
        string  codigo_10digitos
        string  descripcion
        int     es_terminal      "1=declarable, 0=agrupacion"
        int     fk_partida       FK
        int     fk_unidad        FK
    }

    TARIFA_AD_VALOREM {
        int     id_tarifa        PK
        float   porcentaje_aec
        float   porcentaje_exaec
        date    fecha_vigencia   "para historial futuro"
        int     fk_subpartida    FK
    }

    UNIDAD_FISICA {
        int     id_unidad        PK
        string  sigla            "kg, u, m, l..."
        string  nombre
    }

    REGIMEN_LEGAL {
        int     id_regimen       PK
        int     codigo_regimen   "1 al 21"
        string  descripcion      "Permiso / Ministerio"
    }

    SUBPARTIDA_REGIMEN {
        int     fk_subpartida    FK
        int     fk_regimen       FK
    }

    NOTA_LEGAL {
        int     id_nota          PK
        string  tipo_nota        "Seccion/Capitulo/Partida/Complementaria"
        clob    contenido
        int     fk_seccion       FK "nullable"
        int     fk_capitulo      FK "nullable"
        int     fk_partida       FK "nullable"
        int     fk_subpartida    FK "nullable"
    }
```

---

## Regla de integridad para NOTA_LEGAL
Una nota legal debe tener **exactamente uno** de los cuatro FKs con valor (el resto `NULL`).
Esta regla se puede aplicar con un CHECK constraint en Oracle:

```sql
CONSTRAINT chk_nota_un_nivel CHECK (
    (CASE WHEN fk_seccion    IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN fk_capitulo   IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN fk_partida    IS NOT NULL THEN 1 ELSE 0 END +
     CASE WHEN fk_subpartida IS NOT NULL THEN 1 ELSE 0 END) = 1
)
```

---

## Jerarquía completa del modelo
```
SECCION
  └── CAPITULO
        └── PARTIDA
              └── SUBPARTIDA (es_terminal = 1 → tiene TARIFA)
                    ├── TARIFA_AD_VALOREM
                    ├── UNIDAD_FISICA
                    └── REGIMEN_LEGAL (via SUBPARTIDA_REGIMEN)

NOTA_LEGAL → vinculada a cualquier nivel (Sección, Capítulo, Partida o Subpartida)
```
