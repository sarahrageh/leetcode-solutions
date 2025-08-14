-- rating / position
select 
    query_name, 
    round(sum(rating / position) / count(result), 2) as quality,
    round((count(case when rating < 3 then result end) / count(result)) * 100, 2) as poor_query_percentage     
    from queries group by query_name;