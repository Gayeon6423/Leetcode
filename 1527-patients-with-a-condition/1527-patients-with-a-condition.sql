SELECT *
FROM patients
WHERE conditions LIKE 'DIAB1%' OR # DITAB1으로 시작
      conditions LIKE '% DIAB1%' # 어느 위치 든 DIAB1을 포함
