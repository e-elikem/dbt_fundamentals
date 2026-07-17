-- created_at: 2026-07-17T00:16:06.146057+00:00
-- finished_at: 2026-07-17T00:16:06.330037+00:00
-- elapsed: 183ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5c1f0-3204-3c8b-0008-0f820004d06e
-- desc: execute adapter call
show terse schemas in database analytics
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:06.378572+00:00
-- finished_at: 2026-07-17T00:16:06.523738+00:00
-- elapsed: 145ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.test
-- query_id: 01c5c1f0-3204-3c8b-0008-0f820004d076
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-17T00:16:06.526658+00:00
-- finished_at: 2026-07-17T00:16:06.808813+00:00
-- elapsed: 282ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.test
-- query_id: 01c5c1f0-3204-3a9a-0008-0f820004c05a
-- desc: execute adapter call
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
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.test", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.144865+00:00
-- finished_at: 2026-07-17T00:16:07.563519+00:00
-- elapsed: 418ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.source_not_null_jaffle_shop_customers_id.50aa22178f
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e006
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id
from raw.jaffle_shop.customers
where id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.source_not_null_jaffle_shop_customers_id.50aa22178f", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.658227+00:00
-- finished_at: 2026-07-17T00:16:07.776014+00:00
-- elapsed: 117ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.source_unique_jaffle_shop_customers_id.2777a7933e
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e00a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id as unique_field,
    count(*) as n_records

