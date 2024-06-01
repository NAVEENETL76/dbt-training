{{
    config(
        materialized='table'
    )
}}

select *,
current_date() as created_dt 
from raw.globalmart.product