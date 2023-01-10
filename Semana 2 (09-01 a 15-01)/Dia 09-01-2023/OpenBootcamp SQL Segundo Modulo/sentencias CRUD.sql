-- Sentencias DML: Data Manipulation Lenguage

-- 1. Consultas o recuperación de datos || SELECT

SELECT * FROM employees;

SELECT id, name, salary FROM employees;

SELECT name, id, married, salary FROM employees;

--Filtrar filas
SELECT id, name, salary FROM employees WHERE id = 1;

SELECT id, name, salary FROM employees WHERE id = 1 AND salary >100;

SELECT id, name, email, salary FROM employees WHERE id = 1 OR name = 'Pedrito';


--2. Insertar datos || INSERT INTO

INSERT INTO employees(name, married, email, genre)--Puede poner solo las columnas que te interesan insertar
VALUES ('Pimpi', FALSE, 'pimpi@casarenteria.com', 'M');--Si las columnas no aceptan valores nulos debes de ponerlos si o si

INSERT INTO employees(genre,name, email,married) --Las columnas no deben llevar el mismo orden que en la tabla
VALUES ('M', 'Toño','toño@casarenteria.com', FALSE); --Per los datos si el orden de las columnas en la consulta

INSERT INTO employees(name,email,married,salary,genre,start_at,birth_date)
VALUES ('Nayo','nayo@casarenteria', TRUE, 8500, 'M', '08:00:00', '1998-05-11');

INSERT INTO employees --Al no poner las columnas se quiere decir que vas a insertar todos los datos pero se tiene que esepcificar la PRIMARY KEY
VALUES (7,TRUE,'Mono', 'monito@casarenteria.com','M',8200,'1998-02-14','08:00:00');


--3. Actualizar o editar datos || UPDATE
UPDATE employees SET genre = 'M'; --Si no espeficas en donde se va a hacer el cambio, el cambio se aplica a toda la tabla

UPDATE employees SET genre = 'F', salary = 12000, birth_date = '1994-04-25' WHERE id = 5;

UPDATE employees SET genre = 'M', start_at = '08:00:00' WHERE email = 'toño@casarenteria.com';

UPDATE employees SET salary = 9500, birth_date = '1999-08-15', start_at = '08:00:00' WHERE id = 15;

UPDATE employees SET salary = 9500, birth_date = '1999-08-15', start_at = '08:00:00' WHERE id = 4 RETURNING *;

--4.- Borrar registros
SELECT * FROM employees;

DELETE * FROM employees; --Si no espeficas en donde se va a hacer el cambio, el cambio se aplica a toda la tabla

DELETE FROM employees WHERE married = FALSE;

DELETE FROM employees WHERE salary > 8200;

DELETE FROM employees WHERE salary IS NULL;
