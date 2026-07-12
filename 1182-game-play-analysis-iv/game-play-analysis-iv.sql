SELECT ROUND(
    AVG( 
     CASE 
          WHEN event_date  = next_date - 1 THEN 1
          ELSE 0
     END
) , 2) AS fraction FROM 
(
SELECT player_id , event_date , 
LEAD(event_date) OVER (
    PARTITION BY player_id
    ORDER BY event_date
) as next_date ,
ROW_NUMBER() OVER (
    PARTITION BY player_id
    ORDER BY event_date
)as rn 
FROM Activity
)
WHERE rn = 1
