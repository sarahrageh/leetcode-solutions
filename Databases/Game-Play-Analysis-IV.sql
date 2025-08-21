with cte as(
    select player_id, event_date, 
    min(event_date) over(partition by player_id) as first_loggin, 
    date_add(min(event_date) over(partition by player_id), interval 1 day) as firstplus
    from activity 
)

select round((select count(distinct player_id) from cte where firstplus in (select event_date from activity where cte.player_id = activity.player_id)) /(select count(distinct player_id) from activity), 2) as fraction