{{
    config(
        materialized='table'
    )
}}

select
    *,
    current_date() as created_dt 
from 
    {{ source('rawlayer', 'product') }}