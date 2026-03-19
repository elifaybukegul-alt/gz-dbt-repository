select s.pdt_id,s.date_date,s.orders_id,s.revenue,s.quantity,CAST(p.purchse_price AS FLOAT64) AS purchase_price ,round(s.quantity*CAST(p.purchse_price AS FLOAT64),2) as purchase_cost,
round(s.revenue-s.quantity*CAST(p.purchse_price AS FLOAT64),2) as margin from {{ref("stg_raw__sales")}} s LEFT JOIN {{ref("stg_raw__product")}} p ON
s.pdt_id=p.products_id