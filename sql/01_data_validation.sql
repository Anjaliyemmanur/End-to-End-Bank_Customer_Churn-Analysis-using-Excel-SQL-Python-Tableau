
## Descriptive Analysis
**Customer Base Overview**
1.	What is the total number of customers? 
2.	What percentage of customers have churned vs retained?
3.	What is the overall churn rate?
**Demographic Distribution**
1.	What is the age distribution of customers?
2.	How are customers distributed by:
o	Gender
o	Geography
3.Which age groups form the largest customer base?
**Churn Distribution**
1.	How does churn vary by:
o	Gender
o	Geography
o	Age group
2.Which demographic segment shows the highest churn rate?

**Customer Base Overview**
1.	What is the total number of customers? 
2.	What percentage of customers have churned vs retained?
3.	What is the overall churn rate?

1.What is the total number of customers? 
Select count(*) from `sql-module dsml.Customerchurn.Bank_churn_data` 

2.What percentage of customers have churned vs retained?
Select Sum(Case when Exited = 1 then 1 else 0 end) * 100.0 / Count (*) as churned_customer_percentage, Sum(Case when Exited = 0 then 1 else 0 end) * 100.0 / count(*)  
  as retained_customer_percentage from `Customerchurn.Bank_churn_data`;

3.What is the overall churn rate?
Select round(avg(Exited) * 100,2) as overall_churn_rate
from `Customerchurn.Bank_churn_data`;

Demographic Distribution
1.	What is the age distribution of customers?
2.	How are customers distributed by:
o	Gender
o	Geography
3.Which age groups form the largest customer base?

1.What is the age distribution of customers?
Select case when age between 18 and 29 then '18-29'
        when age between 30 and 39 then '30-39'
        when age between 40 and 49 then '40-49'
        when age between 50 and 59 then '50-59'
        when age between 60 and 69 then '60-69'
        when age between 70 and 79 then '70-79'
        else '80+'
    end as age_group,
    count(*) as customer_count
from `customerchurn.bank_churn_data`
group by age_group
order by customer_count desc;

2.How are customers distributed by:
o	Gender
o	Geography

Select gender, count(*) as count from `Customerchurn.Bank_churn_data`
group by gender
Order by count desc; 

Select count(*) as count, geography from `Customerchurn.Bankchurn`
group by geography
Order by count desc;

3.Which age groups form the largest customer base?
select
    case
        when age between 18 and 29 then '18-29'
        when age between 30 and 39 then '30-39'
        when age between 40 and 49 then '40-49'
        when age between 50 and 59 then '50-59'
        when age between 60 and 69 then '60-69'
        when age between 70 and 79 then '70-79'
        else '80+'
    end as age_group,
    count(*) as customer_count
from `customerchurn.bank_churn_data`
group by age_group
order by customer_count desc limit 1

Churn Distribution
1.	How does churn vary by:
o	Gender
o	Geography
o	Age group

Churn rate by Age group 
select  case when age between 18 and 29 then '18-29'
        when age between 30 and 39 then '30-39'
        when age between 40 and 49 then '40-49'
        when age between 50 and 59 then '50-59'
        when age between 60 and 69 then '60-69'
        when age between 70 and 79 then '70-79'
        else '80+ end as age_group,
    count(*) as total_customers,
    sum(case when exited = 1 then 1 else 0 end) as churned_customers,
    round(
        sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),
        2
    ) as churn_rate
from `customerchurn.bank_churn_data`
group by age_group
order by churn_rate desc;

Churn Rate by Gender 
select
    gender,
    count(*) as total_customers,
    sum(case when exited = 1 then 1 else 0 end) as churned_customers,
    round(
        sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),
        2
    ) as churn_rate
from `customerchurn.bank_churn_data`
group by gender
order by churn_rate desc;

Churn Rate by Geography
select  geography,
    count(*) as total_customers, sum(case when exited = 1 then 1 else 0 end) as churned_customers,
    round( sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),   2 ) as churn_rate
from `customerchurn.bank_churn_data`
group by geography
order by churn_rate desc;
 
2.	Which demographic segment shows the highest churn rate?
with demographic_churn as (select concat('age: ',
            case
                when age between 18 and 29 then '18-29'
                when age between 30 and 39 then '30-39'
                when age between 40 and 49 then '40-49'
                when age between 50 and 59 then '50-59'
                when age between 60 and 69 then '60-69'
                when age between 70 and 79 then '70-79'
                else '80+'
            end
        ) as demographic_segment,
        round(
            sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from `customerchurn.bank_churn_data`
    group by demographic_segment

    union all

    -- gender segments
    select
        concat('gender: ', gender) as demographic_segment,
        round(
            sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from `customerchurn.bank_churn_data`
    group by gender

    union all

    -- geography segments
    select
        concat('geography: ', geography) as demographic_segment,
        round(
            sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*),
            2
        ) as churn_rate
    from `customerchurn.bank_churn_data`
    group by geography
)

select
    demographic_segment,
    churn_rate
from demographic_churn
order by churn_rate desc
limit 1;













