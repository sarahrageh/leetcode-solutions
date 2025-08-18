with cte as(
    select *, dense_rank() over(partition by product_id order by year) as rn from sales
)

select product_id, year as first_year, quantity, price from cte where rn = 1;
