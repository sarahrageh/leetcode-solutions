(select name as results from users left join movierating using(user_id) group by name order by count(name) desc, name limit 1)
union all
(select title from movies left join movierating using(movie_id) where month(created_at) = 2 and year(created_at) = 2020 group by title order by avg(rating) desc, title limit 1)