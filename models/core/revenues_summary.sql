-- Aggregation / Analytics layer

WITH revenue AS (

    SELECT
        revenue_date,
        SUM(orders) AS total_orders,
        SUM(gross_sales) AS total_gross_sales,
        SUM(returns) AS total_returns,
        SUM(coupons) AS total_coupons,
        SUM(net_sales) AS total_net_sales,
        SUM(taxes) AS total_taxes,
        SUM(shipping) AS total_shipping,
        SUM(total_sales) AS total_sales
    FROM {{ ref('stg_revenues') }}
    GROUP BY revenue_date

)

SELECT * FROM revenue
ORDER BY revenue_date
