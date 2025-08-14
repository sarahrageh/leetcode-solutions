with cte as(
    select num, count(num) as x from mynumbers group by num
)

select max(num) as num from cte where x = 1;