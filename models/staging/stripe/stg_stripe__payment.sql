with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        id as customer_id,
        orderid,
        paymentmethod,
        status,
        amount,
        created,
        _batched_at

    from source

)

select * from renamed