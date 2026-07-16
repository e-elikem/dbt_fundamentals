-- created_at: 2026-07-16T20:50:51.586679+00:00
-- finished_at: 2026-07-16T20:50:52.915615+00:00
-- elapsed: 1.3s
-- outcome: success
-- dialect: snowflake
-- node_id: not available
-- query_id: 01c5c122-3204-3a9a-0008-0f820004c026
-- desc: Extracting freshness from information schema
SELECT
                table_schema,
                table_name,
                last_altered,
                (table_type = 'VIEW' OR table_type = 'MATERIALIZED VIEW') AS is_view
             FROM "RAW".INFORMATION_SCHEMA.TABLES
             WHERE table_schema = 'STRIPE' and table_name = 'PAYMENT';
-- created_at: 2026-07-16T20:50:52.925276+00:00
-- finished_at: 2026-07-16T20:50:53.097536+00:00
-- elapsed: 172ms
-- outcome: success
-- dialect: snowflake
-- node_id: source.jaffle_shop.jaffle_shop.orders
-- query_id: 01c5c122-3204-3a9a-0008-0f820004c02a
-- desc: execute adapter call
select
      max(_etl_loaded_at) as max_loaded_at,
      convert_timezone('UTC', current_timestamp()) as snapshotted_at
    from raw.jaffle_shop.orders
/* {"app": "dbt", "dbt_version": "2.0.0", "node_id": "source.jaffle_shop.jaffle_shop.orders", "profile_name": "default", "target_name": "dev"} */;
