-- created_at: 2026-07-15T22:38:05.989365+00:00
-- finished_at: 2026-07-15T22:38:06.477512+00:00
-- elapsed: 488ms
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5bbee-3204-3be5-0008-0f8200043082
-- desc: execute adapter call
show terse schemas in database analytics
    limit 10000
/* {"app": "dbt", "connection_name": "", "dbt_version": "2.0.0", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-15T22:38:06.486921+00:00
-- finished_at: 2026-07-15T22:38:06.699950+00:00
-- elapsed: 213ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5bbee-3204-3bf7-0008-0f8200044072
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-15T22:38:06.702972+00:00
-- finished_at: 2026-07-15T22:38:06.821523+00:00
-- elapsed: 118ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5bbee-3204-3be5-0008-0f820004308a
-- desc: execute adapter call
drop table if exists "ANALYTICS"."DBT_EELIKEM"."STG_JAFFLE_SHOP_ORDERS" cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_orders", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-15T22:38:06.823276+00:00
-- finished_at: 2026-07-15T22:38:07.088390+00:00
-- elapsed: 265ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_orders
-- query_id: 01c5bbee-3204-3bf7-0008-0f820004407a
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
-- created_at: 2026-07-15T22:38:07.038645+00:00
-- finished_at: 2026-07-15T22:38:07.180007+00:00
-- elapsed: 141ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5bbee-3204-3bf7-0008-0f820004407e
-- desc: get_relation > list_relations call
SHOW OBJECTS IN SCHEMA "ANALYTICS"."DBT_EELIKEM" LIMIT 10000;
-- created_at: 2026-07-15T22:38:07.182373+00:00
-- finished_at: 2026-07-15T22:38:07.316674+00:00
-- elapsed: 134ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5bbee-3204-3bf7-0008-0f8200044086
-- desc: execute adapter call
drop table if exists "ANALYTICS"."DBT_EELIKEM"."STG_JAFFLE_SHOP_CUSTOMERS" cascade
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.stg_jaffle_shop_customers", "profile_name": "default", "target_name": "dev"} */;
-- created_at: 2026-07-15T22:38:07.319985+00:00
-- finished_at: 2026-07-15T22:38:07.533578+00:00
-- elapsed: 213ms
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.stg_jaffle_shop_customers
-- query_id: 01c5bbee-3204-3be5-0008-0f820004308e
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
-- created_at: 2026-07-15T22:38:07.553672+00:00
-- finished_at: 2026-07-15T22:38:08.756824+00:00
-- elapsed: 1.2s
-- outcome: success
-- dialect: snowflake
-- node_id: model.jaffle_shop.dim_customers
-- query_id: 01c5bbee-3204-3be5-0008-0f8200043092
-- desc: execute adapter call
create or replace transient  table analytics.dbt_eelikem.dim_customers
    
    
    
    
    as (with customers as (

    -- use ref macro to reference the staging model for customers
    select * from analytics.dbt_eelikem.stg_jaffle_shop_customers

),

orders as (

    -- use ref macro to reference the staging model for orders
    select * from analytics.dbt_eelikem.stg_jaffle_shop_orders

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

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
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final
    )

/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "model.jaffle_shop.dim_customers", "profile_name": "default", "target_name": "dev"} */;
