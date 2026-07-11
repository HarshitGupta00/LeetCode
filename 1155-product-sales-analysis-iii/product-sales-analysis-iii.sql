-- Write your PostgreSQL query statement below
SELECT  product_id , year as first_year, quantity , price 
FROM Sales s1
WHERE year = (
    SELECT MIN(year)
    FROM Sales s2
    WHERE s1.product_id = s2.product_id
    GROUP BY s1.product_id
)