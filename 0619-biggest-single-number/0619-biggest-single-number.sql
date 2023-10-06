# SELECT IF(COUNT(num) > 0, MAX(num), null) AS num
# FROM MyNumbers
# GROUP BY num
# HAVING count(num) = 1

# SELECT MAX(num) AS num
# FROM MyNumbers
# GROUP BY num
# HAVING count(num) = 1

SELECT IF(COUNT(num) > 0, MAX(num), null) AS num 
FROM (SELECT num 
      FROM MyNumbers 
      GROUP BY num 
      HAVING COUNT(num) = 1 ) AS NEW;