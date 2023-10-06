SELECT NEW_ID AS id, student
FROM (SELECT student, id,
      CASE
            WHEN MOD(id,2) = 1 AND (id = (SELECT MAX(id) FROM Seat)) THEN id
            WHEN MOD(id,2) = 0 THEN (id - 1)
            WHEN MOD(id,2) = 1 THEN (id + 1)
      END AS NEW_ID
      FROM Seat) AS NEW_SEAT
ORDER BY NEW_ID ASC
