📊 Bank Customer Churn Analysis Project
End-to-End Analytics Project | SQL • Python • Tableau • Excel

📌 Project Overview
The bank is experiencing customer attrition and wants to understand why customers churn, identify high-risk customer segments, and predict future churn using historical customer data.
The goal is to provide data-driven insights and actionable recommendations to reduce churn and improve customer retention.

The project follows a real-world analytics workflow:
- Data validation and sanity checks using Excel
- Descriptive and segmentation analysis using SQL
- Statistical validation using Python
- Business storytelling using interactive Tableau dashboards

🎯 Business Problem

The bank is experiencing customer attrition and wants to:
- Understand key drivers of churn
- Identify high-risk customer segments
- Recognize high-value customers at risk of leaving
- Enable proactive retention strategies

Goal:
Provide actionable, data-driven insights to reduce churn and improve customer retention.

🗂 Dataset Description
Source: Kaggle – Bank Customer Churn Dataset
link to dataset-https://www.kaggle.com/datasets/mathchi/churn-for-bank-customers
Records: 10,000+ customers
Format: CSV
Features: 13 columns

Column-Name	Descriptiona
CustomerId-Unique customer identifier
Surname-Customer surname
CreditScore-Credit score
Geography-Customer location (France, Germany, Spain)
Gender-Customer gender
Age-Customer age
Tenure-Years with the bank
Balance-Account balance
NumOfProducts-Number of bank products used
HasCrCard-Credit card ownership (0/1)
IsActiveMember-Active membership status (0/1)
EstimatedSalary-Estimated annual salary
Exited-Churn flag (1 = churned, 0 = retained)

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
  -Customer Base Overview
1.	What is the total number of customers? 
2.	What percentage of customers have churned vs retained?
3.	What is the overall churn rate?
-Demographic Distribution
4.	What is the age distribution of customers?
5.	How are customers distributed by:
o	Gender
o	Geography
6.	Which age groups form the largest customer base?
-Churn Distribution
7.	How does churn vary by:
o	Gender
o	Geography
o	Age group
8.	Which demographic segment shows the highest churn rate?

2️⃣ Diagnostic Analysis
(Why is churn happening?)
Behavioral Differences
9.	How do churned vs non-churned customers differ in terms of:
-	Average balance
-	Average tenure
-	Average credit score
-	Average number of products
  Account Activity & Engagement
10.Does being an active member reduce churn?
11.Is there a difference in churn between customers who:
- Have a credit card vs don’t
- Have 1 product vs multiple products
Geography-Specific Behavior
12.	How does customer behavior differ across France, Germany, and Spain?
13.	Why does churn appear higher in certain geographies?
14.	Are high-balance customers churning more in specific regions?
Tenure & Loyalty
15.	How does tenure impact churn probability?
16.	At which tenure range does churn peak?

3️⃣ Customer Segmentation & Profiling — Who is churning?
👉 Goal: Create business-usable customer profiles.
Questions to Answer
1.	Can customers be segmented based on:
o	Age
o	Balance
o	Activity status
o	Number of products?
2.	What are the key characteristics of high-risk churn segments?
3.	Who are the high-value customers (high balance / salary) that are at risk of churn?
4.	How does churn differ across:
o	Active vs inactive
o	Single-product vs multi-product customers

3️⃣ Statistical Analysis (Python – Google Colab)
Objective: Validate insights statistically

The following tests were performed:
Chi-Square Tests
Churn vs Geography
Churn vs Activity Status
Churn vs Number of Products

Independent T-Test
Difference in average balance between churned and retained customers
These tests helped confirm whether observed churn patterns were statistically significant rather than due to random variation.

4️⃣ Predictive & Risk Insights (Conceptual)
Identified key churn predictors based on statistical results and exploratory analysis
Assessed feasibility of churn prediction using available customer attributes
Proposed churn risk scoring logic to prioritize retention efforts

📊 Tableau Dashboards
An interactive Tableau dashboard with navigation buttons was created, leading to three focused dashboards:

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

