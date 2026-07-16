-- created_at: 2026-07-16T02:21:52.608125+00:00
-- finished_at: 2026-07-16T02:21:52.787937+00:00
-- elapsed: 179ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5bccd-3204-3bf7-0008-0f82000450ae
-- desc: execute adapter call
show terse schemas in database analytics
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-16T02:21:52.799269+00:00
-- finished_at: 2026-07-16T02:21:52.935759+00:00
-- elapsed: 136ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c5bccd-3204-3be5-0008-0f820004314a
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-16T02:21:52.939589+00:00
-- finished_at: 2026-07-16T02:21:53.187844+00:00
-- elapsed: 248ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_stripe_payment
-- query_id: 01c5bccd-3204-3bf7-0008-0f82000450b6
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
    
from raw.stripe.payment
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_stripe_payment", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-16T02:21:53.327418+00:00
-- finished_at: 2026-07-16T02:21:53.471978+00:00
-- elapsed: 144ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5bccd-3204-3bf7-0008-0f82000450ba
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-16T02:21:53.346884+00:00
-- finished_at: 2026-07-16T02:21:53.493579+00:00
-- elapsed: 146ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5bccd-3204-3be5-0008-0f8200043152
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-16T02:21:53.474828+00:00
-- finished_at: 2026-07-16T02:21:53.687650+00:00
-- elapsed: 212ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5bccd-3204-3be5-0008-0f820004315a
-- desc: execute adapter call
create or replace   view analytics.dbt_eelikem.stg_jaffle_shop_orders
  
  
  
  
  as (
     select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from raw.jaffle_shop.orders
  )
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-16T02:21:53.495378+00:00
-- finished_at: 2026-07-16T02:21:53.704093+00:00
-- elapsed: 208ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5bccd-3204-3bf7-0008-0f82000450c2
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
-- created_at: 2026-07-16T02:21:53.708700+00:00
-- finished_at: 2026-07-16T02:21:54.497928+00:00
-- elapsed: 789ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.fct_orders
-- query_id: 01c5bccd-3204-3be5-0008-0f820004315e
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
-- created_at: 2026-07-16T02:21:54.510834+00:00
-- finished_at: 2026-07-16T02:21:55.279674+00:00
-- elapsed: 768ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.dim_customers
-- query_id: 01c5bccd-3204-3bf7-0008-0f82000450c6
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
