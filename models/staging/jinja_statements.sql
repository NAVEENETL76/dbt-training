{%set var_source='First Class'-%}
{% set var_date="Naveen" -%}

select *,'{{var_date}}' as varaibles_usage from {{ref('stg_orders')}} where shipmode='{{var_source}}'