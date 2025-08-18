/* 
    'Low Salary' income < 20000
    'Average Salary' income between 20000 and 50000
    'High Salary' income > 50000
*/

with cte as(
    select 'Low Salary' as category 
    union 
    select 'Average Salary' 
    union 
    select 'High Salary' 
),
ctee as(
    select account_id, income, 
    case
        when income < 20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        when income > 50000 then 'High Salary'
    end as category
    from accounts
)

select category, count(account_id) as accounts_count from cte left join ctee using(category) group by category;