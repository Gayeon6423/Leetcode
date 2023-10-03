-- 각 유저에 대해 팔로워들의 수
-- user_id 기준으로 오름차순 정렬

SELECT user_id, count(*) as followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id