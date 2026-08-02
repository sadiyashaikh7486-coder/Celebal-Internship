WITH first_purchase AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    strftime('%Y-%m', first_order_date) AS cohort_month
FROM first_purchase
ORDER BY cohort_month;

SELECT
    CASE
        WHEN COUNT(order_id) = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS total_customers
FROM orders
GROUP BY customer_id;

WITH customer_orders AS (
    SELECT
        customer_id,
        strftime('%Y-%m', order_date) AS order_month
    FROM orders
)

SELECT
    order_month,
    COUNT(DISTINCT customer_id) AS active_customers
FROM customer_orders
GROUP BY order_month
ORDER BY order_month;

