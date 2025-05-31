-- Aggregation / Analytics layer

WITH base AS (
    SELECT
        product_title,
        category,
        sum(items_sold) AS total_items_sold,
        sum(net_revenue) AS total_net_revenue,
        sum(orders) AS total_orders
    FROM {{ ref('stg_products') }}
    GROUP BY
        product_title,
        category
)

SELECT
    product_title,
    category,
    total_items_sold,
    total_net_revenue,
    total_orders
FROM base


