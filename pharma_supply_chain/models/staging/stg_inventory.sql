{{ config(materialized='view') }}

select
    inventory_id,
    product_id,
    warehouse_id,
    quantity_available
from {{ source('pharma_raw', 'inventory') }}
