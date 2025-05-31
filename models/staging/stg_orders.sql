-- models/staging/stg_orders.sql

WITH source AS (
    SELECT * FROM {{ source('raw_schema', 'orders_report') }}
),

cleaned AS (
    SELECT
        CAST(order_id AS INTEGER) AS order_id,
        CAST(net_sales AS FLOAT) AS net_sales,
        lower(status) AS status,
        customer AS customer_name,
        customer_type,
        "DATE" AS order_date,
        row_number() OVER (PARTITION BY order_id ORDER BY DATE DESC) AS row_num
    FROM source
    WHERE order_id IS NOT NULL
)
SELECT * FROM cleaned
WHERE row_num = 1
