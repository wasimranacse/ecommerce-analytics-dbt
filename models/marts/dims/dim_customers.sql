-- models/marts/dims/dim_customers.sql

SELECT
    customer_name,
    customer_type,
    first_order_date
FROM {{ ref('stg_customers') }}

