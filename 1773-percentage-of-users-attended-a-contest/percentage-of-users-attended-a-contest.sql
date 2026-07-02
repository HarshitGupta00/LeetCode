SELECT
    contest_id,
    ROUND(
        COUNT(r.contest_id) * 100.0 /
        (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
LEFT JOIN Users u
ON r.user_id = u.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;