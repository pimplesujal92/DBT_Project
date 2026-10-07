{{ config(
    materialized = 'incremental',
    unique_key = 'order_id',
    schema = generate_schema_name('silver_t')
) }}

select *,
     current_timestamp() as processed_at
       
from {{ source('DBT_sujal', 'orders_1') }}

{% if is_incremental() %}

    where updated_timestamp > (select(coalesce(max(updated_timestamp), '1999-01-01')) from {{ this }})

{% endif %}



