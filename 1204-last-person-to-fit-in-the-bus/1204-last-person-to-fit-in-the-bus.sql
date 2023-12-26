# # Solution1 : subquery + sum over function
# SELECT person_name 
# FROM (
#     SELECT turn, weight, person_name, SUM(weight) OVER (ORDER BY turn) as total
#     FROM Queue
# ) AS q
# WHERE total <= 1000
# ORDER BY total DESC
# LIMIT 1

# Solution2 : join + having
SELECT q1.person_name
FROM Queue as q1
join Queue as q2
on q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY sum(q2.weight) desc
limit 1
