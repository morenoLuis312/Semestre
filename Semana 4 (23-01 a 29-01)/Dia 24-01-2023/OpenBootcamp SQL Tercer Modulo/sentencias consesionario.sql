CREATE TABLE IF NOT EXISTS manufacture(
	id SERIAL,
	name VARCHAR(50),
	num_employees INT,
	constraint pk_manufacture PRIMARY KEY(id)
);

SELECT * FROM manufacture;

INSERT INTO manufacture (name, num_employees)
VALUES ('Toyota', 58000);

INSERT INTO manufacture (name, num_employees)
VALUES ('Kia', 41000);

CREATE TABLE IF NOT EXISTS model(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	id_manufacture INT NOT NULL,
	constraint pk_model PRIMARY KEY(id),
	constraint fk_model_manufacture FOREIGN KEY(id_manufacture) REFERENCES manufacture(id) 
);

SELECT * FROM model;

INSERT INTO model (name, id_manufacture)
VALUES ('Forte', 2)

INSERT INTO model (name, id_manufacture)
VALUES ('Rio', 2)

INSERT INTO model (name, id_manufacture)
VALUES ('Yaris', 1)

INSERT INTO model (name, id_manufacture)
VALUES ('Corolla', 1)

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


SELECT * FROM version

SELECT * FROM model


INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Basic', 'Gasolina 4C',450000,1.4,1);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport', 'Gasolina 5C',470000,1.8,1);

INSERT INTO version (name, engine, price, cc, id_model)
VALUES ('Sport Advance', 'Gasolina 6C',500000,2.4,1);

CREATE TABLE IF NOT EXISTS extra(
	id SERIAL,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(300),
	CONSTRAINT pk_extra PRIMARY KEY(id)
);

CREATE TABLE extra_version(
	id_version INT,
	id_extra INT,
	CONSTRAINT pk_extra_version PRIMARY KEY(id_version, id_extra),
	CONSTRAINT fk_version_extra FOREIGN KEY(id_version) REFERENCES version(id) ON UPDATE cascade ON DELETE cascade,
	CONSTRAINT fk_extra_version FOREIGN KEY(id_extra) REFERENCES extra(id) ON UPDATE cascade ON DELETE cascade
);






