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


-- ================================================
-- Task 3
-- ================================================
SELECT P.PAYROLL_ID, E.FNAME || ' ' || E.LNAME AS FULL_NAME, D.NAME,Q.POSITION,
S.AMOUNT,S.BONUS,L.REASON, P.TOTAL_AMOUNT FROM PAYROLL P
JOIN EMPLOYEE E ON P.EMP_ID = E.EMP_ID
JOIN JOB_DEPARTMENT D ON E.JOB_ID = D.JOB_ID
JOIN SALARY_BONUS S ON P.SALARY_ID = S.SALARY_ID
LEFT JOIN QUALIFICATION Q ON Q.EMP_ID = E.EMP_ID
LEFT JOIN LEAVE L ON L.PAYROLL_ID = P.PAYROLL_ID
ORDER BY D.NAME, P.TOTAL_AMOUNT DESC;

-- ================================================
-- Task 4
-- ================================================

-- adding column
ALTER TABLE EMPLOYEE ADD (manager_id NUMBER REFERENCES EMPLOYEE(emp_ID));

-- a.
UPDATE EMPLOYEE SET manager_id = 1 WHERE emp_ID = 2;
UPDATE EMPLOYEE SET manager_id = 1 WHERE emp_ID = 6;
UPDATE EMPLOYEE SET manager_id = 2 WHERE emp_ID = 7;
UPDATE EMPLOYEE SET manager_id = 3 WHERE emp_ID = 8;
UPDATE EMPLOYEE SET manager_id = 4 WHERE emp_ID = 9;
UPDATE EMPLOYEE SET manager_id = 5 WHERE emp_ID = 10;

-- b.
SELECT  E.EMP_ID, E.FNAME ||' '|| E.LNAME AS EMPLOYEE_NAME,
M.FNAME || ' ' || M.LNAME  AS MANAGER_NAME FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMP_ID
ORDER BY E.EMP_ID;

-- c. 
SELECT DISTINCT M.EMP_ID, M.FNAME, M.LNAME FROM EMPLOYEE M
JOIN EMPLOYEE E ON E.MANAGER_ID = M.EMP_ID;