Select age_group from ecommerce_dataset_10000
where age_group ="Adults";

SELECT product_name
FROM ecommerce_dataset_10000
where review_text = "very good"
ORDER BY rating ASC
LIMIT 0, 200;

Select count(quantity), first_name
from ecommerce_dataset_10000
where order_status= "Pending"
group by first_name
having count(quantity) >= 3
limit 0,50;

select data.Country,ecommerce_dataset_10000.product_id
from ecommerce_dataset_10000
inner join data on data.CustomerID = ecommerce_dataset_10000.customer_id;

select sum()