️## Diagnostic Analysis(Why is churn happening?)
  
Behavioral Differences
1.	How do churned vs non-churned customers differ in terms of:
o	Average balance
o	Average tenure
o	Average credit score
o	Average number of products
Account Activity & Engagement
1.	Does being an active member reduce churn?
2.	Is there a difference in churn between customers who:
o	Have a credit card vs don’t
o	Have 1 product vs multiple products
Geography-Specific Behavior
1.	How does customer behavior differ across France, Germany, and Spain?
2.	Are high-balance customers churning more in specific regions?
Tenure & Loyalty
1.	How does tenure impact churn probability?
2.	At which tenure range does churn peak?

SQL Queries:
  
Behavioral Differences
1.	How do churned vs non-churned customers differ in terms of:
o	Average balance
o	Average tenure
o	Average credit score
o	Average number of products

select case when exited = 1 then 'churned' else 'retained' end as customer_status,
round(avg(balance), 2) as avg_balance, round(avg(tenure), 2) as avg_tenure,
round(avg(creditscore), 2) as avg_credit_score, round(avg(numofproducts), 2) as avg_number_of_products
from `customerchurn.bank_churn_data`
group by customer_status;

Account Activity & Engagement
1.	Does being an active member reduce churn?
2.	Is there a difference in churn between customers who:
o	Have a credit card vs don’t
o	Have 1 product vs multiple products

1.Select Case when IsActiveMember = 1 then 'Active Member' else 'Inactive Member'
end AS member_status, Count(*) AS total_customers, Sum(Case when Exited = 1 then 1 else 0 end) as churned_customers, round(Sum(Case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) as churn_rate
from `Customerchurn.Bank_churn_data`
group by member_status
order by churn_rate;

2.o Have a credit card vs don’t
select case when hascrcard = 1 then 'has credit card' else 'no credit card'
end as credit_card_status,count(*) as total_customers,sum(case when exited =1 then 1 else 0 end) as churned_customers,
    round(
        sum(case when exited = 1 then 1 else 0 end) * 100.0 / count(*), 2) as churn_rate
from `customerchurn.bank_churn_data`
group by credit_card_status;

2.o Have 1 product vs multiple products
Select Case when NumOfProducts = 1 then '1 Product' else 'Multiple Products' end as product_category,
    count(*) AS total_customers,
    Sum(Case when Exited = 1 then 1 else 0 end) AS churned_customers,
    round(sum(case when Exited = 1 then 1.0 else 0 end) / COUNT(*),2) as  churn_rate
from `Customerchurn.Bank_churn_data`
group by product_category;

Geography-Specific Behavior
1.	How does customer behavior differ across France, Germany, and Spain2
2.	Are high-balance customers churning more in specific regions?

1.How does customer behavior differ across France, Germany, and Spain?
Select Geography, count(*) AS total_customers,round(avg(Age), 1) as avg_age,round(avg(Balance), 2) as avg_balance,round(avg(Tenure), 1) as avg_tenure,round(avg(NumOfProducts), 2) AS avg_products,
round(sum(case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) as churn_rate,
round(sum(case when IsActiveMember = 1 then 1 else 0 end) * 100.0 / count(*),2) as active_member_pct
from `Customerchurn.Bank_churn_data`
where Geography in ('France', 'Germany', 'Spain')
group by Geography
order by  churn_rate desc;

2.
with balance_quartiles as (select Geography, Balance,Exited,NTILE(4) OVER (ORDER BY Balance) AS balance_quartile FROM `Customerchurn.Bank_churn_data`)
Select Geography, count(*) as high_balance_customers,Sum(case when Exited = 1 then 1 else 0 end) as churned_customers,round(sum(case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) as churn_rate
from balance_quartiles
where balance_quartile = 4 
group by Geography
order by churn_rate desc;

Tenure & Loyalty
1.	How does tenure impact churn probability?
2.	At which tenure range does churn peak?

1.How does tenure impact churn probability?
Select case when Tenure between 0 and 2 then '0–2 years' 
            when Tenure between 3 and 5 then '3–5 years'
            when Tenure between 6 and 8 then '6–8 years'
            else '9–10 years' end as 
            tenure_group,count(*) as total_customers,sum(Case when Exited = 1 then 1 else 0 end) as churned_customers,round(sum(case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) AS churn_rate
from `Customerchurn.Bank_churn_data`
group by tenure_group
order by churn_rate desc;

2.At which tenure range does churn peak?
Select Case when Tenure between 0 and 2 then '0–2 years'
           when Tenure between 3 and 5 then '3–5 years'
           when Tenure between 6 and 8 then '6–8 years'
           else '9–10 years' end as tenure_group,count(*) as total_customers,
sum(Case when Exited = 1 then 1 else 0 end) as churned_customers,round(sum(case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) AS churn_rate
from `Customerchurn.Bank_churn_data`
group by tenure_group
order by churn_rate desc limit 1 
















