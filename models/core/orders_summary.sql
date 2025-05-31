-- Aggregation / Analytics layer

WITH base AS (
    SELECT
        order_date,
        status,
        customer_type,
        net_sales
    FROM {{ ref('stg_orders') }}
    WHERE ROW_NUM = 1  -- If you use ROW_NUM to filter duplicates
)

SELECT
    order_date,
    status,
    customer_type,
    COUNT(*) AS total_orders,
    SUM(net_sales) AS total_net_sales,
    AVG(net_sales) AS avg_net_sales_per_order
FROM base
GROUP BY 1, 2, 3
ORDER BY order_date DESC, status, customer_type
