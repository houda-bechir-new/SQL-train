
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
