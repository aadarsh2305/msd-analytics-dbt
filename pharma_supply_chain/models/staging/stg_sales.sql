{{ config(materialized='view') }}

select
    sale_id,
    product_id,
    quantity_sold,
    try_to_date(sale_date::varchar) as sale_date
from {{ source('pharma_raw', 'sales') }}
