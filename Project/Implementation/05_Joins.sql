-- ================================================
-- 05-Joins
-- ================================================


-- ================================================
-- Task 1
-- ================================================

-- Complete employee profile with latest leave date
SELECT E.EMP_ID, E.FNAME || ' ' || E.LNAME AS FULL_NAME, D.NAME AS DEPARTMENT_NAME,
Q.POSITION AS JOB_TITLE, S.AMOUNT AS SALARY_AMOUNT,
MAX(L.LEAVE_DATE) AS LATEST_LEAVE_DATE FROM EMPLOYEE E
INNER JOIN JOB_DEPARTMENT D ON E.JOB_ID = D.JOB_ID
INNER JOIN SALARY_BONUS S ON E.SALARY_ID = S.SALARY_ID
INNER JOIN QUALIFICATION Q ON E.EMP_ID = Q.EMP_ID
INNER JOIN PAYROLL P ON E.EMP_ID = P.EMP_ID
INNER JOIN LEAVE L ON E.EMP_ID = L.EMP_ID
GROUP BY E.EMP_ID, E.FNAME || ' ' || E.LNAME, D.NAME, Q.POSITION, S.AMOUNT;


-- ================================================
-- Task 2
-- ================================================

-- 1. Employees who have never taken any leave
SELECT E.EMP_ID, E.FNAME, E.LNAME FROM EMPLOYEE E
LEFT JOIN LEAVE L ON L.EMP_ID = E.EMP_ID
WHERE L.LEAVE_ID IS NULL;

-- 2. Departments that have no salary/bonus records
SELECT J.JOB_ID, J.NAME FROM JOB_DEPARTMENT J
LEFT JOIN SALARY_BONUS S ON S.JOB_ID = J.JOB_ID
WHERE S.JOB_ID IS NULL;