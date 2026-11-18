{{ config(materialized='table') }}

with inventory as (
    select
        product_id,
        sum(quantity_available) as total_inventory
    from {{ ref('stg_inventory') }}
    group by product_id
),

sales as (
    select
        product_id,
        sum(quantity_sold) as total_units_sold,
        sum(total_revenue) as total_revenue
    from {{ ref('int_sales_enriched') }}
    group by product_id
),

shipments as (
    select
        product_id,
        count(*) as total_shipments,
        count_if(shipment_status = 'DELIVERED')
            as delivered_shipments
    from {{ ref('stg_shipments') }}
    group by product_id
)

select
    p.product_id,
    p.product_name,
    coalesce(i.total_inventory, 0) as total_inventory,
    coalesce(s.total_units_sold, 0) as total_units_sold,
    coalesce(s.total_revenue, 0) as total_revenue,
    coalesce(sh.total_shipments, 0) as total_shipments,
    coalesce(sh.delivered_shipments, 0)
        as delivered_shipments
from {{ ref('stg_products') }} as p
left join inventory as i on p.product_id = i.product_id
left join sales as s on p.product_id = s.product_id
left join shipments as sh on p.product_id = sh.product_id
