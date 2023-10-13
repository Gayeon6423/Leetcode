# SELECT ROUND(A1.player_id / (SELECT COUNT(DISTINCT player_id) FROM Activity),2) AS fraction
# FROM Activity as A1
# JOIN Activity as A2
# ON A1.player_id = A2.player_id
# WHERE DATEDIFF(A1.event_date, A2.event_date) = 1

SELECT ROUND(COUNT(A2.player_id) / COUNT(A1.player_id), 2) As fraction 
FROM Activity A1 
LEFT OUTER JOIN Activity A2 
ON A2.player_id = A1.player_id 
AND DATEDIFF(A2.event_date,A1.event_date) = 1
WHERE (A1.player_id, A1.event_date) IN (SELECT player_id, MIN(event_date) 
                                        FROM Activity 
                                        GROUP BY player_id )