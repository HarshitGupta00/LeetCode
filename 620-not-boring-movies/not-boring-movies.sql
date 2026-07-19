-- Write your PostgreSQL query statement below
select id,movie,description,rating
from (
    select * 
    from Cinema
    where id % 2 = 1
)
where description != 'boring'
order by rating desc