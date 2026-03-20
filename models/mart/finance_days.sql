{{ config(schema='finance') }}
WITH orders_per_day AS (select date_date, COUNT(DISTINCT orders_id) AS nb_transactions,ROUND(SUM(revenue),0) as revenue,ROUND(sum(margin),0)AS margin,
round(sum(operational_margin),0) as operational_margin, round(sum(purchase_cost),0) as purchase_cost,round(sum(shipping_fee),0) as shipping_fee,
round(sum(logcost),0) as log_cost,round(sum(ship_cost),0) as ship_cost,sum(quantity) as quantity from {{ref("int_orders_operational")}} group by date_date) select date_date, revenue,margin,operational_margin,purchase_cost,shipping_fee,
log_cost,ship_cost,quantity, round(revenue/NULLIF(nb_transactions,0),2) as average_basket from orders_per_day order by date_date desc  