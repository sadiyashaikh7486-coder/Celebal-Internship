-- Q24. Write a query using CASE to classify products
-- into price tiers:
-- Budget    -> unit_price < 1000
-- Mid-Range -> unit_price BETWEEN 1000 AND 3000
-- Premium   -> unit_price > 3000

SELECT product_name,
       unit_price,
       CASE
           WHEN unit_price < 1000 THEN 'Budget'
           WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
           ELSE 'Premium'
       END AS price_tier
FROM products;


-- Q25. Using a CASE statement inside an aggregate
-- function, count how many orders are 'Delivered'
-- vs 'Not Delivered' (all other statuses).
-- Display the result in a single row.

SELECT
    SUM(CASE
            WHEN status = 'Delivered' THEN 1
            ELSE 0
        END) AS delivered_orders,

    SUM(CASE
            WHEN status <> 'Delivered' THEN 1
            ELSE 0
        END) AS not_delivered_orders
FROM orders;


-- Q26. Explain each letter of ACID.

-- A - Atomicity
-- Ensures that all operations in a transaction
-- are completed successfully or none are executed.

-- C - Consistency
-- Ensures data remains valid before and after
-- a transaction.

-- I - Isolation
-- Ensures transactions do not interfere with
-- each other when executed simultaneously.

-- D - Durability
-- Ensures committed data is permanently saved
-- even if a system failure occurs.

-- Example: Bank Transfer
-- If ₹1000 is transferred from Account A to Account B:
--
-- Atomicity: Either both debit and credit happen,
--             or neither happens.
--
-- Consistency: Total money remains unchanged.
--
-- Isolation: Other users cannot see partial updates.
--
-- Durability: Once committed, the transfer remains
--             saved even after a power failure.


-- Q27. Write a SQL transaction that:
-- 1. Inserts a new order
-- 2. Inserts two order items
-- 3. Updates stock quantities
-- 4. Rolls back if any step fails

START TRANSACTION;

-- Insert new order

INSERT INTO orders
(order_id, customer_id, order_date, status, total_amount)
VALUES
(1011, 102, CURDATE(), 'Pending', 1598.00);

-- Insert first order item

INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5016, 1011, 202, 1, 799.00, 0);

-- Insert second order item

INSERT INTO order_items
(item_id, order_id, product_id, quantity, unit_price, discount_pct)
VALUES
(5017, 1011, 208, 1, 599.00, 0);

-- Update stock for first product

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 202;

-- Update stock for second product

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;

-- If any statement fails before COMMIT,
-- execute:

-- ROLLBACK;