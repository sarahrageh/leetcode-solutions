select x.user_id, 
round(ifnull(count(case when action = 'confirmed' then 1 end) / count(action), 0), 2) as confirmation_rate 
from signups as x left join confirmations as y
on x.user_id = y.user_id
group by user_id;