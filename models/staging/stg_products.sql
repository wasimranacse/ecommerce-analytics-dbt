-- models/staging/stg_products.sql

WITH base AS (
    SELECT
        CAST(product_title AS STRING) AS product_title,
        CAST(category AS STRING) AS category,
        CAST(items_sold AS NUMBER) AS items_sold,
        CAST(net_revenue AS NUMBER) AS net_revenue,
        CAST(orders AS NUMBER) AS orders,
        CAST(variations AS NUMBER) AS variations

    FROM {{ source('raw_schema', 'products_report') }}
),

deduplicated AS (
    SELECT *,
        row_number() OVER (PARTITION BY items_sold ORDER BY net_revenue DESC) AS row_num
    FROM base
)

SELECT *
FROM deduplicated
WHERE row_num = 1
