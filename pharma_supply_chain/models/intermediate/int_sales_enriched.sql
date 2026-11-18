{{ config(materialized='view') }}

select
    s.sale_id,
    s.product_id,
    p.product_name,
    p.category,
    s.sale_date,
    s.quantity_sold,
    p.unit_price,
    s.quantity_sold * p.unit_price as total_revenue
from {{ ref('stg_sales') }} as s
inner join {{ ref('stg_products') }} as p
    on s.product_id = p.product_id
