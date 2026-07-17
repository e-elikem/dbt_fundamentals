
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- This singular test ensures that the total amount for each order in the stg_stripe_payment table is positive

select
    order_id,
    sum(amount) as total_amount
from analytics.dbt_eelikem.stg_stripe_payment
group by 1
having total_amount < 0
  
  
      
    ) dbt_internal_test