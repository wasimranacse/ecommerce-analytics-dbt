-- models/staging/stg_customers.sql

SELECT
    customer AS customer_name,
    customer_type,
    MIN(DATE)::DATE AS first_order_date
FROM {{ source('raw_schema', 'orders_report') }}
GROUP BY
    customer,
    customer_type


