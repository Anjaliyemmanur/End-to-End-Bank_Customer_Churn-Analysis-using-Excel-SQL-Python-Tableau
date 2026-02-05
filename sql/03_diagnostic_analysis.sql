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

**Insights**
Churned customers hold significantly higher average balances than retained customers, while differences in tenure, credit score, and number of products are minimal.
This indicates that high-value customers are more likely to churn not due to financial instability or short relationship length, but likely due to unmet expectations or
lack of personalized value. Retention strategies should prioritize high-balance customers with targeted engagement and loyalty initiatives.


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

**Insights**
51% of customers are active members with a churn rate of 14.27%, while 48.9% are inactive members with a significantly higher churn rate of 26.85%.
Although the difference in total customer count between active and inactive members is marginal (≈2%), the churn rate among inactive members is nearly 
double that of active members.This indicates that customer inactivity is a strong driver of churn, far more impactful than the difference in customer volume.
Inactive customers are approximately 2× more likely to churn compared to active customers, making activity status a critical risk indicator.
Although a larger proportion of customers hold a credit card (≈70%), the difference in churn rate between the two groups is less than 1%.
Customers with only 1 product have a much higher churn rate (28%) compared to customers holding multiple products (13%).
Despite both groups having a similar customer base size, single-product customers churn at more than 2× the rate of multi-product customers.

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

2.Are high-balance customers churning more in specific regions?
with balance_quartiles as (select Geography, Balance,Exited,NTILE(4) OVER (ORDER BY Balance) AS balance_quartile FROM `Customerchurn.Bank_churn_data`)
Select Geography, count(*) as high_balance_customers,Sum(case when Exited = 1 then 1 else 0 end) as churned_customers,round(sum(case when Exited = 1 then 1 else 0 end) * 100.0 / count(*),2) as churn_rate
from balance_quartiles
where balance_quartile = 4 
group by Geography
order by churn_rate desc;

**Insights**
Customer behaviour is structurally similar across France, Germany, and Spain in terms of tenure, products, and engagement.
However, Germany stands out as a high-risk, high-value churn market, where customers hold significantly higher balances but churn at much higher rates.
Germany shows the highest churn rate among high-balance customers (29%), making it the most critical region for potential revenue loss.
France retains a larger high-value customer base with a lower churn rate, indicating relatively stronger retention performance.
Spain exhibits moderate churn with a smaller high-balance segment, posing lower overall risk compared to Germany.

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

**Insights**
•	Churn rate is relatively high in the early years (0–5).
•	Churn declines as tenure increases, reaching the lowest level at 6–8 years.
•	Interestingly, churn rises again for very long-tenured customers (9–10 years).
So, the relationship is not strictly linear.
Long-tenure customers (9–10 years) may:
o	Feel stagnant or undervalued
o	Be targeted by competitors
o	Expect better rewards or premium treatment
This suggests churn risk exists at both ends of the tenure spectrum.

