from raw.jaffle_shop.customers
where id is not null
group by id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.source_unique_jaffle_shop_customers_id.2777a7933e", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.659702+00:00
-- finished_at: 2026-07-17T00:16:07.793935+00:00
-- elapsed: 134ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c5c1f0-3204-3a9a-0008-0f820004c05e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-17T00:16:07.664301+00:00
-- finished_at: 2026-07-17T00:16:07.828045+00:00
-- elapsed: 163ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e00e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-17T00:16:07.781167+00:00
-- finished_at: 2026-07-17T00:16:07.983919+00:00
-- elapsed: 202ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5c1f0-3204-3a9a-0008-0f820004c066
-- desc: execute adapter call
create or replace   view analytics.dbt_eelikem.stg_jaffle_shop_customers
  
  
  
  
  as (
    select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_customers", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.797145+00:00
-- finished_at: 2026-07-17T00:16:08.012557+00:00
-- elapsed: 215ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c5c1f0-3204-3c8b-0008-0f820004d07e
-- desc: execute adapter call
create or replace   view analytics.dbt_eelikem.stg_stripe_payment
  
  
  
  
  as (
    
select 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    -- amount is stored in cents, so we need to divide by 100 to get dollars
    amount/100 as amount,
    created as created_at
    -- _batched_at
    
from raw.stripe.payment
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_stripe_payment", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.831254+00:00
-- finished_at: 2026-07-17T00:16:08.026298+00:00
-- elapsed: 195ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5c1f0-3204-3a9a-0008-0f820004c06a
-- desc: execute adapter call
create or replace   view analytics.dbt_eelikem.stg_jaffle_shop_orders
  
  
  
  
  as (
     select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at

    from raw.jaffle_shop.orders
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:08.033214+00:00
-- finished_at: 2026-07-17T00:16:08.624565+00:00
-- elapsed: 591ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop_orders_order_id.489806f7af
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e022
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select order_id
from analytics.dbt_eelikem.stg_jaffle_shop_orders
where order_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop_orders_order_id.489806f7af", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.993732+00:00
-- finished_at: 2026-07-17T00:16:08.626416+00:00
-- elapsed: 632ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.not_null_stg_jaffle_shop_customers_customer_id.1828149cc2
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e016
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select customer_id
from analytics.dbt_eelikem.stg_jaffle_shop_customers
where customer_id is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.not_null_stg_jaffle_shop_customers_customer_id.1828149cc2", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:08.033680+00:00
-- finished_at: 2026-07-17T00:16:08.655151+00:00
-- elapsed: 621ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.accepted_values_stg_jaffle_shop_orders_status__placed__shipped__completed__returned__return_pending.5fb55a5c94
-- query_id: 01c5c1f0-3204-3a9a-0008-0f820004c06e
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

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
    'placed','shipped','completed','returned','return_pending'
)



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.accepted_values_stg_jaffle_shop_orders_status__placed__shipped__completed__returned__return_pending.5fb55a5c94", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:07.993641+00:00
-- finished_at: 2026-07-17T00:16:08.674531+00:00
-- elapsed: 680ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop_customers_customer_id.b9becc3999
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e01a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from analytics.dbt_eelikem.stg_jaffle_shop_customers
where customer_id is not null
group by customer_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop_customers_customer_id.b9becc3999", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:08.021492+00:00
-- finished_at: 2026-07-17T00:16:08.687534+00:00
-- elapsed: 666ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.assert_stg_stripe_payment_total_positive
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e01e
-- desc: execute adapter call
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
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.assert_stg_stripe_payment_total_positive", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:08.613789+00:00
-- finished_at: 2026-07-17T00:16:08.865466+00:00
-- elapsed: 251ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.relationships_stg_jaffle_shop_orders_customer_id__customer_id__ref_stg_jaffle_shop_customers_.9f2d6690ef
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e026
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select customer_id as from_field
    from analytics.dbt_eelikem.stg_jaffle_shop_orders
    where customer_id is not null
),

parent as (
    select customer_id as to_field
    from analytics.dbt_eelikem.stg_jaffle_shop_customers
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.relationships_stg_jaffle_shop_orders_customer_id__customer_id__ref_stg_jaffle_shop_customers_.9f2d6690ef", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:09.336517+00:00
-- finished_at: 2026-07-17T00:16:09.501832+00:00
-- elapsed: 165ms
-- outcome: success
-- dialect: snowflake
-- node_id: test.jaffle_shop.unique_stg_jaffle_shop_orders_order_id.50aa8222ac
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e02a
-- desc: execute adapter call
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    order_id as unique_field,
    count(*) as n_records

from analytics.dbt_eelikem.stg_jaffle_shop_orders
where order_id is not null
group by order_id
having count(*) > 1



  
  
      
    ) dbt_internal_test
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "test.jaffle_shop.unique_stg_jaffle_shop_orders_order_id.50aa8222ac", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:09.509555+00:00
-- finished_at: 2026-07-17T00:16:10.272289+00:00
-- elapsed: 762ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.fct_orders
-- query_id: 01c5c1f0-3204-3cc6-0008-0f820004e02e
-- desc: execute adapter call
create or replace transient  table analytics.dbt_eelikem.fct_orders
    
    
    
    
    as (with payments as (

    select * from analytics.dbt_eelikem.stg_stripe_payment

), 

orders as (

    select * from analytics.dbt_eelikem.stg_jaffle_shop_orders

),

order_payment as (

    select
        order_id,
        sum(
            case
                when status = 'success' then amount
            end
        ) as amount
    from payments
    group by 1

),

final as (

    select
        orders.order_id,
        orders.customer_id,
        orders.order_date,
        coalesce(order_payment.amount, 0) as amount
    
    from orders
    left join order_payment using (order_id)
    
)    

select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.fct_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-17T00:16:10.283562+00:00
-- finished_at: 2026-07-17T00:16:11.138583+00:00
-- elapsed: 855ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.dim_customers
-- query_id: 01c5c1f0-3204-3c8b-0008-0f820004d082
-- desc: execute adapter call
create or replace transient  table analytics.dbt_eelikem.dim_customers
    
    
    
    
    as (with customers as (

    -- use ref macro to reference the staging model for customers
    select * from analytics.dbt_eelikem.stg_jaffle_shop_customers

),

orders as (

    -- use ref macro to reference the staging model for orders
    select * from analytics.dbt_eelikem.fct_orders

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(amount) as lifetime_value

    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders,
        customer_orders.lifetime_value

    from customers

    left join customer_orders using (customer_id)
    

)

select * from final

    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.dim_customers", "profile_name": "default", "target_name": "dev"} */;
