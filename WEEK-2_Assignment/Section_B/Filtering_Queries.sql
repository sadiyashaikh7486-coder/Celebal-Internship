-- Q7. Retrieve all orders with status = 'Delivered'.

SELECT *
FROM orders
WHERE status = 'Delivered';


-- Q8. Find all products in the 'Electronics' category
-- with a unit_price greater than ₹2000.

SELECT *
FROM products
WHERE category = 'Electronics'
  AND unit_price > 2000;


-- Q9. List all customers who joined in the year 2024
-- and belong to the state 'Maharashtra'.

SELECT *
FROM customers
WHERE join_date BETWEEN '2024-01-01' AND '2024-12-31'
  AND state = 'Maharashtra';


-- Q10. Find all orders placed between
-- '2024-08-10' and '2024-08-25' (inclusive)
-- that are NOT cancelled.

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
  AND status <> 'Cancelled';


-- Q11. Explain what the index idx_orders_date does.
-- How would it improve performance?
-- Write a sample query that would benefit from it.

-- Explanation:
-- idx_orders_date is an index on the order_date column.
-- It helps MySQL locate rows faster when filtering,
-- sorting, or searching using order_date instead of
-- scanning the entire table.

-- Sample query using the index:

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-01' AND '2024-08-31';


-- Q12. If you run:
-- SELECT * FROM customers WHERE YEAR(join_date) = 2024;
-- would the index on join_date be used?

-- Explanation:
-- No. Applying YEAR() on the column prevents MySQL
-- from efficiently using an index because the function
-- must be calculated for every row.

-- Non-SARGable Query:

SELECT *
FROM customers
WHERE YEAR(join_date) = 2024;

-- Index-Friendly (SARGable) Query:

SELECT *
FROM customers
WHERE join_date >= '2024-01-01'
  AND join_date < '2025-01-01';