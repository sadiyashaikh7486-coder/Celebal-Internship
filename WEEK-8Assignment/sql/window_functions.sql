SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(oi.quantity * oi.unit_price),2) AS lifetime_value,
    RANK() OVER(
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS customer_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id,c.name;

SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(oi.quantity * oi.unit_price),2) AS lifetime_value,
    DENSE_RANK() OVER(
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS dense_rank
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id,c.name;

SELECT
    month,
    revenue,
    SUM(revenue) OVER(
        ORDER BY month
    ) AS running_total
FROM
(
    SELECT
        strftime('%Y-%m',o.order_date) AS month,
        ROUND(SUM(oi.quantity*oi.unit_price),2) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id=oi.order_id
    GROUP BY month
);

SELECT
    month,
    revenue,
    ROUND(
        AVG(revenue) OVER(
            ORDER BY month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ),
        2
    ) AS moving_average
FROM
(
    SELECT
        strftime('%Y-%m',o.order_date) AS month,
        ROUND(SUM(oi.quantity*oi.unit_price),2) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id=oi.order_id
    GROUP BY month
);

WITH monthly_revenue AS
(
    SELECT
        strftime('%Y-%m',o.order_date) AS month,
        ROUND(SUM(oi.quantity*oi.unit_price),2) AS revenue
    FROM orders o
    JOIN order_items oi
    ON o.order_id=oi.order_id
    GROUP BY month
)

SELECT *
FROM monthly_revenue
ORDER BY month;