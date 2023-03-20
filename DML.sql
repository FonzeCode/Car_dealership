-- ADD ROWS TO EACH TABLE IN DATABASE
-- INCLUDE 2 INSERTS FROM STORED PROCEDURE(S)

SELECT *
FROM customer;
--create procedure to add customers to customer table
CREATE OR REPLACE PROCEDURE add_customer(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), address VARCHAR(50), city VARCHAR(30), state VARCHAR(30))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO customer(first_name, last_name, email, address, city, state)
	VALUES (first_name, last_name, email, address, city, state);
END;
$$;

CALL add_customer(':Luis', 'Echeverria', 'alfonzoe14@hotmail.com', '2034 Keystone rd', 'Los Angeles', 'California'); 
CALL add_customer('Alonso', 'Perez', 'Alonso_22@gmail.com', '334 main street', 'Pasadena', 'California'); 
CALL add_customer('Marcos', 'Rodriguez', 'marcos.r@gmail.com', '2435 Irvine rd', 'Irvine', 'California'); 


--create procedure to add mechanic to mechanic table
SELECT *
FROM mechanic
ORDER BY mechanic_id;

CREATE OR REPLACE PROCEDURE add_mechanic(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), username VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO mechanic(first_name, last_name, email, username)
	VALUES (first_name, last_name, email, username);
END;
$$;

CALL add_mechanic('Pedro', 'Parejo', 'p.parejo@hotmail.com', 'Pedro22');
CALL add_mechanic('Bruno', 'Diaz', 'diaz33@hotmail.com', 'Bruno21');
CALL add_mechanic('Maria', 'Lopez', 'lopezmecanica@gmail.com', 'MariloveMechanic');

--create procedure to add salesman to salesman table
SELECT *
FROM salesperson;

CREATE OR REPLACE PROCEDURE add_salesperson(first_name VARCHAR(20), last_name VARCHAR(20), email VARCHAR(50), username VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO salesperson(first_name, last_name, email, username)
	VALUES (first_name, last_name, email, username);
END;
$$;

CALL add_salesperson('Jose', 'Palacios', 'joseP@hotmail.com', 'Jose22');
CALL add_salesperson('Manuel', 'Gregory', 'manuelg@hotmail.com', 'greg23');
CALL add_salesperson('Julia', 'Bastita', 'Julib@gmail.com', 'Juli24');

-- create procedure for car
SELECT *
FROM car; 

CREATE OR REPLACE PROCEDURE add_car(year_ INTEGER, make VARCHAR(20), model VARCHAR(20), color VARCHAR(20), vehicle_type VARCHAR(20), price NUMERIC(9,2), customer_id INTEGER, salesperson_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(year_, make, model, color, vehicle_type, price, customer_id, salesperson_id)
	VALUES (year_, make, model, color, vehicle_type, price, customer_id, salesperson_id);
END;
$$;

CALL add_car(2023, 'Kia', 'Sportage', 'Black', 'SUV', 40000.00, 1, 3);
CALL add_car(2023, 'Ford', 'Fusion', 'Green', 'Car', 23000.00, 3, 1);
CALL add_car(2023, 'Tesla', 'Model Y', 'Black', 'SUV', 60000.00, 1, 1);


-- create procedure for invoice

SELECT *
FROM invoice;

CREATE OR REPLACE PROCEDURE add_invoice(date_of_purchase TIMESTAMP, price_of_purchase NUMERIC(9,2), customer_id INTEGER, car_id INTEGER, salesperson_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesperson_id)
	VALUES (date_of_purchase, price_of_purchase, customer_id, car_id, salesperson_id);
END;
$$;

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesperson_id)
VALUES (NOW(), 40000.00, 1, 3, 2);

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesperson_id)
VALUES (NOW(), 23000.00, 3, 2, 1);

INSERT INTO invoice(date_of_purchase, price_of_purchase, customer_id, car_id, salesperson_id)
VALUES (NOW(), 60000.00, 2, 1, 3);


-- create procedure for service ticket

SELECT *
FROM service_ticket;


	INSERT INTO service_ticket(date_of_service, service_description, customer_id, car_id, mechanic_id, service_cost)
	VALUES (NOW(), 'oil change', 2, 1, 2, 75.00);

	INSERT INTO service_ticket(date_of_service, service_description, customer_id, car_id, mechanic_id, service_cost)
	VALUES (NOW(), 'oil change, new tires, air filter', 1, 3, 1, 3500.00);

