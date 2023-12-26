# Solution1 : CASE문 => Fail
# SELECT CASE
#             WHEN income < 20000 THEN 'Low Salary'
#             WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
#             ELSE 'High Salary'
#        END AS category,
#        COUNT(account_id) AS accounts_count
# FROM Accounts
# GROUP BY category

# Solution2 : Union All
# Write your MySQL query statement below
select "Low Salary" as category,sum(if(income<20000,1,0)) as accounts_count from accounts 
UNION ALL
select "Average Salary" as category,sum(if(income>=20000 and income<=50000,1,0)) as accounts_count from accounts 
UNION ALL
select "High Salary" as category,sum(if(income>50000,1,0)) as accounts_count from accounts 