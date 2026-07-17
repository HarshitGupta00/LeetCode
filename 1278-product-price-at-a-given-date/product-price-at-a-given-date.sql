SELECT product_id , new_price as price 
FROM Products
WHERE (product_id , change_date) IN(
SELECT
    product_id,
    MAX(
        CASE
            WHEN change_date <= '2019-08-16'
            THEN change_date
            ELSE NULL
        END
    )
FROM Products
GROUP BY product_id
)


UNION

SELECT product_id , 10 as price
FROM  
(
    SELECT
    product_id,
    MAX(
        CASE
            WHEN change_date <= '2019-08-16'
            THEN change_date
            ELSE NULL
        END
    ) as change_date 
FROM Products
GROUP BY product_id
)
WHERE change_date is NULL
