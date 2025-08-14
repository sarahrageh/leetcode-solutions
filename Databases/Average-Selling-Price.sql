select 
    t1.product_id, 
    ifnull(round(sum(price * units) / sum(units), 2), 0)  as average_price 
    from prices as t1 left join unitssold as t2 
    on t1.product_id = t2. product_id and purchase_date between start_date and end_date
    group by product_id;