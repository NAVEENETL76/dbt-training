{{
    config(
        materialized='table'
    )
}}
select 
orderid, 
to_date(orderdate, 'YYYY/MM/DD') as orderdate,
to_date(shipdate, 'YYYY/MM/DD') as shipdate,
shipmode,
customerid,
productid,
ordercostprice,
ordersellingprice,
current_date() as created_dt
from raw.globalmart.orders
