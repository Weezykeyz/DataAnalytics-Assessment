-- Question 1: High-Value Customers with Multiple Products
SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    SUM(s.confirmed_amount) / 100.0 AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON s.owner_id = u.id AND s.confirmed_amount > 0
JOIN plans_plan p ON p.owner_id = u.id AND p.is_a_fund = 1 AND p.confirmed_amount > 0
WHERE s.is_regular_savings = 1
GROUP BY u.id, u.name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;
