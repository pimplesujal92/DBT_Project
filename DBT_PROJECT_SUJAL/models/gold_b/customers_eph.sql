{{ config(
    materialized='ephemeral'
   
) }}

select
  c.customer_id AS customer_customer_id,
  c.first_name,
  c.last_name,
  c.email,
  c.phone,
  c.city AS customer_city,
  c.province AS customer_province,
  c.country AS customer_country,
  c.created_timestamp AS customer_created_timestamp,
  c.updated_timestamp AS customer_updated_timestamp,
  current_timestamp() AS processed_gold_timestamp,
  c.is_active AS customer_is_active
from {{ ref('customers_1') }} c