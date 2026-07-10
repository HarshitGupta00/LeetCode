-- Write your PostgreSQL query statement below
SELECT MAX(num) as num FROM
(
SELECT num , COUNT(num) as count FROM
MyNumbers
GROUP BY num
)
WHERE count = 1

