CREATE TABLE customersf ( 
customer_id INT NOT NULL PRIMARY KEY,
c_name VARCHAR(50) NOT NULL,   
customer_tel VARCHAR(100) NOT NULL,
);
-- insert elements
-- Insert rows into the customers table
INSERT INTO customersf (customer_id, c_name, customer_tel)
VALUES
(1, 'John Doe',  '6216222'),
(2, 'Jane Smith', '92162221'),
(3, 'Jack Bruno',  '5216222'),
(4, 'Filipe Alice', '82162221');
select * from customersf;

 
CREATE TABLE productsf (
    product_id INT NOT NULL PRIMARY KEY,
    p_name VARCHAR(50) NOT NULL,
	category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);
-- Insert rows into the products table
INSERT INTO productsf (product_id, p_name, category, price)
VALUES
(8, 'casque', 'doohickeys', 10.00),
(7, 'Product G', 'widget', 10.00),
(1, 'Product A', 'widget', 10.00),
(2, 'Product B', 'widget', 5.00),	
(3, 'Product C', 'widget', 15.00),
(4, 'Product D', 'gadget', 10.00),
(5, 'Product E', 'gadget', 5.00),	
(6, 'Product F', 'gadget', 15.00);
select * from productsf;


CREATE TABLE ordersf (

    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,  -- 'aaaa-mm-jj'
	-- order_date VARCHAR(10) NOT NULL, 'lundi', 'mardi',...,'dimanche'
	total_amount INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customersf(customer_id),
    FOREIGN KEY (product_id) REFERENCES productsf(product_id)
);
-- Insert rows into the orders table
INSERT INTO ordersf ( customer_id, product_id, quantity, order_date, total_amount)
VALUES
(2, 1, 2,'2028-01-01',10),
(2, 8, 2,'2022-01-01',10),
(2, 8, 2,'2022-01-01',10),
(2, 8, 2,'2022-01-01',10),
(2, 8, 2,'2022-01-01',10),
(1, 1, 2,'2022-01-01',10),
(1, 1, 2, '2022-01-01',10),
(1, 2, 1, '2022-01-02',15),
(2, 3, 3, '2022-01-03',17),
(1, 6, 2, '2022-01-01',10);

select * from ordersf;





-- question 1
-- Écrivez une requête SQL pour récupérer les noms des clients
-- qui ont commandé au moins un widget et au moins un gadget,
-- ainsi que le coût total des widgets et gadgets commandés par 
-- chaque client. Le coût de chaque article doit être calculé en
--multipliant la quantité par le prix du produit.
SELECT  c.c_name, SUM(o.quantity * p.price) AS total_cost
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
JOIN productsf p ON o.product_id = p.product_id
WHERE p.category= 'widget' OR p.category='gadget' 
-- WHERE p.category in ('widget','gadget')
GROUP by c.c_name
Having COUNT(DISTINCT p.category) = 2;
select * from ordersf;
select * from customersf;
select * from productsf;


-- question 2
-- Écrivez une requête pour récupérer les noms des clients qui ont commandé 
--au moins un widget, ainsi que le coût total des widgets commandés par
-- chaque client.
SELECT c.c_name, SUM(o.quantity * p.price) AS total_cost
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
JOIN productsf p ON o.product_id = p.product_id
 WHERE p.category ='widget'
GROUP BY c.c_name;
select * from ordersf;
select customer_id, c_name from customersf;
select * from productsf where category ='widget';
-- question 3
-- Rédigez une requête pour récupérer les noms des clients
-- qui ont passé une commande pour au moins un gadget, 
--ainsi que le coût total des gadgets commandés par chaque client.
SELECT c.c_name, SUM(o.quantity * p.price) AS total_cost
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
JOIN productsf p ON o.product_id = p.product_id
WHERE p.category = 'gadget'
GROUP BY c.c_name;
select * from ordersf;
select * from customersf;
select * from productsf where category ='gadget';


-- question 4
-- Écrivez une requête pour récupérer les noms des 
--clients qui ont commandé au moins un doohickey,
--ainsi que le coût total des doohickeys commandés par chaque client.
SELECT c.c_name, SUM(o.quantity * p.price) AS total_cost
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
JOIN productsf p ON o.product_id = p.product_id
WHERE p.category = 'doohickeys'
GROUP BY c.c_name;
select * from productsf;
select * from ordersf;
select * from customersf;


-- question 5
-- Rédigez une requête pour récupérer le nombre total 
-- de widgets et de gadgets
-- commandés par chaque client, ainsi que le coût total des commandes.
SELECT c.c_name, SUM(CASE WHEN p.category = 'widget' THEN o.quantity ELSE 0 END) AS total_widgets,
       SUM(CASE WHEN p.category = 'gadget' THEN o.quantity ELSE 0 END) AS total_gadgets,
       SUM(o.quantity * p.price) AS total_cost
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
JOIN productsf p ON o.product_id = p.product_id
GROUP BY c.c_name;

-- question 6
-- Écrivez une requête pour récupérer les noms des produits qui ont été
--commandés par au moins un client, 
--ainsi que la quantité totale de chaque produit commandé.
SELECT p.p_name, SUM(o.quantity) AS total_quantity
FROM productsf p
JOIN ordersf o ON p.product_id = o.product_id
GROUP BY p.p_name;


-- question 7
-- Rédigez une requête pour récupérer les noms des clients qui ont passé
-- le plus de commandes, ainsi que le nombre total de commandes passées
-- par chaque client.
select * from ordersf;
select * from customersf;
SELECT TOP 5 WITH TIES c.c_name, COUNT(*) AS total_orders
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
GROUP BY c.c_name
ORDER BY COUNT(*) DESC;
select * from ordersf;
select * from productsf;
select * from customersf;
-- question 8
-- Rédigez une requête pour récupérer les noms des produits les plus
-- commandés, ainsi que la quantité totale de chaque produit commandé.
SELECT TOP 5 WITH TIES p.p_name, SUM(o.quantity) AS total_quantity
FROM productsf p
JOIN ordersf o ON p.product_id = o.product_id
GROUP BY p.p_name
ORDER BY SUM(o.quantity) DESC;


-- question 9'
-- Écrivez une requête pour récupérer les noms des clients qui ont passé une
-- commande durant la semaine , ainsi que le nombre total de commandes 
-- passées par chaque client.
SELECT c.c_name AS customer_name,
       COUNT(*) AS total_orders
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-12-28' AND o.order_date < '2025-01-04'
GROUP BY c.customer_id, c.c_name;
select order_date from ordersf;
-- question 9
-- Écrivez une requête pour récupérer les noms des clients qui ont passé une
-- commande chaque jour de la semaine ( on a choisi les 7 premiers jours de juin 2023) , ainsi que le nombre total de commandes 
-- passées par chaque client.
-- il faut ajouter 7 lignes à la table orderf de 01/06/2023 à 07/06/2023
SELECT c.c_name AS customer_name,
       COUNT(*) AS total_orders
FROM customersf c
JOIN ordersf o ON c.customer_id = o.customer_id
WHERE o.order_date in ('2023-06-01', '2023-06-02','2023-06-03','2023-06-04','2023-06-05','2023-06-06','2023-06-07')
GROUP BY c.customer_id, c.c_name
HAVING COUNT(DISTINCT o.order_date)=7;
