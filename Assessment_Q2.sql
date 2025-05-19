-- Question 2: Transaction Frequency Analysis
WITH monthly_txn AS (
    SELECT 
        owner_id,
        COUNT(*) AS txn_count,
        DATEDIFF(MONTH, MIN(transaction_date), MAX(transaction_date)) + 1 AS active_months
    FROM savings_savingsaccount
    GROUP BY owner_id
),
frequency AS (
    SELECT 
        m.owner_id,
        ROUND(m.txn_count * 1.0 / NULLIF(m.active_months, 0), 2) AS avg_txn_per_month
    FROM monthly_txn m
)
SELECT 
    CASE 
        WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
        WHEN avg_txn_per_month >= 3 THEN 'Medium Frequency'
        ELSE 'Low Frequency' 
    END AS frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM frequency
GROUP BY frequency_category;
