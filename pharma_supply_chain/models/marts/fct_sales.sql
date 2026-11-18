
{{ config(materialized='table') }}

select
    sale_id,
    product_id,
    sale_date,
    quantity_sold,
    unit_price,
    total_revenue
from {{ ref('int_sales_enriched') }}
