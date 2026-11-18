{{ config(materialized='view') }}

select
    supplier_id,
    trim(supplier_name) as supplier_name,
    upper(trim(country)) as country
from {{ source('pharma_raw', 'suppliers') }}