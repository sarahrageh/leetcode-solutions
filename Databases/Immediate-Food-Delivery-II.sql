with cte as(
    select delivery_id, customer_id, order_date, customer_pref_delivery_date,
    row_number() over(partition by customer_id order by order_date) as rn
    from delivery
)

select round(((select count(delivery_id) from cte where order_date = customer_pref_delivery_date and rn = 1) / 
count(delivery_id)) * 100, 2) as immediate_percentage from cte where rn = 1;