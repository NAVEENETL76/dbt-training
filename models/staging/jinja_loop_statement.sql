{% set var_category=['Furniture','Office','Technology'] -%}

select 
orderid,
{% for loop_var in var_category -%}
{% if loop.first %}case {% endif %}when category='{{loop_var}}' then orderprofit 
{% if loop.last %}end as order_proft {% endif %}
{% endfor -%}
from {{ref('stg_orders')}} 
where 1=1