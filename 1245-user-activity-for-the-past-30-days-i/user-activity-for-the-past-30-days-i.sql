SELECT activity_date as day , COUNT(DISTINCT user_id) as active_users 
FROM Activity
WHERE activity_date > DATE '2019-07-27'  - INTERVAL '1 month'
AND activity_date <= DATE'2019-07-27'
GROUP BY activity_date