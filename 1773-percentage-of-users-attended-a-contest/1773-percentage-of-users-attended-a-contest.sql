SELECT contest_id, 
ROUND((COUNT(user_name)*100 / (select count(user_id) from Users)),2) as percentage
FROM Users as U
RIGHT OUTER JOIN Register as R
ON U.user_id = R.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC