select *
from {{ ref('mart_supply_chain_performance') }}
where delivered_shipments > total_shipments
   or delivered_shipments < 0