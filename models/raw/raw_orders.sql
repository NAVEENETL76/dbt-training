{{
    config(
        materialized='table'
    )
}}
select 
    orderid, 
    orderdate,
    shipdate,
    shipmode,
    customerid,
    productid,
    ordercostprice,
    ordersellingprice,
    current_date() as created_dt
from 
    {{ source('rawlayer', 'orders') }}
