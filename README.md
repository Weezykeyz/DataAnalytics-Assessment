# DataAnalytics-Assessment

This repository contains solutions to a SQL-based Data Analyst Assessment designed to evaluate my technical proficiency in SQL, problem-solving skills, and business understanding. Each question addresses a real-world scenario using a relational database.

## Assessment Questions & Approach

### Q1. High-Value Customers with Multiple Products
**Objective:** Find customers with both a funded savings and investment plan, sorted by total deposits.  
**Approach:**  
- Used joins between `users_customuser`, `savings_savingsaccount`, and `plans_plan`.
- Applied filters on `confirmed_amount`, `is_regular_savings`, and `is_a_fund`.
- Grouped by user and counted distinct savings/investments.
- Summed total confirmed savings and converted kobo to Naira.

### Q2. Transaction Frequency Analysis
**Objective:** Segment users based on average transactions/month.  
**Approach:**  
- Aggregated transaction counts by customer.
- Calculated active months using date range logic.
- Used a CASE statement to classify frequency levels.

### Q3. Account Inactivity Alert
**Objective**: Identify active accounts with no inflow for 365+ days.  
**Approach:**  
- Extracted last transaction date from both `plans_plan` and `savings_savingsaccount`.
- Filtered using `DATEDIFF` to check for inactivity beyond a year.
- Unified results using `UNION ALL`.

### Q4. Customer Lifetime Value (CLV)
**Objective:** Estimate customer CLV based on transaction value and tenure.  
**Approach:**  
- Calculated account tenure from signup date.
- Estimated CLV using the provided formula.
- Used `JOIN`, `ROUND`, and `NULLIF` to handle division safely.

## Challenges Encountered

- **Date Calculations:** Simulating `MONTHS_BETWEEN` without knowing the exact SQL dialect required use of `DATEDIFF(MONTH, ...)`.
- **Currency Conversion:** All monetary values were converted from kobo to Naira (i.e., divided by 100.0).
- **NULL Handling:** Used `NULLIF` to avoid division-by-zero errors during tenure or transaction average calculations.

## 📁 Repository Structure

```
DataAnalytics-Assessment/
├── Assessment_Q1.sql
├── Assessment_Q2.sql
├── Assessment_Q3.sql
├── Assessment_Q4.sql
└── README.md
```

## Submission Notes

- All work is original and aligned with the business logic stated in the assessment brief.
- The SQL queries are clean, well-commented, and optimized for clarity.
- Thank you for reviewing this submission. I trust it effectively showcases my analytical thinking and SQL expertise.
