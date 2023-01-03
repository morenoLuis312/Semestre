## DDL - Data Definition Lenguage

Las sentencias **DDL** son aquellas utilizadas para la creación de una base de datos y todos sus componentes: tablas, índices, relaciones, disparadores (triggers), procedimientos almacenados, etc.

**CREAR TABLAS
```sql 
CREATE TABLE IF NOT EXISTS "nombre_tabla"(
	"nombre_columna" "tipo_de_dato",
	"nombre_columna" "tipo_de_dato"
);
```

TIPOS DE DATOS
* INT
* BOOLEAN
* CHAR, VARCHAR, TEXT
* NUMERIC
* 

**ELIMINAR TABLAS**

```sql 
DROP TABLE IF EXISTS "nombre_tabla";
```

## DML - Data Manipulation Lenaguage

Las sentencias **DML** son aquellas utilizadas para insertar, borrar, modificar y consultar los datos de una base de datos.

Operaciones CRUD:

* ==C==: Create --> ``INSERT INTO``
* ==R==: Read --> ``SELECT``
* ==U==: Update --> 
* ==D==: Delete -->

CREATE - INSERT

```sql 
INSERT INTO "nombre_tabla" ("nombre_columna", "nombre_columna") VALUES ("datos", "datos");
```

READ - SELECT

```sql 
SELECT * || "nombre_columna", "nombre_columna" FROM "nombre_tabla";
```
