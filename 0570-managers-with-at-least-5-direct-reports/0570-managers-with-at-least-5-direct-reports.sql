SELECT name
FROM Employee
WHERE id IN (SELECT managerId 
            FROM Employee
            GROUP BY managerID
            HAVING COUNT(*) >= 5)