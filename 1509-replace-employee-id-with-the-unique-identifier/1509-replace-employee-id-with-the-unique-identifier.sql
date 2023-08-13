SELECT
    -- EmployeeUNI 테이블의 unique_id 열을 결과의 unique_id 열로 선택합니다.
    euni.unique_id AS unique_id,
    -- Employees 테이블의 name 열을 결과의 name 열로 선택합니다.
    e.name AS name
FROM
    -- Employees 테이블을 'e'라는 별칭으로 사용합니다.
    Employees e
-- Employees 테이블과 EmployeeUNI 테이블을 id 열을 기반으로 왼쪽 조인합니다.
LEFT JOIN
    EmployeeUNI euni
ON
    e.id = euni.id;