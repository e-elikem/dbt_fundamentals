-- created_at: 2026-07-16T19:31:11.875492+00:00
-- finished_at: 2026-07-16T19:31:12.241034+00:00
-- elapsed: 365ms
-- outcome: success
-- dialect: snowflake
-- node_id: source.jaffle_shop.jaffle_shop.orders
-- query_id: 01c5c0d3-3204-3a9a-0008-0f820004c01a
-- desc: execute adapter call
select
      max(_etl_loaded_at) as max_loaded_at,
      convert_timezone('UTC', current_timestamp()) as snapshotted_at
    from raw.jaffle_shop.orders
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "source.jaffle_shop.jaffle_shop.orders", "profile_name": "default", "target_name": "dev"} */;
