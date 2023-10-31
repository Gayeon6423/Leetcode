# SELECT employee_id,
#        CASE 
#           WHEN COUNT(employee_id) = 1 THEN department_id
#           ELSE (SELECT department_id
#                 FROM Employee
#                 WHERE primary_flag = 'Y' LIMIT 1)
#        END AS department_id
# FROM Employee
# GROUP BY employee_id;

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1
UNION
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'