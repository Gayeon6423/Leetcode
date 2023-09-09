SELECT E.name, B.bonus
FROM Employee as E
LEFT OUTER JOIN Bonus as B
ON E.empId = B.empId
WHERE B.bonus < 1000 OR B.bonus IS NULL