-- CAR DEALERSHIP -- DDL

--CREATE TABLES FROM ERD 

--create customer table

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL,
	city VARCHAR(30) NOT  NULL,
	state VARCHAR(30) NOT NULL
);


SELECT * 
FROM customer;

--create salesperson table

CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL,
	username VARCHAR(20) NOT NULL
);

SELECT *
FROM salesperson;

--create mechanic table

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(50) NOT NULL,
	username VARCHAR(20) NOT NULL
);

SELECT *
FROM mechanic;

--create car table

CREATE TABLE car (
	car_id SERIAL PRIMARY KEY,
	year_ INTEGER NOT NULL,
	make VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	color VARCHAR(20),
	vehicle_type VARCHAR(20),
	price NUMERIC(9,2) NOT NULL,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	salesperson_id INTEGER,
	FOREIGN KEY (salesperson_id) REFERENCES "salesperson"	(salesperson_id)
);

SELECT *
FROM car;


--create invoice table

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	date_of_purchase TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	price_of_purchase NUMERIC(9,2),
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	car_id INTEGER,
	FOREIGN KEY (car_id) REFERENCES "car" (car_id),
	salesperson_id INTEGER,
	FOREIGN KEY (salesperson_id) REFERENCES "salesperson" (salesperson_id)
);

SELECT *
FROM invoice;


-- create service ticket table

CREATE TABLE service_ticket (
	service_ticket_id SERIAL PRIMARY KEY,
	date_of_service TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	service_description TEXT,
	customer_id INTEGER,
	FOREIGN KEY (customer_id) REFERENCES "customer" (customer_id),
	car_id INTEGER,
	FOREIGN KEY (car_id) REFERENCES "car" (car_id),
	mechanic_id INTEGER,
	FOREIGN KEY (mechanic_id) REFERENCES "mechanic"	(mechanic_id)
);

SELECT *
FROM service_ticket;


-- add column to service ticket to store cost of service done

ALTER TABLE service_ticket 
ADD COLUMN service_cost NUMERIC(7,2);


