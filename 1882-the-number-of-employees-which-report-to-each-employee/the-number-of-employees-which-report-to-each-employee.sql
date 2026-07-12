SELECT
    e1.employee_id,
    e1.name,
    e2.reports_count,
    e2.average_age
FROM (
    SELECT employee_id, name
    FROM Employees
    WHERE employee_id IN (
        SELECT reports_to
        FROM Employees
        WHERE reports_to IS NOT NULL
    )
) AS e1
JOIN (
    SELECT
        reports_to,
        COUNT(*) AS reports_count,
        ROUND(AVG(age)) AS average_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
) AS e2
ON e1.employee_id = e2.reports_to
ORDER BY e1.employee_id;