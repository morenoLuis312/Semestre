CREATE TABLE IF NOT EXISTS manufacturer(
	id SERIAL,
	name VARCHAR(50),
	num_employees INT,
	constraint pk_manufacturer PRIMARY KEY(id)
);

SELECT * FROM manufacturer;

INSERT INTO manufacturer (name, num_employees)
VALUES ('Toyota', 58000);

INSERT INTO manufacturer (name, num_employees)
VALUES ('Kia', 41000);

CREATE TABLE IF NOT EXISTS model(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	id_manufacturer INT NOT NULL,
	constraint pk_model PRIMARY KEY(id),
	constraint fk_model_manufacturer FOREIGN KEY(id_manufacturer) REFERENCES manufacturer(id) 
);

SELECT * FROM model;

INSERT INTO model (name, id_manufacturer)
VALUES ('Forte', 2);

INSERT INTO model (name, id_manufacturer)
VALUES ('Rio', 2);

INSERT INTO model (name, id_manufacturer)
VALUES ('Yaris', 1);

INSERT INTO model (name, id_manufacturer)
VALUES ('Corolla', 1);

CREATE TABLE version(
 	id SERIAL,
	name VARCHAR(50) NOT NULL,
	engine VARCHAR(50),
	price NUMERIC,
	cc NUMERIC(2,1),
	id_model INT,
	CONSTRAINT pk_version PRIMARY KEY(id),
	CONSTRAINT fk_version_model FOREIGN KEY(id_model) REFERENCES model(id) ON UPDATE set null ON DELETE set null
);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Basic', 'Diesel 4C',350000,1.4,2);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Medium', 'Diesel 5C',400000,1.6,2);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Advance', 'Diesel 6C',450000,2.0,2);


SELECT * FROM version;

SELECT * FROM model;


INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Basic', 'Gasolina 4C',450000,1.4,1);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport', 'Gasolina 5C',470000,1.8,1);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport Advance', 'Gasolina 6C',500000,2.4,1);



--Corolla id model 10
INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport', 'Gasolina 6C',520000,2.0,4);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport Adavance', 'Gasolina 8C',550000,2.4,4);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Hybrid', 'Gasolina 4C and Battery',600000,2.0,4);

CREATE TABLE IF NOT EXISTS extra(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(300),
	CONSTRAINT pk_extra PRIMARY KEY(id)
);

CREATE TABLE extra_version(
	id_version INT,
	id_extra INT,
	price NUMERIC NOT NULL CHECK (price>=0), 
	CONSTRAINT pk_extra_version PRIMARY KEY(id_version, id_extra),
	CONSTRAINT fk_version_extra FOREIGN KEY(id_version) REFERENCES version(id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_extra_version FOREIGN KEY(id_extra) REFERENCES extra(id) ON UPDATE cascade ON DELETE cascade
);

INSERT INTO extra(name, description)
VALUES ('Techo desplegable', 'Lorem impsum dolor...');

INSERT INTO extra(name, description)
VALUES ('Climatizador', 'Lorem impsum dolor...');

INSERT INTO extra(name, description)
VALUES ('WiFi', 'Lorem impsum dolor...');

INSERT INTO extra(name, description)
VALUES ('Morrita chida', 'Lorem impsum dolor...');

SELECT * FROM extra;
SELECT * FROM model;
SELECT * FROM version;
SELECT * FROM extra_version;
--Kia Rio Advance con climatizador	
INSERT INTO extra_version VALUES (3, 2, 8000);
--Kia Rio Advance con Morrita chida	
INSERT INTO extra_version VALUES (3, 4, 12000);
--Kia Rio Advance con Techo desplegable 
INSERT INTO extra_version VALUES (3, 1, 10000);
--Kia Rio Advance con WiFi 
INSERT INTO extra_version VALUES (3, 3, 11000);

--Toyota Corolla Hybrid con climatizador	
INSERT INTO extra_version VALUES (9, 2, 10000);
--Toyota Corolla Hybrid con Morrita chida	
INSERT INTO extra_version VALUES (9, 4, 17000);
--Toyota Corolla Hybrid con Techo desplegable 
INSERT INTO extra_version VALUES (9, 1, 12000);
--Toyota Corolla Hybrid con WiFi 
INSERT INTO extra_version VALUES (9, 3, 14000);

CREATE TABLE IF NOT EXISTS employees(
	id SERIAL,
	name VARCHAR(50),
	nif VARCHAR(9) NOT NULL UNIQUE,
	phone VARCHAR(9),
	CONSTRAINT pk_employees PRIMARY KEY(id)
);

INSERT INTO employees(name, nif, phone) VALUES ('juanito', '123456789','312174370');
INSERT INTO employees(name, nif, phone) VALUES ('pedrito', '987654321','312658794');
INSERT INTO employees(name, nif, phone) VALUES ('panchito', '231564789','312174370');
INSERT INTO employees(name, nif, phone) VALUES ('carla moreno', '252414363','312451781');

CREATE TABLE IF NOT EXISTS customer(
	id SERIAL,
	name VARCHAR(30),
	email VARCHAR(50) NOT NULL UNIQUE,
	CONSTRAINT pk_customer PRIMARY KEY(id)
);

INSERT INTO customer (name, email) VALUES ('luismi', 'luismi@ibm.com');
INSERT INTO customer (name, email) VALUES ('gabito', 'gabito@ibm.com');


CREATE TABLE IF NOT EXISTS vehicle(
	id SERIAL,
	licens_num VARCHAR(7),
	creation_date DATE,
	price_gross NUMERIC,
	price_net NUMERIC,
	type VARCHAR(30),
	id_model INT,
	id_version INT,
	id_extra INT,
	CONSTRAINT pk_vehicle PRIMARY KEY(id),
	CONSTRAINT fk_vehicle_model FOREIGN KEY(id_model) REFERENCES model(id),
	CONSTRAINT fk_vehicle_extra_version FOREIGN KEY(id_version,id_extra) REFERENCES extra_version(id_version,id_extra)		
);
SELECT * FROM extra_version;
SELECT * FROM model;
INSERT INTO vehicle (licens_num, creation_date, price_net, type, id_model, id_version, id_extra)
VALUES ('4512783', '24-01-2023', 740000, 'sedan',4,9,4);

INSERT INTO vehicle (licens_num, creation_date, price_net, type, id_model, id_version, id_extra)
VALUES ('4796341', '21-01-2023', 740000, 'sedan',2,3,1);

SELECT * FROM customer;

CREATE TABLE IF NOT EXISTS sale(
	id SERIAL,
	sale_date DATE,
	description_sale VARCHAR(300),
	id_vehicle INT,
	id_employee INT,
	id_customer INT,
	CONSTRAINT pk_sale PRIMARY KEY(id),
	CONSTRAINT fk_sale_vehicle FOREIGN KEY(id_vehicle) REFERENCES vehicle(id),
	CONSTRAINT fk_sale_employee FOREIGN KEY(id_employee) REFERENCES employees(id)	
);

INSERT INTO sale (sale_date, description_sale, id_vehicle, id_employee, id_customer)
VALUES ('24-01-2023', 'Todo salio correctamente', 1, 4,1)

INSERT INTO sale (sale_date, description_sale, id_vehicle, id_employee, id_customer)
VALUES ('23-01-2023', 'Faltaron papeles y se tardó la compra', 2, 3,2)




