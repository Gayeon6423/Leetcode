SELECT product_name, SUM(unit) as unit
FROM Products P
JOIN Orders O
ON P.product_id = O.product_id
WHERE order_date > '2020-01-31' AND order_date < '2020-03-01'
GROUP BY product_name
HAVING SUM(unit) >= 100