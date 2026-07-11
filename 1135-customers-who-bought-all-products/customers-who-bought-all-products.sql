-- Write your PostgreSQL query statement below
SELECT customer_id FROM
(
    SELECT customer_id , COUNT(DISTINCT product_key) as no_of_prod
FROM Customer
GROUP BY customer_id
) as c
WHERE c.no_of_prod = (
    SELECT COUNT(product_key) 
    FROM Product p
)

