SELECT 
    id AS plan_id,
    owner_id,
    'Savings' AS type,
    MAX(created_on) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(created_on)) AS inactivity_days
FROM savings_savingsaccount
WHERE confirmed_amount > 0
GROUP BY id, owner_id

UNION

SELECT 
    id AS plan_id,
    owner_id,
    'Investment' AS type,
    MAX(created_on) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(created_on)) AS inactivity_days
FROM plans_plan
WHERE amount > 0
GROUP BY id, owner_id
HAVING inactivity_days > 365;
