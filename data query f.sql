CREATE TABLE customers ( 
customer_id INT NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,   
email VARCHAR(100) NOT NULL,
 address VARCHAR(200) NOT NULL );

CREATE TABLE products (
    product_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- insert elements
-- Insert rows into the products table
INSERT INTO products (product_id, name, price)
VALUES
(1, 'Product A', 10.99),
(2, 'Product B', 5.99),
(3, 'Product C', 15.99);

-- Insert rows into the customers table
INSERT INTO customers (customer_id, name, email, address)
VALUES
(1, 'John Doe', 'johndoe@example.com', '123 Main St'),
(2, 'Jane Smith', 'janesmith@example.com', '456 Broadway');

-- Insert rows into the orders table
INSERT INTO orders (order_id, customer_id, product_id, quantity, order_date)
VALUES
(1, 1, 1, 2, '2022-01-01'),
(2, 1, 2, 1, '2022-01-02'),
(3, 2, 3, 3, '2022-01-03');

-- affichage
select * from customers;
select * from products;
select * from orders;

-- Give the list of producers:
SELECT * FROM Producer;
-- Give the list of producers sorted by name:
SELECT * FROM Producer ORDER BY FirstName;
-- Give the list of producers in Sousse:
SELECT * FROM Producer WHERE Region = 'Sousse';
-- Calculate the total quantity of wine produced having the number 12:
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE WineNumber = 12;
-- Calculate the quantity of wine produced by category:
SELECT Category, SUM(Quantity) AS TotalQuantity
FROM Wine
JOIN Harvest ON Wine.WineNumber = Harvest.WineNumber
GROUP BY Category;
-- Producers in the Sousse region who have harvested at least 
-- one wine in quantities greater than 300 liters, sorted alphabetically:
SELECT FirstName, LastName
FROM Producer
JOIN Wine ON Producer.ProducerID = Wine.ProducerID
JOIN Harvest ON Wine.WineNumber = Harvest.WineNumber
WHERE Region = 'Sousse' AND Quantity > 300
GROUP BY FirstName, LastName
ORDER BY LastName, FirstName;
-- List the wine numbers that have a degree greater than 
-- 12 and have been produced by producer number 24:
SELECT WineNumber
FROM Wine
WHERE Degree > 12 AND ProducerID = 24;
