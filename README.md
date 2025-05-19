# DataAnalytics-Assessment

## Overview
This repository contains SQL queries and analysis for financial insights related to customer transactions, account activity, and Customer Lifetime Value (CLV). Results are provided in CSV format for easy reference.

## Repository Structure

## SQL Queries & Results

### **1. High-Value Customers with Multiple Products**
#### **Objective**
Identify customers with at least one **funded savings plan** and **investment plan**, sorted by total deposits.

#### **Query File**: [`query1.sql`](query.sql)  



#### **Results File**: [`query1.csv`](query1.csv)  

![image](https://github.com/user-attachments/assets/6132200a-7aaa-4391-8a9a-1fef87d2f933)

---

### **2. Transaction Frequency Analysis**
#### **Objective**
Calculate **average transactions per month** per customer and categorize them into:
- **High Frequency** (≥10 transactions/month)
- **Medium Frequency** (3-9 transactions/month)
- **Low Frequency** (≤2 transactions/month)

#### **Query File**: [`query2_transaction_frequency.sql`](queries/query2_transaction_frequency.sql)  
#### **Results File**: [`query2_transaction_frequency.csv`](results/query2_transaction_frequency.csv)  

---

### **3. Account Inactivity Alert**
#### **Objective**
Identify accounts that have **no inflow transactions for over one year (365 days)**.

#### **Query File**: [`query3_inactivity_alert.sql`](queries/query3_inactivity_alert.sql)  
#### **Results File**: [`query3_inactivity_alert.csv`](results/query3_inactivity_alert.csv)  

---

### **4. Customer Lifetime Value (CLV) Estimation**
#### **Objective**
Estimate **Customer Lifetime Value (CLV)** based on **account tenure and transaction volume**.

#### **Query File**: [`query4_customer_lifetime_value.sql`](queries/query4_customer_lifetime_value.sql)  
#### **Results File**: [`query4_customer_lifetime_value.csv`](results/query4_customer_lifetime_value.csv)  

---

## **How to Use This Repository**
1. **Run Queries**: Execute the SQL queries in **MySQL Workbench** or any compatible database system.
2. **Check Results**: Download the CSV files to analyze query outputs.
3. **Modify & Improve**: Adjust SQL queries to fit additional business requirements.

## **Notes**
- SQL queries are optimized for **MySQL Workbench**.
- Data is structured for **clear insights and better performance**.
- CSV files contain actual query results for **verification and analysis**.

---

### **Author: Adebayo**  
🚀 **GitHub Profile:** [Your GitHub Profile Link]()  

---

### **Next Steps**
✅ **Upload the `.sql` and `.csv` files to your GitHub repository.**  
✅ **Replace `[Your GitHub Profile Link]()` with your actual GitHub profile.**  
✅ **Make the repository public for easy collaboration.**  

This README is **structured, easy to navigate, and highly professional**. 🚀  
Let me know if you’d like additional refinements or explanations! 👍  
