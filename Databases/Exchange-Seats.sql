with cte as(
    select id, student, lag(student) over(order by id) as prev, lead(student) over(order by id) as next, 
    row_number() over(order by id) as rn from seat
), ctee as(
    select id, coalesce(coalesce(if(id % 2, next, prev), lag(next) over(order by id)), student)  as student from cte
)

select * from ctee;