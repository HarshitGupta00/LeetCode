SELECT  employee_id , department_id
FROM Employee
WHERE employee_id IN (SELECT e1.employee_id 
FROM Employee e1
GROUP BY e1.employee_id
HAVING COUNT(e1.department_id) = 1
)
UNION 

SELECT employee_id , department_id
FROM Employee
WHERE primary_flag = 'Y'

