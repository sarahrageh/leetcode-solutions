select distinct t1.employee_id, t1.name, 
count(t2.employee_id) as reports_count, 
round(sum(t2.age) / count(t2.employee_id)) as average_age 
from employees as t1 join employees as t2 
on t1.employee_id = t2.reports_to 
where t2.reports_to is not null 
group by t1.employee_id
order by t1.employee_id;