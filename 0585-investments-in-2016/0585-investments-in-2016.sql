# # Version1 : Inner Join 
# SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
# FROM Insurance I1
# INNER JOIN (
#     SELECT DISTINCT lat 
#     FROM Insurance
#     WHERE lat IN (
#         SELECT lat
#         FROM Insurance
#         GROUP BY lat
#         HAVING COUNT(*) <= 1
#     )
# ) AS I2 ON I1.lat = I2.lat
# GROUP BY I1.lat

# Version2 : Where
SELECT ROUND(SUM(tiv_2016),2) AS tiv_2016
FROM Insurance
WHERE (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1)
AND tiv_2015 IN(
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1)