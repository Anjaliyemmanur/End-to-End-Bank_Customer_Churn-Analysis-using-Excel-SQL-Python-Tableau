
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

**Insights** 
1.The churn analysis is based on a moderately large customer base-10000 customers, which is sufficient to identify meaningful churn patterns and trends.
2.The churn rate is 20.37%, meaning roughly one in five customers has left the bank.
  At this scale, churn represents a significant revenue and growth risk. However, with nearly 80% of customers still active, the business has a
  strong opportunity to reduce future churn through targeted retention strategies focused on high-risk segments.
3.Roughly 1 in 5 customers is churning, which indicates a significant retention challenge.

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

**Insights**-
The bank’s customers are heavily skewed middle aged often more economically active customers, slightly less young or early professionals, the customer count is 
lesser in the age of older aged people, indicating opportunities for targeted acquisition strategies for early-career customers and tailored products for older customers.
While statistical testing shows a significant difference in gender counts, this result is influenced by the large dataset size. In practical terms, the gender 
split is fairly even and does not represent a meaningful demographic imbalance.
The customer count in France is the highest contributing to around 50% of the customers, where as Germany and Spain contribute to roughly 25% of the
customers, with Germany having slightly more customers than Spain. This shoes that France is the core base of the bank, while Germany and Spain seem to be the penetrating
markets. 
Given France’s strong customer base, the bank can focus on scaling successful strategies already working in this market. Additionally, insights from France—such as 
product adoption, customer engagement, and retention mechanisms—can be selectively adapted and applied to Germany and Spain. Targeted marketing, localized promotions,
and loyalty initiatives may help accelerate customer acquisition and growth in these emerging markets.


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

**Insights**:















