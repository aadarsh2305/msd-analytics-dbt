
{{ config(materialized='table') }}

select
    inventory_id,
    product_id,
    warehouse_id,
    quantity_available
from {{ ref('stg_inventory') }}
