with orders as (

    select
        order_id,
        customer_id
    from {{ ref('stg_jaffle_shop__orders') }}

),

payments as (

    select
        order_id,
        amount
    from {{ ref('stg_stripe__payment') }}
    where status = 'success'

)

select
    o.order_id,
    o.customer_id,
    p.amount
from orders o
left join payments p
    on o.order_id = p.order_id