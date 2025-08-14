with cte as 
(select id, recordDate, temperature, lag(temperature) over(order by recordDate) as prev, 
lag(recordDate) over(order by recordDate) as prev_date from weather) 
select Id from cte where temperature > prev and datediff(recorddate, prev_date) = 1;