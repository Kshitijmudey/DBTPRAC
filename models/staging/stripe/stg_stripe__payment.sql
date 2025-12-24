select
        id as payment_id,
        orderid as order_id,
        status,
        amount / 100.0 as amount

    from dbtprac.stripe.payment