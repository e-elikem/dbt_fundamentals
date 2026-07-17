
  create or replace   view analytics.dbt_eelikem.test
  
  
  
  
  as (
    with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from analytics.dbt_eelikem.stg_jaffle_shop_orders
    group by status

)

select *
from all_values
where value_field not in (
    'placed','shipped','completed','returned'
)
  );

