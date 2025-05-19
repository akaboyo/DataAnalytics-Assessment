# DataAnalytics-Assessment

## Overview
This repository contains SQL queries and analysis for financial insights related to customer transactions, account activity, and Customer Lifetime Value (CLV). Results are provided in CSV format for easy reference.

## Repository Structure
The repository has this structure -

DataAnalytics-Assessment/

- Assessment_Q1.sql
- Assessment_Q2.sql
- Assessment_Q3.sql
- Assessment_Q4.sql
- README.md

## SQL Queries & Results

### **1. High-Value Customers with Multiple Products**
#### **Problem Statement**
- Identify customers with at least one **funded savings plan** and **investment plan**, sorted by total deposits.
- Sort results based on total deposits.

#### **Query File**: [`query1.sql`](query.sql)  

![Assessment_Query1](https://github.com/user-attachments/assets/f27516cd-3496-4fc7-8030-9b446846c5ce)


#### **Results File**: [`query1.csv`](query1.csv)  

![image](https://github.com/user-attachments/assets/6132200a-7aaa-4391-8a9a-1fef87d2f933)

## Challenge & Insights
- This query identifies high-value customers who have at least one funded savings plan and one funded investment plan, ranking them by total deposits.
## Approach
- Joins three tables (users_customuser, savings_savingsaccount, plans_plan) to retrieve users with both savings and investment accounts.
- Filters customers who have a funded savings plan (is_regular_savings = 1) and a funded investment plan (is_a_fund = 1).
- Counts unique savings accounts (COUNT(DISTINCT s.id)) and investment plans (COUNT(DISTINCT p.id)) per user.
- Calculates total deposits (SUM(s.confirmed_amount)) across savings accounts.
- Excludes users without both types of plans using HAVING savings_count > 0 AND investment_count > 0.
- Sorts the results by total deposits in descending order, highlighting the most valuable customers.
- Note that the fields - 'is_regular_savings' and 'is_a_fund' are both in the plans_plan table.Hence, there is no output for the query. 

---

### **2. Transaction Frequency Analysis**
#### **Problem Statement**
Calculate **average transactions per month** per customer and categorize them into:
- **High Frequency** (≥10 transactions/month)
- **Medium Frequency** (3-9 transactions/month)
- **Low Frequency** (≤2 transactions/month)

#### **Query File**: [`query2.sql`](query2.sql)

![Assessment_Query2](https://github.com/user-attachments/assets/ac4ea5c8-a46c-4190-ba50-61a01fcbc457)

#### **Results File**: [`query2.csv`](query2.csv)  

![image](https://github.com/user-attachments/assets/2256ad94-b60a-4269-b1a7-433d48f520ed)

## Query Explanation & Insights for Question 2
## Objective
This query categorizes customers based on their transaction frequency, helping identify high-frequency, medium-frequency, and low-frequency users. This insight is useful for understanding customer engagement trends and optimizing retention strategies.
## Approach
- Calculates Transactions Per Month for Each User:
- Retrieves the total number of transactions (COUNT(s.id)) per user.
- Divides by the total months since account creation (TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())).
- Groups results by owner_id to ensure individual transaction rates are correctly calculated.
- Categorizes Users into Frequency Groups:
- High Frequency: Customers averaging 10+ transactions per month.
- Medium Frequency: Customers averaging 3–9 transactions per month.
- Low Frequency: Customers averaging less than 3 transactions per month.
- Aggregates Data for Each Frequency Category:
- Counts users in each category (COUNT(DISTINCT subquery.owner_id)).
- Calculates the average transaction frequency per category (ROUND(AVG(subquery.transactions_per_month), 1)).
- Orders Results by Activity Level:
- Sorts the output by average transactions per month (ORDER BY avg_transactions_per_month DESC).
- Ensures high-frequency users appear at the top, making it easier to spot engagement trends.
## Key Insights
- Improves Customer Segmentation – Helps identify highly active users vs. less engaged ones.
- Optimized for Performance – Uses GROUP BY and AVG() efficiently to ensure a scalable query for large datasets.
- Avoids NULL Issues – Ensures inactive users with missing transaction data are excluded using WHERE TIMESTAMPDIFF(...) > 0.
- Useful for Business Strategy – Companies can target high-frequency users for loyalty programs and low-frequency users for re-engagement campaigns.
  
---

### **3. Account Inactivity Alert**
#### **Problem Statement**
Identify accounts that have **no inflow transactions for over one year (365 days)**.

#### **Query File**: [`query3.sql`](query3.sql)  

![Assessment_Query3](https://github.com/user-attachments/assets/2f036490-0329-4e15-98cb-ca2b9ff74dd7)

#### **Results File**: [`query3.csv`](query3.csv)  

![image](https://github.com/user-attachments/assets/be7229e9-5d12-46d1-8f35-42abfb32ca4d)

## Query Explanation & Insights for Question 3
## Objective
This query identifies inactive savings and investment accounts that haven’t had transactions for over 365 days. The goal is to flag accounts with no recent inflows, helping businesses take action, such as re-engagement strategies.
## Approach
- First Query: Savings Accounts
- Selects savings accounts (savings_savingsaccount) where transactions (confirmed_amount > 0) have occurred.
- Finds the latest transaction date (MAX(created_on)).
- Calculates the days since the last transaction (DATEDIFF(CURDATE(), MAX(created_on))).
- Groups by plan ID (id) and owner ID (owner_id) to ensure accurate account-level tracking.
- Second Query: Investment Plans
- Selects investment accounts (plans_plan) where transactions (amount > 0) have occurred.
- Finds the latest transaction date (MAX(created_on)).
- Calculates the days since the last transaction (DATEDIFF(CURDATE(), MAX(created_on))).
- Groups by plan ID and owner ID.
- Filters inactive accounts using HAVING inactivity_days > 365.
- Combining Results Using UNION
- Merges both savings and investment records to show inactive plans in a single result set.
- Ensures consistency in columns across both queries (plan_id, owner_id, type, last_transaction_date, inactivity_days).
## Key Insights
- Detects Inactive Accounts: Helps identify accounts with no transactions for over a year, enabling re-engagement efforts.
- Ensures Data Accuracy: Uses MAX(created_on) to correctly find the most recent transaction before calculating inactivity.
- Combines Savings & Investments Efficiently: Using UNION allows a consolidated view instead of separate queries.
- Improves Decision-Making: Helps financial institutions or businesses take action on inactive users, preventing churn.

---

### **4. Customer Lifetime Value (CLV) Estimation**
#### **Problem Statement**
Estimate **Customer Lifetime Value (CLV)** based on **account tenure and transaction volume**.

#### **Query File**: [`query4.sql`](query4.sql)  

![Assessment_Query4](https://github.com/user-attachments/assets/275446cd-02f9-409d-9c27-a950ddb7bf45)

#### **Results File**: [`query4.csv`](query4.csv)  

![image](https://github.com/user-attachments/assets/79a68731-8d6f-45b1-bff2-040bc2e6d688)

## Query Explanation & Insights for Question 4
## Objective
This query estimates Customer Lifetime Value (CLV) based on account tenure and transaction volume. The goal is to measure the potential value of each customer by analyzing their activity over time.
## Approach
- Calculates Customer Tenure:
- Uses TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) to compute the number of months since the customer joined.
- This helps understand how long the user has been active.
- Counts Unique Transactions:
- COUNT(DISTINCT s.id) tracks the total number of transactions (savings deposits) per customer.
- Ensures duplicate transactions are not counted multiple times.
- Estimates Customer Lifetime Value (CLV):
- Formula: CLV = (total transactions / tenure) * 12 * 0.001
- The number of transactions per month is calculated (COUNT(s.id) / tenure).
- Annualized transaction rate is derived by multiplying by 12.
- A profit multiplier (0.001 = 0.1%) is applied to estimate financial impact.
- ROUND(..., 2) ensures CLV is displayed to two decimal places for better readability.
- Filters Out Invalid Entries:
- WHERE TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) > 0 ensures only customers who have been active for at least one month are included.
- Orders Results by Estimated CLV:
- ORDER BY estimated_clv DESC ensures the highest-value customers appear first.
## Key Insights
- Identifies high-value customers – Useful for prioritizing VIP users for personalized engagement.
- Helps predict financial impact – Business teams can estimate the contribution of different customer groups.
- Uses efficient calculations – TIMESTAMPDIFF(), COUNT(), and ROUND() ensure optimized performance.
- Removes inactive users – Ensures only valid, active customer records are analyzed.


---

## **Notes**
- SQL queries are optimized for **MySQL Workbench**.
- Data is structured for **clear insights and better performance**.
- CSV files contain actual query results for **verification and analysis**.

---

### **Author: Adebayo Adebanjo**  
🚀 **GitHub Profile:** [[Your GitHub Profile Link](https://github.com/akaboyo/DataAnalytics-Assessment)]

---

