# # where 사용 version
# SELECT product_id, year as first_year, quantity, price
# FROM Sales
# WHERE (product_id, year) IN 
# (select product_id, MIN(year) from Sales GROUP BY product_id)

# subquery 사용 version
SELECT s.product_id, s.year as first_year, quantity, price
FROM sales as s
JOIN (select product_id, MIN(year) AS min_year FROM Sales GROUP BY product_id) subq
ON s.product_id = subq.product_id AND s.year = subq.min_year