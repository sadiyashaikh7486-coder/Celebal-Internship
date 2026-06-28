CREATE DATABASE superstore_db;
USE superstore_db;

SELECT COUNT(*) FROM superstore_raw;

CREATE TABLE customers AS
SELECT DISTINCT
    `Customer ID` AS customer_id,
    `Customer Name` AS customer_name,
    Segment AS segment,
    Country AS country,
    City AS city,
    State AS state,
    `Postal Code` AS postal_code,
    Region AS region
FROM superstore_raw;

CREATE TABLE orders AS
SELECT DISTINCT
    `Order ID` AS order_id,
    `Order Date` AS order_date,
    `Ship Date` AS ship_date,
    `Ship Mode` AS ship_mode,
    `Customer ID` AS customer_id
FROM superstore_raw;

CREATE TABLE products AS
SELECT DISTINCT
    `Product ID` AS product_id,
    Category AS category,
    `Sub-Category` AS sub_category,
    `Product Name` AS product_name
FROM superstore_raw;

SELECT * FROM customers LIMIT 10;

SELECT * FROM orders LIMIT 10;

SELECT * FROM products LIMIT 10;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT COUNT(*) AS total_products FROM products;
