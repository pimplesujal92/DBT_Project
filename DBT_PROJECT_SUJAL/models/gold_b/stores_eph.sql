{{ config(
    materialized='ephemeral'
   
) }}

select
    s.store_id AS store_store_id,
    s.store_name,
    s.city AS store_city,
    s.province AS store_province,
    s.country AS store_country,
    s.created_timestamp AS store_created_timestamp,
    s.updated_timestamp AS store_updated_timestamp,
    current_timestamp() AS processed_gold_timestamp,
    s.is_active AS store_is_active
from {{ ref('stores') }} s