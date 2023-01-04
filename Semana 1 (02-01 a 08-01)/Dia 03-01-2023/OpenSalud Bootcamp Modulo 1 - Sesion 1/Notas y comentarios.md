Para la conexión a la base de datos
PgAdmin
	Usuario: postgrest
	Contraseña: 6536

MySQL
	Usuario: root
	Contraseña: 6536

### Cargar base de datos pagila (PostgreSQL)

Descargar y descomprimir [pagila](https://github.com/devrimgunduz/pagila)

1.- En postgreSQL 
```sql
CREATE DATABASE pagila;
```
2.- Ejecutar en el cmd 
```cmd
psql -h localhost -p 5432 -U postgres -d pagila < pagila-schema.sql
```
3.- Ejecturar en el cmd 
```cmd
psql -h localhost -p 5432 -U postgres -d pagila < pagila-data.sql
```


COMPLETADO 

```sql 

--Crear base de datos
CREATE DATABASE pagila;

--Crear tabla si no existe
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	name VARCHAR,
	married BOOLEAN
);


--Tipos de datos:
--INT
CREATE TABLE IF NOT EXISTS employees(
	id INT
);


--Operacion CRUD || READ - LEER datos de una tabla
SELECT * FROM employees; -- Selecciona todos los datos de la tabla "employees"


--TIPOS DE DATOS: BOOLEAN --Al insertar datos booleanos, se pueden poner "TRUE o FALSE", "0 o 1" y "yes o no"
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	married BOOLEAN
);


--Operacion CRUD || INSERT - INSERTAR datos de una tabla
INSERT INTO employees (id, married) VALUES (1, TRUE);
INSERT INTO employees (id, married) VALUES (2, FALSE);


-- TIPO DE DATOS: VARCHAR, CHAR Y TEXT
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	married BOOLEAN,
	name VARCHAR(250), --El numero representa el numero maximo de carácteres
	genre CHAR(1) 
);
INSERT INTO employees (id, married, name, genre) VALUES (3, FALSE, 'Pedrito', 'M');
SELECT * FROM employees;


-- TIPO DE DATOS: NUMERIC
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	married BOOLEAN,
	name VARCHAR(250),
	genre CHAR(1),
	salary NUMERIC(9,2) --El primer numero regular la longitud del nunero y el segundo los decimales
);
INSERT INTO employees (id, married, name, genre, salary) VALUES (3, FALSE, 'Pedrito', 'M', 111.28);
SELECT * FROM employees;


-- TIPO DE DATOS: DATE
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	married BOOLEAN,
	name VARCHAR(250),
	genre CHAR(1),
	salary NUMERIC(9,2), 
	birth_date DATE -- Al insertar datos seguir el formato "yyyy-mm-dd"
);
INSERT INTO employees (id, married, name, genre, salary, birth_date) 
VALUES (3, FALSE, 'Pedrito', 'M', 111.28,'2001-08-10');
SELECT * FROM employees;


--TIPOS DE DATOS: TIME
CREATE TABLE IF NOT EXISTS employees(
	id INT,
	married BOOLEAN,
	name VARCHAR(250),
	genre CHAR(1),
	salary NUMERIC(9,2), 
	birth_date DATE, 
	start_at TIME -- Al insertar datos seguir el formato "hh-mm-ss"
);
INSERT INTO employees (id, married, name, genre, salary, birth_date, start_at) 
VALUES (3, FALSE, 'Pedrito', 'M', 111.28,'2001-08-10','08:45:10');
SELECT * FROM employees;


--Renombrar una tabla
ALTER TABLE employees RENAME TO employees_2023


--Agregar columnas a una tabla
ALTER TABLE employees ADD COLUMN email VARCHAR(100);


--Eliminar columnas a una tabla
ALTER TABLE employees DROP COLUMN salary;

--Identificador || TIPO DE PSEUDO-DATO: SERIAL
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL, --Si tu no incluyes este parametro ingresar datos, se añadirá segun lan secuencia que lleva
	married BOOLEAN,
	name VARCHAR(250),
	genre CHAR(1),
	salary NUMERIC(9,2), 
	birth_date DATE, 
	start_at TIME
);
INSERT INTO employees (married, name, genre, salary, birth_date, start_at) 
VALUES (FALSE, 'Pedrito', 'M', 111.28,'2001-08-10','08:45:10');
INSERT INTO employees (married, name, genre, salary, birth_date, start_at) 
VALUES (FALSE, 'Juan', 'M', 111.28,'2001-08-10','08:45:10');
SELECT * FROM employees;


--Verificar si se pueden duplicar datos
INSERT INTO employees (id, married, name, genre, salary, birth_date, start_at) 
VALUES (1,FALSE, 'Juan', 'M', 111.28,'2001-08-10','08:45:10'); --Si permite duplicado
SELECT * FROM employees; 


--PRIMARY KEY
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY, --Se añade el atributo PRIMARY KEY, en este metodo no puede haber el mismo dato repetido
	married BOOLEAN,
	name VARCHAR(250),
	genre CHAR(1),
	salary NUMERIC(9,2), 
	birth_date DATE, 
	start_at TIME
);
--Verificar si se pueden duplicar datos
INSERT INTO employees (id, married, name, genre, salary, birth_date, start_at) 
VALUES (1,FALSE, 'Juan', 'M', 111.28,'2001-08-10','08:45:10'); --Ni permite duplicado


--NOT NULL -> No permite valores nulos
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY, --Se añade el atributo PRIMARY KEY, en este metodo no puede haber el mismo dato repetido
	married BOOLEAN NOT NULL,
	name VARCHAR(250),
	genre CHAR(1) NOT NULL,
	salary NUMERIC(9,2), 
	birth_date DATE, 
	start_at TIME
);
INSERT INTO employees (married, name, genre, salary, birth_date, start_at) 
VALUES (FALSE, 'Pedrito', 'M', 111.28,'2001-08-10','08:45:10');
INSERT INTO employees (name, genre, salary, birth_date, start_at) 
VALUES ('Juan', 'M', 111.28,'2001-08-10','08:45:10'); --No permite valores nulos	

--UNIQUE -> No permite valores repetidos, propiedad de unicidad
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY,
	married BOOLEAN NOT NULL,
	name VARCHAR(250),
	email VARCHAR(100) UNIQUE,
	genre CHAR(1) NOT NULL,
	salary NUMERIC(9,2), 
	birth_date DATE, 
	start_at TIME
);
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) 
VALUES (FALSE, 'Pedrito','pedrito1@company.com', 'M', 111.28,'2001-08-10','08:45:10');
--Verificamos propiedad de unicidad
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) --ERROR:  llave duplicada viola restricción de unicidad «employees_email_key»
VALUES (FALSE, 'Pedrito','pedrito1@company.com', 'M', 111.28,'2001-08-10','08:45:10');
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) --Query returned successfully  
VALUES (FALSE, 'Pedrito','pedrito2@company.com', 'M', 111.28,'2001-08-10','08:45:10');

--Restricciones en rangos de datos CHECK
CREATE TABLE IF NOT EXISTS employees(
	id SERIAL PRIMARY KEY,
	married BOOLEAN NOT NULL,
	name VARCHAR(250),
	email VARCHAR(100) UNIQUE,
	genre CHAR(1) NOT NULL,
	salary NUMERIC(9,2) CHECK (salary > 0), 
	birth_date DATE CHECK (birth_date >= '1970-01-01'), 
	start_at TIME
);
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) 
VALUES (FALSE, 'Pedrito','pedrito1@company.com', 'M', 111.28,'2001-08-10','08:45:10');
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) --ERROR:  el nuevo registro para la relación «employees» viola la restricción «check» «employees_birth_date_check»
VALUES (FALSE, 'Pedrito','pedrito1@company.com', 'M', 111.28,'1920-08-10','08:45:10');
INSERT INTO employees (married, name, email, genre, salary, birth_date, start_at) --ERROR:  el nuevo registro para la relación «employees» viola la restricción «check» «employees_salary_check»
VALUES (FALSE, 'Pedrito','pedrito1@company.com', 'M', 0,'2001-08-10','08:45:10');


--Borrar tabla si existe
DROP TABLE IF EXISTS employees;

```

```sql
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM film;
```
