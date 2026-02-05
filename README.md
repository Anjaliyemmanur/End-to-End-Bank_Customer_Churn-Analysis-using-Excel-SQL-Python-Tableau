📊 Bank Customer Churn Analysis Project
End-to-End Analytics Project | SQL • Python • Tableau • Excel

📌 Project Overview
This project analyzes historical bank customer data to investigate the causes of customer churn and support retention efforts through data-driven insights and recommendations.
It follows a real-world analytics workflow:
- Data validation and quality checks in Excel
- Descriptive and segmentation analysis using SQL
- Statistical testing and modeling in Python
- Insight communication through interactive Tableau dashboards

🎯 Business Problem
The bank aims to strengthen customer retention by:
- Determining the primary factors influencing churn
- Segmenting customers based on churn risk
- Flagging high-value customers vulnerable to attrition
- Supporting proactive, targeted retention strategies
Outcome: Deliver actionable insights that help reduce churn and improve long-term customer relationships.

Source: Kaggle – Bank Customer Churn Dataset
🔗 Dataset link

Records: 10,000+ customers
Format: CSV
Features: 13 columns

📋 Column Details
Column Name	Description
CustomerId-Unique customer identifier
Surname-Customer surname
CreditScore-Customer credit score
Geography-Customer location (France, Germany, Spain)
Gender-Customer gender
Age-Customer age
Tenure-Number of years with the bank
Balance-Account balance
NumOfProducts-Number of bank products used
HasCrCard-Credit card ownership (1 = Yes, 0 = No)
IsActiveMember-Active membership status (1 = Active, 0 = Inactive)
EstimatedSalary-Estimated annual salary
Exited- Churn indicator (1 = churned, 0 = retained)

🛠 Tools & Technologies
Excel
- Initial data sanity checks
- Null value inspection
  
SQL (Google BigQuery)
- Descriptive analysis
- Customer segmentation
- Behavioral and churn analysis

Python (Google Colab)
- Pandas & NumPy
- SciPy / Statistical libraries
- Chi-Square Tests
- Independent T-Tests

Tableau
- Interactive dashboards
- Business-focused storytelling
  
Version Control
GitHub

🔍 Data Validation & Pre-Processing
Before performing any analysis, the raw CSV dataset was reviewed in Excel to:
Check for missing or null values
Ensure consistency before loading data into BigQuery
This step ensured data quality and reduced the risk of incorrect analytical conclusions.

🔎 Analysis Methodology
1️⃣ Descriptive Analysis (SQL – BigQuery)
Objective: Understand the customer base and overall churn patterns.
- Customer base overview: total customers, churn vs retention, and overall churn rate
- Demographic distribution: age, gender, and geography (France, Germany, Spain)
- Churn distribution across demographic groups to identify high-risk segments

2️⃣ Diagnostic Analysis — Why is churn happening?
Objective: Identify behavioral and engagement differences between churned and retained customers.
- Compared churned vs retained customers by:
Balance
Tenure
Credit score
Number of products
- Evaluated the impact of engagement and product usage:
Active vs inactive customers
Credit card ownership
Single-product vs multi-product users
Analyzed geography-specific patterns to explain regional churn variation
Assessed the relationship between tenure and churn probability to identify peak churn periods

3️⃣ Customer Segmentation & Profiling — Who is churning?

Objective: Create business-usable customer profiles.

Segmented customers based on age, balance, activity status, and product usage

Identified characteristics of high-risk churn segments

Flagged high-value customers (high balance / salary) vulnerable to churn

Compared churn behavior across:

Active vs inactive customers

Single-product vs multi-product customers

4️⃣ Statistical Validation (Python – Google Colab)

Objective: Statistically validate observed churn patterns.

Tests performed:

Chi-square tests:

Churn vs geography

Churn vs activity status

Churn vs number of products

Independent t-test:

Difference in average balance between churned and retained customers

These tests confirmed whether observed churn drivers were statistically significant rather than due to random variation.

5️⃣ Predictive & Risk Insights (Conceptual)

Objective: Translate insights into actionable risk signals.

Identified key churn predictors based on EDA and statistical results

Assessed feasibility of churn prediction using available customer attributes

Proposed a churn risk scoring framework to prioritize retention efforts

📊 Tableau Dashboards

An interactive Tableau dashboard with navigation buttons was developed, comprising three focused views:

🧭 Dashboard 1: Customer Churn Overview

Overall churn KPIs

Churn by age, gender, and geography

High-level customer distribution

🔑 Dashboard 2: Key Drivers of Churn

Activity status vs churn

Product count vs churn

Balance, tenure, and credit score patterns

🚨 Dashboard 3: High-Risk Segments & Insights

High-value customers at risk

Geography-specific churn hotspots

Business-ready insights and recommendations

💡 Key Insights
Inactive customers consistently show higher churn risk
Customers with only one product are more likely to churn
High account balance does not guarantee customer loyalty
Certain geographies exhibit higher churn rates
Churn probability peaks within specific tenure ranges

✅ Business Recommendations
Business Recommendation to mitigate Churn
 -  Prioritize inactive customers – Highest churn risk across segments
 -  Act early on single-product users – Promote bundles and cross-sell
 -  Safeguard high-balance customers – Balance ≠ loyalty
 -  Apply age-based strategies – Higher churn in mid-to-older groups
 -  Trigger early retention alerts – Based on activity and product usage
 -  De-prioritize weak predictors – Credit score, tenure, salary
 -  Focus on engagement, not discounts – Increase usage and activity
 -  Invest in strong churn drivers – Activity status, balance, products

