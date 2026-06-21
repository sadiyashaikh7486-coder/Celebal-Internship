-- Q1. Display all columns and rows from the customers table.

SELECT *
FROM customers;


-- Q2. Retrieve only the first_name, last_name, and city of all customers.

SELECT first_name,
       last_name,
       city
FROM customers;


-- Q3. List all unique categories available in the products table.

SELECT DISTINCT category
FROM products;


-- Q4. Identify the Primary Key of each table.

-- customers     -> customer_id
-- products      -> product_id
-- orders        -> order_id
-- order_items   -> item_id

-- Explanation:
-- A Primary Key must be UNIQUE and NOT NULL because
-- it uniquely identifies each record in a table and
-- prevents duplicate entries.


-- Q5. What constraints are applied to the email column
-- in the customers table?

-- Constraints:
-- 1. UNIQUE
-- 2. NOT NULL

-- Example (will generate an error because email already exists):

INSERT INTO customers
VALUES (
109,
'Test',
'User',
'aarav.s@email.com',
'Nagpur',
'Maharashtra',
'2024-09-01',
FALSE
);

-- Explanation:
-- The query will fail because the email column has a
-- UNIQUE constraint and duplicate email values are not allowed.


-- Q6. Try inserting a product with unit_price = -50.

INSERT INTO products
VALUES (
209,
'Test Product',
'Electronics',
'TestBrand',
-50,
100
);

-- Explanation:
-- The query will fail because of the CHECK constraint:
-- CHECK (unit_price > 0)
-- Product prices cannot be negative.