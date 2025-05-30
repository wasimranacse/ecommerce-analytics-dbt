-- models/staging/stg_orders.sql

with source as (

    select * from {{ source('raw_schema', 'orders_report') }}

),

cleaned as (

    select
        cast(order_id as integer) as order_id,
        cast(net_sales as float) as net_sales,
        lower(status) as status,
        customer as customer_name,
        customer_type,
        date::date as order_date,
        row_number() over (partition by order_id order by date desc) as row_num
    from source
    where order_id is not null
)
select * from cleaned
where row_num = 1
