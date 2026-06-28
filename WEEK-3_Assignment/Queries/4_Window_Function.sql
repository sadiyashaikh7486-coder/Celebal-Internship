 
SELECT
    `Customer ID` AS customer_id,
    `Order ID` AS order_id,
    Sales AS sales,

    ROW_NUMBER() OVER
    (
        PARTITION BY `Customer ID`
        ORDER BY Sales DESC
    ) AS row_no

FROM superstore_raw; 

WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT
    customer_id,
    total_sales,

    RANK() OVER
    (
        ORDER BY total_sales DESC
    ) AS sales_rank

FROM CustomerSales;

SELECT VERSION();

SELECT @@sql_mode;

WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)
SELECT
    customer_id,
    total_sales,
    DENSE_RANK() OVER (ORDER BY total_sales DESC) AS customer_rank
FROM CustomerSales;

