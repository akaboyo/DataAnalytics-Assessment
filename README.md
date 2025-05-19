# DataAnalytics-Assessment

## Overview
This repository contains SQL queries and analysis for financial insights related to customer transactions, account activity, and Customer Lifetime Value (CLV). Results are provided in CSV format for easy reference.

## Repository Structure

## SQL Queries & Results

### **1. High-Value Customers with Multiple Products**
#### **Problem Statement**
- Identify customers with at least one **funded savings plan** and **investment plan**, sorted by total deposits.
- Sort results based on total deposits.

#### **Query File**: [`query1.sql`](query.sql)  

![Assessment_Query1](https://github.com/user-attachments/assets/f27516cd-3496-4fc7-8030-9b446846c5ce)


#### **Results File**: [`query1.csv`](query1.csv)  

![image](https://github.com/user-attachments/assets/6132200a-7aaa-4391-8a9a-1fef87d2f933)



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

---

### **3. Account Inactivity Alert**
#### **Problem Statement**
Identify accounts that have **no inflow transactions for over one year (365 days)**.

#### **Query File**: [`query3.sql`](query3.sql)  

![Assessment_Query3](https://github.com/user-attachments/assets/2f036490-0329-4e15-98cb-ca2b9ff74dd7)

#### **Results File**: [`query3.csv`](query3.csv)  

![image](https://github.com/user-attachments/assets/be7229e9-5d12-46d1-8f35-42abfb32ca4d)


---

### **4. Customer Lifetime Value (CLV) Estimation**
#### **Problem Statement**
Estimate **Customer Lifetime Value (CLV)** based on **account tenure and transaction volume**.

#### **Query File**: [`query4.sql`](query4.sql)  

![Assessment_Query4](https://github.com/user-attachments/assets/275446cd-02f9-409d-9c27-a950ddb7bf45)

#### **Results File**: [`query4.csv`](query4.csv)  

![image](https://github.com/user-attachments/assets/79a68731-8d6f-45b1-bff2-040bc2e6d688)
---

## **Notes**
- SQL queries are optimized for **MySQL Workbench**.
- Data is structured for **clear insights and better performance**.
- CSV files contain actual query results for **verification and analysis**.

---

### **Author: Adebayo**  
🚀 **GitHub Profile:** [Your GitHub Profile Link]()  

---

