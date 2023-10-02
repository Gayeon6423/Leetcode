-- confirmation rate : confirmed메세지의 수 / 전체 요청된 confirmation메세지 수
-- confrimation rate = 0 if confirmation 메시지 수 = 0
-- 2자릿수에서 반올림

SELECT S.user_id,
                  CASE WHEN COUNT(c.user_id) = 0 THEN 0
                       ELSE ROUND(SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END)                   / COUNT(C.user_id),2) END as confirmation_rate
FROM Signups as S  
LEFT OUTER JOIN Confirmations as C ON S.user_id = C.user_id
GROUP BY S.user_id

# SELECT S.user_id, 
#        CASE 
#            WHEN COUNT(C.user_id) = 0 THEN 0
#            ELSE ROUND((SUM(CASE WHEN C.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(C.user_id)) * 100, 2)
#        END as confirmation_rate
# FROM Signups as S  
# LEFT OUTER JOIN Confirmations as C ON S.user_id = C.user_id
# GROUP BY S.user_id