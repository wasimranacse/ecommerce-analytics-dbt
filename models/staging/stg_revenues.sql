-- models/staging/stg_revenue.sql

WITH source AS (
    SELECT * FROM {{ source('raw_schema', 'revenues_report') }}
),

renamed AS (
    SELECT
    CAST(date AS date) AS revenue_date,
    CAST(orders AS INTEGER) AS orders,
    CAST(gross_sales AS NUMERIC(12, 2)) AS gross_sales,
    CAST(returns AS NUMERIC(12, 2)) AS returns,
    CAST(coupons AS NUMERIC(12, 2)) AS coupons,
    COALESCE(TRY_CAST(net_sales AS NUMERIC(12, 2)), 0.00) AS net_sales,
    CAST(taxes AS NUMERIC(12, 2)) AS taxes,
    CAST(shipping AS NUMERIC(12, 2)) AS shipping,
    COALESCE(TRY_CAST(total_sales AS NUMERIC(12, 2)), 0.00) AS total_sales
FROM source
)

SELECT * FROM renamed