{% set var_category=['Furniture','Office','Technology'] -%}

select 
category,
subcategory,
{% for loop_var in var_category -%}
sum(case when category='{{loop_var}}' then orderprofit else 0 end) as {{loop_var}}_order_profit
{% if not loop.last -%},{% endif -%}
{% endfor -%}
from {{ref('stg_orders')}} 
where 1=1 group by category,subcategory order by category,subcategory