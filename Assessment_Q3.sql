-- Question 3: Account Inactivity Alert
SELECT 
    p.id AS plan_id,
    p.owner_id,
    'Investment' AS type,
    MAX(p.transaction_date) AS last_transaction_date,
    DATEDIFF(DAY, MAX(p.transaction_date), CURRENT_DATE) AS inactivity_days
FROM plans_plan p
GROUP BY p.id, p.owner_id
HAVING DATEDIFF(DAY, MAX(p.transaction_date), CURRENT_DATE) > 365

UNION ALL

SELECT 
    s.id AS plan_id,
    s.owner_id,
    'Savings' AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(DAY, MAX(s.transaction_date), CURRENT_DATE) AS inactivity_days
FROM savings_savingsaccount s
GROUP BY s.id, s.owner_id
HAVING DATEDIFF(DAY, MAX(s.transaction_date), CURRENT_DATE) > 365;
