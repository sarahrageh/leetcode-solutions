with cte as(
    select turn, person_id, person_name, weight, 
    case when sum(weight) over(order by turn) <= 1000 then 'y' end as do_able
    from queue order by turn
)

select person_name from cte where do_able = 'y' order by turn desc limit 1;