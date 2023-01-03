
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

--Borrar tabla si existe
DROP TABLE IF EXISTS employees;