Recursos 

https://github.com/dhamaniasad/awesome-postgres


COMPLETADO

### EMPLOYEES DATABASE

```sql
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
```


### PAGILA DATABASE

```sql
-- Explorar tablas
SELECT * FROM actor;
SELECT * FROM actor WHERE last_name = 'WAHLBERG';
SELECT * FROM actor WHERE first_name = 'NICK';


SELECT * FROM address;
SELECT * FROM address WHERE district = 'California';
SELECT * FROM address WHERE district = 'California' AND postal_code = '17886';
SELECT * FROM address WHERE district = 'California' AND postal_code = '17886' OR postal_code = '2299';
SELECT * FROM address WHERE postal_code = '17886' OR postal_code = '2299';

SELECT * FROM category;
SELECT * FROM category WHERE name = 'Action';

SELECT * FROM city;
SELECT * FROM city WHERE city = 'Akron';
SELECT * FROM city WHERE city LIKE 'A%';

SELECT * FROM country;
SELECT * FROM country WHERE country = 'Spain';

SELECT * FROM customer;
SELECT * FROM customer WHERE last_name = 'WILLIAMS';
SELECT * FROM customer WHERE activebool = FALSE;
SELECT * FROM customer WHERE activebool = TRUE;

UPDATE customer SET activebool = FALSE WHERE customer_id = 1;
UPDATE customer SET activebool = TRUE WHERE customer_id = 1;

SELECT * FROM film;
SELECT * FROM film WHERE description = 'A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies';
SELECT * FROM film WHERE description LIKE '%Drama%';

SELECT * FROM film_actor;
SELECT * FROM film_actor WHERE film_id = 1;
SELECT * FROM film_actor WHERE actor_id = 1;

SELECT * FROM film_category;

SELECT * FROM inventory;

SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;

-- insertar datos
select * from actor; 

INSERT INTO actor (first_name, last_name) VALUES ('ALAN', 'SASTRE');


select * from customer;
select * from address;
select * from store;

INSERT INTO address (address, district, city_id, postal_code, phone)
VALUES ('Calle falsa', 'Nueva América', 300, '28004', '12334354352');

-- address 606

INSERT INTO customer(store_id, first_name, last_name, email, address_id, activebool, create_date)
VALUES (1, 'CUSTOMER NEW', 'LASTNAME EXAMPLE', 'customernew@company.com', 606, TRUE, '2021-12-1');
```
