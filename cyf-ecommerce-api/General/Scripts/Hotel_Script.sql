drop table customers;
drop table hotels;
drop table bookings;


create TABLE IF NOT EXISTS customers (
	id		  SERIAL PRIMARY KEY,
	name 	  VARCHAR(30) NOT NULL,
	email	  VARCHAR(120) NOT NULL,
	address   VARCHAR(120),
	city      VARCHAR(30),
	postcode  VARCHAR(12),
    country   VARCHAR(20)
);



create TABLE IF NOT EXISTS hotels (
	id		      SERIAL PRIMARY KEY,
	name 	      VARCHAR(60) NOT NULL,
	rooms         INT NOT NULL,
	postcode	  VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS bookings (
  id               SERIAL PRIMARY KEY,
  customer_id      INT REFERENCES customers(id),
  hotel_id         INT REFERENCES hotels(id),
  checkin_date     DATE NOT NULL,
  nights           INT NOT NULL
);

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Manpreet Singh','mann@gmail.com','Gracia','Barcelona','08012','Spain');


INSERT INTO hotels (name, rooms, postcode) VALUES ('Triple Point Hotel', 10, 'CM194JS');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Royal Cosmos Hotel', 5, 'TR209AX');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Pacific Petal Motel', 15, 'BN180TG');



INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 2, '2020-10-01', 5);


SELECT * FROM customers;
SELECT * FROM hotels;
SELECT * FROM bookings;

select name,address from customers;
select * from hotels where rooms > 7;
select name,address from customers where id = 1;
SELECT * FROM bookings WHERE checkin_date > '2019/10/01' AND nights >= 2;
SELECT * FROM hotels WHERE postcode = 'CM194JS' OR postcode = 'TR209AX';




