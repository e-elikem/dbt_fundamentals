
select 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, so we need to divide by 100 to get dollars
    amount/100 as amount,
    created as created_at
    -- _batched_at
    
from {{source('stripe', 'payment')}}