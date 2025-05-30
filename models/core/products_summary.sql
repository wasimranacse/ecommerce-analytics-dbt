-- Aggregation or Analytics layer
with base as (
    select
        product_title,
        category,
        sum(items_sold) as total_items_sold,
        sum(net_revenue) as total_net_revenue,
        sum(orders) as total_orders
    from {{ ref('stg_products') }}
    group by
        product_title,
        category
)

select
    product_title,
    category,
    total_items_sold,
    total_net_revenue,
    total_orders
from base
