(
SELECT U.name AS results
FROM MovieRating MR, Users U
WHERE MR.user_id = U.user_id
GROUP BY MR.user_id
# COUNT(1):레코드 수 count,각 사용자가 몇 개의 영화 평가했는지 갯수
ORDER BY COUNT(1) DESC, U.name # 영화 평가 수로 내림차순, 이름으로 오름차순
LIMIT 1 # 하나의 행만 남김
)
UNION ALL
(
SELECT M.title AS results
FROM MovieRating MR, Movies M
WHERE MR.movie_id = M.movie_id AND MR.created_at LIKE '2020-02%'
GROUP BY MR.movie_id
# AVG(rating) : 평점 평균
ORDER BY AVG(rating) DESC, M.title # 영화 평점으로 내림차순, 제목으로 오름차순
LIMIT 1
)