# SELECT user_id, MAX(MAX(request_count) + MAX(accept_count))
# FROM (
#     SELECT requester_id AS user_id, COUNT(requester_id) AS request_count, NULL AS accept_count
#     FROM RequestAccepted
#     GROUP BY requester_id
#     UNION ALL
#     SELECT accepter_id AS user_id, NULL AS request_count, COUNT(accepter_id) AS accept_count
#     FROM RequestAccepted
#     GROUP BY accepter_id
# ) AS RA
# GROUP BY user_id;

# WITH tmp AS(SELECT requester_id AS id
#             FROM RequestAccepted
#             UNION ALL
#             SELECT accepter_id AS id
#             FROM RequestAccepted
#             )
# SELECT id, COUNT(id) AS num
# FROM tmp
# GROUP BY id
# ORDER BY COUNT(id) DESC
# LIMIT 1

SELECT id, COUNT(id) AS num
FROM(
  SELECT requester_id AS id
  FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id
  FROM RequestAccepted
) AS tmp
GROUP BY id
ORDER BY COUNT(id) DESC
LIMIT 1