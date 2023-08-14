
select * from cars;
select * from person;
select * from models;
select * from acquisitions;
select * from CONTRACTofSALE; 
-- question 1
select * from CONTRACTofSALE;
-- question 2
SELECT * FROM CARS ORDER BY requested_price ASC;
-- question 3
SELECT * FROM CARS WHERE Mileage > 100000;
-- question 4
SELECT * FROM CARS WHERE requested_price BETWEEN 7500 AND 15000;
-- question 5
SELECT * FROM CARS
INNER JOIN models ON CARS.model_id = models.model_id
WHERE models.Brand IN ('Peugeot', 'Fiat');
-- question 6 
SELECT UPPER(last_name) AS last_name, LOWER(first_name) AS first_name FROM person;
-- question 7
SELECT SUM(Mileage) AS total_mileage FROM CARS;
