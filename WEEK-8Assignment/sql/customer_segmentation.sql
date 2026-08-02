SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    CASE
        WHEN COUNT(order_id)=1 THEN 'One-Time'
        WHEN COUNT(order_id) BETWEEN 2 AND 5 THEN 'Occasional'
        ELSE 'Loyal'
    END AS customer_segment
FROM orders
GROUP BY customer_id;

SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(oi.quantity*oi.unit_price),2) AS total_spend,

    CASE
        WHEN SUM(oi.quantity*oi.unit_price)<5000 THEN 'Low'
        WHEN SUM(oi.quantity*oi.unit_price)<20000 THEN 'Medium'
        ELSE 'High'
    END AS spend_tier

FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id

JOIN order_items oi
ON o.order_id=oi.order_id

GROUP BY c.customer_id,c.name;

SELECT
    c.customer_id,
    c.name,

    MAX(o.order_date) AS last_purchase,

    COUNT(o.order_id) AS frequency,

    ROUND(
        SUM(oi.quantity*oi.unit_price),
        2
    ) AS monetary

FROM customers c

JOIN orders o
ON c.customer_id=o.customer_id

JOIN order_items oi
ON o.order_id=oi.order_id

GROUP BY c.customer_id,c.name;

