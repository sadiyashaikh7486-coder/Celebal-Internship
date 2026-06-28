WITH CustomerSales AS
(
    SELECT
        `Customer ID` AS customer_id,
        SUM(Sales) AS total_sales
    FROM superstore_raw
    GROUP BY `Customer ID`
)

SELECT

    c.customer_name,
    c.region,
    c.segment,
    cs.total_sales,

    RANK() OVER
    (
        ORDER BY cs.total_sales DESC
    ) AS customer_rank

FROM CustomerSales cs

JOIN customers c

ON cs.customer_id = c.customer_id

ORDER BY customer_rank;

