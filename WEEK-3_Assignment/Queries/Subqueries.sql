SELECT
    `Order ID` AS order_id,
    `Customer Name` AS customer_name,
    Sales AS sales
FROM superstore_raw
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM superstore_raw
)
ORDER BY Sales DESC;

SHOW COLUMNS FROM superstore_raw;

SELECT VERSION();

SELECT
    s.`Customer ID` AS customer_id,
    s.`Customer Name` AS customer_name,
    s.`Order ID` AS order_id,
    s.Sales AS sales
FROM superstore_raw s
JOIN (
    SELECT
        `Customer ID`,
        MAX(Sales) AS max_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
) m
ON s.`Customer ID` = m.`Customer ID`
AND s.Sales = m.max_sales
ORDER BY s.Sales DESC;

SELECT
    `Customer ID` AS customer_id,
    SUM(Sales) AS total_sales
FROM superstore_raw
GROUP BY `Customer ID`
HAVING SUM(Sales) >
(
    SELECT AVG(CustomerSales)
    FROM
    (
        SELECT SUM(Sales) AS CustomerSales
        FROM superstore_raw
        GROUP BY `Customer ID`
    ) A
);
