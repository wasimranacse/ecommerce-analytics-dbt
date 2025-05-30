with base as (
    select
        cast(product_title as string) as product_title,
        cast(category as string) as category,
        cast(items_sold as number) as items_sold,
        cast(net_revenue as number) as net_revenue,
        cast(orders as number) as orders,
        cast(variations as number) as variations

    from {{ source('raw_schema', 'products_report') }}
),

deduplicated as (
    select *,
        row_number() over (partition by items_sold order by net_revenue desc) as row_num
    from base
)

select *
from deduplicated
where row_num = 1
