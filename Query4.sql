SELECT 
    u.id AS customer_id,
    u.first_name,
    u.last_name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    COUNT(DISTINCT s.id) AS total_transactions,
    ROUND(((COUNT(DISTINCT s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE())) * 12 * 0.001), 2) AS estimated_clv
FROM adashi_staging.users_customuser u
LEFT JOIN adashi_staging.savings_savingsaccount s ON u.id = s.owner_id
WHERE TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) > 0
GROUP BY u.id, u.first_name, u.last_name
ORDER BY estimated_clv DESC;