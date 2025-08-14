select x.name 
from employee as x join employee as y 
on x.id = y.managerid
group by x.id, x.name
having count(y.managerid) >= 5;