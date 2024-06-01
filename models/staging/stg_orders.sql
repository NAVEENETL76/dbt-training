select o.orderid,o.orderdate,o.shipdate,o.shipmode,
o.ordercostprice,o.ordersellingprice,
(o.ordersellingprice-o.ordercostprice) as profit,
c.customername,c.segment,c.country,
p.productname,p.category,p.subcategory,
o.created_dt
 from {{ ref('raw_orders') }} o
 left join {{ ref('raw_customer') }} c on o.customerid=c.customerid
 left join {{ ref('raw_product') }} p on o.productid=p.productid