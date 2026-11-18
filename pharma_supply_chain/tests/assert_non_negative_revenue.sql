select *
from {{ ref('fct_sales') }}
where total_revenue < 0