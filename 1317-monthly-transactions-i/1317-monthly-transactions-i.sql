-- 각 월, 나라, 거래 수, 총 금액, 승인된 거래 수, 승인된 거래의 총 금액
SELECT date_format(trans_date, '%Y-%m') as month,country, count(state) as trans_count,
SUM(CASE when state='approved' then 1 else 0 end) as approved_count,
SUM(amount) as trans_total_amount, 
SUM(CASE WHEN state = 'approved' then amount else 0 end) as approved_total_amount
FROM transactions
GROUP BY date_format(trans_date, '%Y-%m'), country