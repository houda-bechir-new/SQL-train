CREATE TABLE customer1 (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  customer_tel VARCHAR(20)
);

CREATE TABLE product1 (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(50),
  price DECIMAL(10, 2)
);

CREATE TABLE orders1 (
  order_id INT PRIMARY KEY,
  customer_id INT,
  product_id INT,
  order_date DATE,
  quantity INT,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customer1(customer_id),
  FOREIGN KEY (product_id) REFERENCES product1(product_id)
);

-- Inserting sample data into the customer1 table
INSERT INTO customer1 (customer_id, customer_name, customer_tel)
VALUES (1, 'John Smith', '1234567890'),
       (2, 'Jane Doe', '9876543210'),
       (3, 'Michael Johnson', '5555555555');

-- Inserting sample data into the product1 table
INSERT INTO product1 (product_id, product_name, category, price)
VALUES (1, 'Widget A', 'widget', 10.99),
       (2, 'Widget B', 'widget', 8.99),
       (3, 'Gadget X', 'gadget', 19.99),
       (4, 'Gadget Y', 'gadget', 15.99),
       (5, 'Doohickey 1', 'doohickey', 5.99);

-- Inserting sample data into the orders1 table
INSERT INTO orders1 (order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES (1, 1, 1, '2023-06-01', 2, 21.98),
       (2, 1, 3, '2023-06-02', 1, 19.99),
       (3, 2, 1, '2023-06-02', 3, 32.97),
       (4, 2, 2, '2023-06-03', 2, 17.98),
       (5, 3, 3, '2023-06-03', 1, 19.99),
       (6, 3, 4, '2023-06-03', 3, 47.97),
       (7, 3, 5, '2023-06-04', 2, 11.98),
       (8, 3, 1, '2023-06-04', 1, 10.99);
