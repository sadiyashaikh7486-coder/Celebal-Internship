
WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales,
        SUM(Profit) AS total_profit,
        COUNT(DISTINCT `Order ID`) AS total_orders
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT *
FROM CustomerSales
ORDER BY total_sales DESC;

WITH RegionSales AS
(
    SELECT
        Region AS region,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY Region
)

SELECT *
FROM RegionSales
ORDER BY total_sales DESC;
