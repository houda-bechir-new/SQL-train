SELECT c.customer_name, SUM(o.quantity * p.price) AS total_cost
FROM customer1 c
JOIN orders1 o ON c.customer_id = o.customer_id
JOIN product1 p ON o.product_id = p.product_id
WHERE p.category = 'widget'
GROUP BY c.customer_name;