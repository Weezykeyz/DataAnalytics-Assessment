-- Question 4: Customer Lifetime Value (CLV) Estimation
WITH txn_summary AS (
    SELECT 
        owner_id,
        COUNT(*) AS total_txns,
        SUM(confirmed_amount) AS total_value
    FROM savings_savingsaccount
    GROUP BY owner_id
),
tenure_calc AS (
    SELECT 
        u.id AS customer_id,
        u.name,
        ROUND(DATEDIFF(MONTH, u.date_joined, CURRENT_DATE)) AS tenure_months
    FROM users_customuser u
),
clv_calc AS (
    SELECT 
        t.customer_id,
        t.name,
        t.tenure_months,
        ts.total_txns,
        ROUND(((ts.total_txns / NULLIF(t.tenure_months, 0)) * 12 * ((ts.total_value * 0.001)/ts.total_txns)) / 100.0, 2) AS estimated_clv
    FROM tenure_calc t
    JOIN txn_summary ts ON t.customer_id = ts.owner_id
)
SELECT * FROM clv_calc
ORDER BY estimated_clv DESC;
