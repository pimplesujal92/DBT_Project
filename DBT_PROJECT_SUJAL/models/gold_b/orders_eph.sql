{{ config(
    materialized='ephemeral'
   
) }}

select 
    o.order_id,
    o.customer_id,
    o.store_id,
    o.order_date,
    o.order_status,
    o.created_timestamp AS order_created_timestamp,
    o.updated_timestamp AS order_updated_timestamp,
    current_timestamp() AS processed_gold_timestamp,
    o.is_active AS order_is_active  

    from {{ ref('orders_1') }} o