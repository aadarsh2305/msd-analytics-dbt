{{ config(materialized='table') }}

select
    supplier_id,
    supplier_name,
    country
from {{ ref('stg_suppliers') }}
