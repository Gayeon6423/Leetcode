# salary가 가장 크지 않은 salary 중에서 최대값 출력(=두번째로 큰 값)
# SELECT MAX(salary) AS SecondHighestSalary 
# FROM Employee
# WHERE salary NOT IN (SELECT MAX(salary) FROM Employee)

# OFFSET으로 내림차순 정렬된 결과에서 첫번째 값 무시
SELECT(SELECT DISTINCT Salary 
       FROM Employee
       ORDER BY Salary DESC
       LIMIT 1 OFFSET 1)AS SecondHighestSalary