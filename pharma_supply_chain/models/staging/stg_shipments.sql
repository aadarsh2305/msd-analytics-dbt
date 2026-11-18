{{ config(materialized='view') }}

select
    shipment_id,
    product_id,
    supplier_id,
    quantity,
    try_to_date(shipment_date::varchar) as shipment_date,
    upper(trim(status)) as shipment_status
from {{ source('pharma_raw', 'shipments') }}
