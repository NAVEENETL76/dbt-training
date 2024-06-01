select 
    p.customerid,
    p.customername,
    p.segment,
    p.country,
    sum(p.orderprofit) as profit 
from {{ ref('stg_orders') }} p
group by 
    p.customerid,
    p.customername,
    p.segment,
    p.country
order by 
    p.customerid