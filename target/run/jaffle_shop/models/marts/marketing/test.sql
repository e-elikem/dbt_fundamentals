
  create or replace   view analytics.dbt_eelikem.test
  
  
  
  
  as (
    

select 

    sum(
        lifetime_value
        )

from dim_customers
  );

