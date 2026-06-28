WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS TotalSales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT *
FROM CustomerSales
ORDER BY TotalSales DESC
LIMIT 10;

WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT *
FROM CustomerSales
ORDER BY total_sales ASC
LIMIT 10;

SELECT
    `Customer ID` AS customer_id,
    COUNT(DISTINCT `Order ID`) AS total_orders

FROM superstore_raw

GROUP BY `Customer ID`

HAVING COUNT(DISTINCT `Order ID`) = 1;

WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT *
FROM CustomerSales

WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM CustomerSales
);

WITH RegionCustomer AS
(
    SELECT

        Region AS region,
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales,

        RANK() OVER
        (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS rank_no

    FROM superstore_raw

    GROUP BY Region, `Customer ID`
)

SELECT *

FROM RegionCustomer

WHERE rank_no = 1;

SELECT *

FROM

(
    SELECT

        `Customer ID` AS customer_id,
        `Customer Name` AS customer_name,
        `Order ID` AS order_id,
        Sales AS sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY `Customer ID`
            ORDER BY Sales DESC
        ) AS rn

    FROM superstore_raw

) X

WHERE rn = 1;

