SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    SUM(s.confirmed_amount) AS total_deposits
FROM adashi_staging.users_customuser u
INNER JOIN adashi_staging.savings_savingsaccount s ON u.id = s.owner_id
INNER JOIN adashi_staging.plans_plan p ON u.id = p.owner_id
WHERE p.is_regular_savings = 1  -- Funded savings plan
AND p.is_a_fund = 1  -- Funded investment plan
GROUP BY u.id, u.name
HAVING savings_count > 0 AND investment_count > 0
ORDER BY total_deposits DESC;