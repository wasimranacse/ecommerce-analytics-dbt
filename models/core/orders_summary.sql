-- Aggregation or Analytics layer

WITH base AS (
    SELECT
        ORDER_DATE,
        STATUS,
        CUSTOMER_TYPE,
        NET_SALES
    FROM {{ ref('stg_orders') }}
    WHERE ROW_NUM = 1  -- If you use ROW_NUM to filter duplicates
)

SELECT
    ORDER_DATE,
    STATUS,
    CUSTOMER_TYPE,
    COUNT(*) AS total_orders,
    SUM(NET_SALES) AS total_net_sales,
    AVG(NET_SALES) AS avg_net_sales_per_order
FROM base
GROUP BY 1, 2, 3
ORDER BY ORDER_DATE DESC, STATUS, CUSTOMER_TYPE
