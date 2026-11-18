{{ config(materialized='view') }}

with source_data as (

    select * from {{ source('pharma_raw', 'products') }}

),

cleaned as (

    select
        product_id,
        upper(trim(product_name)) as product_name,
        upper(trim(category)) as category,
        unit_price
    from source_data

)

select * from cleaned