SELECT 
    CASE 
        WHEN subquery.transactions_per_month >= 10 THEN 'High Frequency'
        WHEN subquery.transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(DISTINCT subquery.owner_id) AS customer_count,
    ROUND(AVG(subquery.transactions_per_month), 1) AS avg_transactions_per_month
FROM (
    SELECT 
        s.owner_id,
        COUNT(s.id) / TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS transactions_per_month
    FROM adashi_staging.savings_savingsaccount s
    JOIN adashi_staging.users_customuser u ON s.owner_id = u.id
    WHERE TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) > 0
    GROUP BY s.owner_id
) AS subquery
GROUP BY frequency_category
ORDER BY avg_transactions_per_month DESC;