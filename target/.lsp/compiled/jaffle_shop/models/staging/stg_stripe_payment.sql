with payment as (
    select * from raw.stripe.payment
)
select * from payment