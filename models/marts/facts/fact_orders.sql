-- models/marts/facts/fact_orders.sql

-- models/marts/facts/fact_orders.sql

SELECT
    order_id,
    order_date,
    customer_name,
    customer_type,
    net_sales
FROM {{ ref('stg_orders') }}
WHERE status = 'completed'
