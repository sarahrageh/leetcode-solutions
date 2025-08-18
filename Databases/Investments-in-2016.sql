with cte as(
    select *, 
    count(pid) over(partition by tiv_2015) as tiv15_count,
    json_array(lat, lon) as location, count(pid) over(partition by json_array(lat, lon)) as loc_count 
    from insurance 
)

select round(sum(tiv_2016), 2) as tiv_2016 from cte where tiv15_count > 1 and loc_count = 1;