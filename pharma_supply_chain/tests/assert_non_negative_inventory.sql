select *
from {{ ref('fct_inventory') }}
where quantity_available < 0