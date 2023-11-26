# # 윈도우 함수 사용 => wrong Answer
# SELECT visited_on, amount,
#         AVG(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) 
#         AS average_amount
# FROM Customer

SELECT visited_on, amount, ROUND(amount/7, 2) AS average_amount
FROM
(
    SELECT DISTINCT visited_on,
    SUM(amount) OVER (ORDER BY visited_on range BETWEEN interval 6 day preceding AND current row) amount,
    MIN(visited_on) OVER() 1ST_date
    FROM customer
) t
WHERE visited_on >= 1st_date + 6