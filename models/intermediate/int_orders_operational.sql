select o.orders_id,o.date_date,ROUND(o.margin+ s.shipping_fee-(s.logcost + CAST(s.ship_cost as  FLOAT64)),2) as operational_margin,o.quantity,
o.revenue,o.purchase_cost,o.margin,s.shipping_fee,s.logcost,CAST(s.ship_cost AS FLOAT64) AS ship_cost from {{ref("int_orders_margin")}} o LEFT JOIN 
{{ref("stg_raw__ship")}} s USING(orders_id) order by orders_id desc