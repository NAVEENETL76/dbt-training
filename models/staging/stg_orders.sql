select 
    {{dbt_utils.surrogate_key(['o.orderid','p.productid','c.customerid'])}} as sk_orders, 
    o.orderid,
    to_date(o.orderdate, 'YYYY/MM/DD') as orderdate,
    to_date(o.shipdate, 'YYYY/MM/DD') as shipdate,
    o.shipmode,
    d.delivery_team,
    o.ordercostprice,
    o.ordersellingprice,
    (o.ordersellingprice-o.ordercostprice) as orderprofit,
    round({{markup('o.ordersellingprice','o.ordercostprice')}}*100,2) as markup,
    c.customerid,
    c.customername,
    c.segment,
    c.country,
    p.productid,
    p.productname,
    p.category,
    p.subcategory,
    o.created_dt
 from {{ ref('raw_orders') }} o
 left join {{ ref('raw_customer') }} c on o.customerid=c.customerid
 left join {{ ref('raw_product') }} p on o.productid=p.productid
  left join {{ ref('delivery_team') }} d on o.shipmode=d.shipmode
 {{limit_data('o.created_dt')}}