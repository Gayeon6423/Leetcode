# SELECT query_name, 
#        ROUND(sum(rating / position) / COUNT(query_name),2) as quality 
#        ROUND(SUM(CASE WHEN rating < 3 then 1 ELSE 0 END) * 100 / COUNT(*),2) as poor_query_percentage 
# FROM Queries
# GROUP BY query_name


SELECT QUERY_NAME, ROUND(AVG(RATING/POSITION), 2) AS QUALITY, ROUND(AVG(IF(RATING<3,1,0))*100, 2) AS POOR_QUERY_PERCENTAGE
FROM QUERIES
GROUP BY QUERY_NAME
