## DDL - Data Definition Lenguage

Las sentencias **DDL** son aquellas utilizadas para la creación de una base de datos y todos sus componentes: tablas, índices, relaciones, disparadores (triggers), procedimientos almacenados, etc.

### OPERACIONES CON ==BASES DE DATOS==

**CREAR BASE DE DATOS**
```sql 
CREATE DATABASE "nombre_bd";
```

**ELIMINAR BASE DE DATOS**
```sql 
DROP DATABASE "nombre_bd";
```

### OPERACIONES CON ==TABLAS==

**CREAR TABLAS
```sql 
CREATE TABLE IF NOT EXISTS "nombre_tabla"(
	"nombre_columna" "tipo_de_dato",
	"nombre_columna" "tipo_de_dato"
);
```

**ELIMINAR TABLAS**
```sql 
DROP TABLE IF EXISTS "nombre_tabla";
```

**CAMBIAR NOMBRE A TABLAS**
```sql 
ALTER TABLE IF EXIST "nombre_tabla" RENAME TO "nombre_nuevo";
```

**AGREGAR COLUMNAS A UNA TABLA**
```sql 
ALTER TABLE "nombre_tabla" ADD COLUMN "nombre_nueva_columna" "tipo_de_dato";
```
**ELIMINAR COLUMNAS A UNA TABLA**
```sql 
ALTER TABLE "nombre_tabla" DROP COLUMN IF EXISTS "nombre_columna";
```


### ==TIPOS DE DATOS==
* INT
* BOOLEAN
* CHAR, VARCHAR, TEXT
* NUMERIC
* DATE
* TIME
* SERIAL


### ==RESTRICCIONES== EN LAS COLUMNAS DE LAS TABLAS
* PRIMARY KEY
* UNIQUE
* NOT NULL
* CHECK








## DML - Data Manipulation Lenaguage

Las sentencias **DML** son aquellas utilizadas para insertar, borrar, modificar y consultar los datos de una base de datos.

Operaciones CRUD:

* ==C==: Create --> ``INSERT INTO``
* ==R==: Read --> ``SELECT FROM``
* ==U==: Update --> ``UPDATE SET``
* ==D==: Delete --> ``DELETE FROM``

### 1. Recuperar datos (READ - SELECT FROM)

```sql 
SELECT * || "nombre_columna", "nombre_columna" FROM "nombre_tabla";
```

Ejemplo:

```sql 
SELECT * FROM employees;
```


### 2. Insertar nuevos datos (CREATE - INSERT INTO)

```sql 
INSERT INTO "nombre_tabla" ("nombre_columna", "nombre_columna") VALUES ("datos", "datos");
```

Ejemplos:

```sql 
INSERT INTO employees (id, married, name, genre, salary, birth_date, start_at) 
VALUES (1,FALSE, 'Juan', 'M', 111.28,'2001-08-10','08:45:10');}
```

### 3. Actualizar datos (UPDATE - UPDATE SET WHERE)



### 4. Eliminar datos (DELETE - DELETE FROM)