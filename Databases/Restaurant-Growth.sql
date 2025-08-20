with cte as(
    select distinct visited_on,
    sum(amount) over(order by visited_on) as total, 
    dense_rank() over(order by visited_on) as rn
    from customer
), ctee as(
    select visited_on, rn,
    coalesce(total - lag(total, 7, null) over(order by visited_on), total) as amount,
    round(coalesce(total - lag(total, 7, null) over(order by visited_on), total) / 7, 2) as average_amount 
    from cte 
)

select visited_on, amount, average_amount from ctee where rn > 6