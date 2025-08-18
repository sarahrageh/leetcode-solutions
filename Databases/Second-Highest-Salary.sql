with cte as(
    select id, salary, dense_rank() over(order by salary desc) as rn from employee
)

select coalesce((select salary from cte where rn = 2 limit 1), null) as SecondHighestSalary;

