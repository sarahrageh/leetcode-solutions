with cte as(
    select machine_id, process_id, 
    round((timestamp - (lag(timestamp) over(partition by machine_id, process_id order by machine_id,process_id,activity_type))), 3) as diff
    from activity 
)

select machine_id, round((sum(diff) / count(distinct process_id)), 3) as processing_time from cte group by machine_id;