with cte as(
    select employee.id as employeeId, employee.name as employeeName, salary, department.id as deptId, department.name as deptName, dense_rank() over(partition by department.name order by salary desc) as rn from employee left join department 
    on employee.departmentid = department.id 
)
select deptName as Department, employeeName as Employee, Salary from cte where rn < 4;