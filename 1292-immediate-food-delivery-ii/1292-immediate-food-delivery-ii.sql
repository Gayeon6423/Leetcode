# Version1
# SELECT ROUND((COUNT(*)*100) / (SELECT COUNT(DISTINCT customer_id) FROM Delivery),2) AS immediate_percentage
# FROM Delivery AS D1
# WHERE order_date = (
#     SELECT MIN(order_date)
#     FROM Delivery AS D2
#     WHERE D1.customer_id = D2.customer_id
#     GROUP BY D2.customer_id)
#     AND D1.order_date  = D1.customer_pref_delivery_date ;

# Version2
SELECT ROUND(AVG(order_date = customer_pref_delivery_date)*100,2) as immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) in
      (SELECT customer_id, MIN(order_date)
      FROM Delivery
      GROUP BY customer_id)