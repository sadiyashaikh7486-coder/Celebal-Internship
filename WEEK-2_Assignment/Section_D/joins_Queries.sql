-- Q19. Write an INNER JOIN query to display each order
-- along with the customer's first_name and last_name.
-- Show: order_id, order_date, first_name,
-- last_name, total_amount.

SELECT o.order_id,
       o.order_date,
       c.first_name,
       c.last_name,
       o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


-- Q20. Using a LEFT JOIN, list ALL customers and their
-- orders (if any). Customers with no orders should
-- still appear with NULL values for order columns.

SELECT c.customer_id,
       c.first_name,
       c.last_name,
       o.order_id,
       o.order_date,
       o.status,
       o.total_amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- Q21. Write a query using JOINs across three tables
-- (orders → order_items → products)
-- Show: order_id, product_name, quantity,
-- unit_price, and discount_pct for each order item.

SELECT o.order_id,
       p.product_name,
       oi.quantity,
       oi.unit_price,
       oi.discount_pct
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;


-- Q22. Explain the difference between LEFT JOIN
-- and RIGHT JOIN with an example from this schema.

-- LEFT JOIN:
-- Returns all records from the left table and
-- matching records from the right table.
-- If no match exists, NULL values are returned.

SELECT c.customer_id,
       c.first_name,
       o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- RIGHT JOIN:
-- Returns all records from the right table and
-- matching records from the left table.
-- If no match exists, NULL values are returned.

SELECT c.customer_id,
       c.first_name,
       o.order_id
FROM customers c
RIGHT JOIN orders o
ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN:
-- Returns all records from both tables,
-- whether a match exists or not.
-- Used when we want complete data from both tables.

-- Note:
-- MySQL does not directly support FULL OUTER JOIN.


-- Q23. Identify all Foreign Key relationships
-- in the schema. Explain what happens if an order
-- is inserted with customer_id = 999.

-- Foreign Key Relationships:

-- orders.customer_id
-- REFERENCES customers.customer_id

-- order_items.order_id
-- REFERENCES orders.order_id

-- order_items.product_id
-- REFERENCES products.product_id

-- Example:

INSERT INTO orders
VALUES (
1011,
999,
'2024-09-01',
'Pending',
1500.00
);

-- Explanation:
-- This query will fail because customer_id = 999
-- does not exist in the customers table.
-- The Foreign Key constraint prevents invalid
-- references and maintains referential integrity.