-- Write your PostgreSQL query statement below
SELECT class FROM
(
SELECT class , COUNT(class) as sum  FROM Courses
GROUP BY class
)
WHERE sum >= 5

