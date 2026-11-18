{{ config(materialized='view') }}

with source_data as (

    select * from {{ source('pharma_raw', 'products') }}

),

cleaned as (

    select
        product_id,
        unit_price,
        upper(trim(product_name)) as product_name,
        upper(trim(category)) as category
    from source_data

)

select * from cleaned
