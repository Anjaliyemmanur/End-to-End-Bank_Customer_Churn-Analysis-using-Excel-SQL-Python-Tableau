️Customer Segmentation & Profiling — Who is churning?

1.	Can customers be segmented based on:
o	Age
o	Balance
o	Activity status
o	Number of products?

1.Can customers be segmented based on:
  Age
Select case when Age between 18 and 29 then '18-29' 
        when Age between 30 and 39 then '30-39'
        when Age between 40 and 49 then '40-49'
        when Age between 50 and 59 then '50-59'
        when Age between 60 and 69 then '60-69'
        when Age between 70 and 79 then '70-79'
        else '80+' end as age_group, count(*) AS customer_count
from `Customerchurn.Bank_churn_data`
group by age_group
order by age_group;

Balance
with balance_quartiles as (select ntile(4)over(order by Balance) as balance_quartile
from `Customerchurn.Bank_churn_data`)
Select Case when balance_quartile = 1 then 'Low Balance'
        when balance_quartile = 2 then  'Mid-Low Balance'
        when balance_quartile = 3 then 'Mid-High Balance'
        else 'High Balance'
        end as balance_segment,count(*) as customer_count from balance_quartiles
group by balance_segment
order by customer_count desc;

Activity status
select case when isactivemember = 1 then 'active'
else 'inactive' end as activity_status,
count(*) as customer_count
from `customerchurn.bank_churn_data`
group by activity_status;

Number of products
Select case when NumOfProducts = 1 then 'Single Product' else 'Multiple Products'
end as product_segment,count(*) as customer_count
from `Customerchurn.Bank_churn_data`
group by product_segment;













