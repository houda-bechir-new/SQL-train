-- creation des tables:
CREATE TABLE person (
    Person_id INT PRIMARY KEY,
    last_name VARCHAR(20),
    first_name VARCHAR(20),
    Email VARCHAR(20) UNIQUE,
    Phone_number INT UNIQUE
);

CREATE TABLE models (
    model_id VARCHAR(20) PRIMARY KEY,
    model VARCHAR(20),
    Brand VARCHAR(20),
    Power1 VARCHAR(20) 
);

ALTER TABLE models
ADD CONSTRAINT ch_puiss CHECK (Power1 IN ('4CH', '5CH', '6CH')); 

CREATE TABLE CARS (
    Registration_id VARCHAR(20) PRIMARY KEY,
    model_id VARCHAR(20),
    dateofcirculation DATE NOT NULL,
    Mileage INT,
    requested_price INT NOT NULL,
    CONSTRAINT fk_CARS FOREIGN KEY (model_id) REFERENCES models (model_id)
);

CREATE TABLE acquisitions (
    Registration_id VARCHAR(20),
    Person_id INT,
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk1_acq FOREIGN KEY (Registration_id) REFERENCES CARS (Registration_id),
    CONSTRAINT fk2_acq FOREIGN KEY (Person_id) REFERENCES person (Person_id),
    CONSTRAINT pk_acq PRIMARY KEY (Registration_id, Person_id)
);

CREATE TABLE CONTRACTofSALE (
    contract_id VARCHAR(20),
    Person_id INT,
    Registration_id VARCHAR(20),
    date_sale DATE DEFAULT GETDATE(),
    price_sale INT NOT NULL,
    CONSTRAINT fk_contrat FOREIGN KEY (Registration_id, Person_id) REFERENCES acquisitions (Registration_id, Person_id),
    CONSTRAINT pk_contrat PRIMARY KEY (contract_id, Registration_id, Person_id)
);


-- Insert into models table
INSERT INTO models (model_id, model, Brand, Power1) VALUES ('RC', 'Clio', 'Renault', '5CH');
INSERT INTO models (model_id, model, Brand, Power1) VALUES ('PCC', '206cc', 'Peugeot', '5CH');
INSERT INTO models (model_id, model, Brand, Power1) VALUES ('FPE', 'Punto Evo', 'Fiat', '4CH');
INSERT INTO models (model_id, model, Brand, Power1) VALUES ('FF', 'Fiesta', 'Ford', '6CH');

-- Insert into CARS table
INSERT INTO CARS (Registration_id, model_id, dateofcirculation, Mileage, requested_price) VALUES ('1245Tunis99', 'RC', '2001-02-14', 155000, 10200);
INSERT INTO CARS (Registration_id, model_id, dateofcirculation, Mileage, requested_price) VALUES ('264Tunis142', 'FF', '2010-02-11', 75000, 19500);
INSERT INTO CARS (Registration_id, model_id, dateofcirculation, Mileage, requested_price) VALUES ('569Tunis122', 'PCC', '2005-10-02', 85250, 15200);
INSERT INTO CARS (Registration_id, model_id, dateofcirculation, Mileage, requested_price) VALUES ('1713Tunis154', 'FPE', '2012-10-10', 106000, 21000);

-- Insert into person table
INSERT INTO person (Person_id, last_name, first_name, Email, Phone_number) VALUES (3645148, 'Masmoudi', 'Ahmed', 'masm@gmail.com', 70983123);
INSERT INTO person (Person_id, last_name, first_name, Email) VALUES (7498662, 'Ayadi', 'Omar', 'ayad@gmail.com');
INSERT INTO person  VALUES (07, 'ben chaben', 'maryem', 'maryem@gmail.com',2222);
INSERT INTO person (Person_id, last_name, first_name, Email, Phone_number) VALUES (6784512, 'Bali', 'Imen', 'bali@gmail.com', 72145870);
INSERT INTO person (Person_id, last_name, first_name, Email, Phone_number) VALUES (4456641, 'Salhi', 'Ali', 'salh@gmail.com', 70983145);

-- Insert into acquisitions table
INSERT INTO acquisitions (Registration_id, Person_id, start_date, end_date) VALUES ('1245Tunis99', 3645148, '2007-06-20', '2010-09-17');
INSERT INTO acquisitions (Registration_id, Person_id, start_date, end_date) VALUES ('264Tunis142', 3645148, '2012-01-11', '2052-01-11');
INSERT INTO acquisitions (Registration_id, Person_id, start_date, end_date) VALUES ('1713Tunis154', 4456641, '2014-01-03', '2015-01-02');
INSERT INTO acquisitions (Registration_id, Person_id, start_date) VALUES ('1245Tunis99', 7498662, '2010-09-18');

-- Insert into CONTRACTofSALE table
INSERT INTO CONTRACTofSALE (contract_id, Person_id, Registration_id, date_sale, price_sale) VALUES ('C100', 3645148, '1245Tunis99', '2007-06-20', 9600);
INSERT INTO CONTRACTofSALE (contract_id, Person_id, Registration_id, price_sale) VALUES ('C101', 3645148, '264Tunis142', 19000);
INSERT INTO CONTRACTofSALE (contract_id, Person_id, Registration_id, price_sale) VALUES ('C102', 4456641, '1713Tunis154', 20800);
INSERT INTO CONTRACTofSALE (contract_id, Person_id, Registration_id, date_sale, price_sale) VALUES ('C103', 7498662, '1245Tunis99', '2010-09-18', 8500);

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
