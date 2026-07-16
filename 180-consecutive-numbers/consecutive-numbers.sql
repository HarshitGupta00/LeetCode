SELECT DISTINCT num as ConsecutiveNums
FROM(
SELECT
    num,
    CASE
        WHEN LEAD(num) OVER (ORDER BY id) = num
         AND LAG(num) OVER (ORDER BY id) = num
        THEN 'YES'
        ELSE 'NO'
    END AS status
FROM Logs
)
WHERE status = 'YES';






