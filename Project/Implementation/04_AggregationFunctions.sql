-- ================================================
-- 04-Aggregation Functions
-- ================================================


-- ================================================
-- Task 1
-- ================================================

-- 1. Total number of employees
SELECT COUNT(EMP_ID) AS TOTAL_EMPLOYEES FROM EMPLOYEE;

-- 2. Minimum, maximum and average salary amount
SELECT MIN(AMOUNT) AS MIN_SALARY FROM SALARY_BONUS;
SELECT MAX(AMOUNT) AS MAX_SALARY FROM SALARY_BONUS;
SELECT AVG(AMOUNT) AS AVG_SALARY FROM SALARY_BONUS;

-- 3. Total bonus amount
SELECT SUM(BONUS) AS TOTAL_BONUS FROM SALARY_BONUS;


-- ================================================
-- Task 2
-- ================================================

-- 1. Departments where average employee age exceeds 30
SELECT D.NAME, AVG(E.AGE) AS AVERAGE_AGE FROM JOB_DEPARTMENT D
JOIN EMPLOYEE E ON E.JOB_ID = D.JOB_ID
GROUP BY D.JOB_ID, D.NAME
HAVING AVG(E.AGE) > 30;

-- 2. Job titles shared by more than 2 employees
SELECT Q.POSITION, COUNT(Q.EMP_ID) AS EMPLOYEE_COUNT FROM QUALIFICATION Q
GROUP BY Q.POSITION
HAVING COUNT(Q.EMP_ID) > 2;

-- 3. Months where total payroll amount exceeds 20000
SELECT TO_CHAR(PAY_DATE, 'MONTH') AS MONTH_YEAR,
SUM(TOTAL_AMOUNT) AS TOTAL_PAYROLL FROM PAYROLL
GROUP BY TO_CHAR(PAY_DATE, 'MONTH')
HAVING SUM(TOTAL_AMOUNT) > 20000;


-- ================================================
-- Task 3
-- ================================================

SELECT D.NAME, COUNT(E.EMP_ID), SUM(P.TOTAL_AMOUNT), AVG (S.AMOUNT), MAX(S.AMOUNT),
MIN(S.AMOUNT) FROM EMPLOYEE E
JOIN JOB_DEPARTMENT D ON E.JOB_ID = D.JOB_ID 
JOIN PAYROLL P ON P.PAYROLL_ID = D.PAYROLL_ID
JOIN SALARY_BONUS S ON S.JOB_ID = E.JOB_ID
GROUP BY D.NAME;


-- ================================================
-- Task 4
-- ================================================

--a)
SELECT D.NAME, SUM(P.TOTAL_AMOUNT), AVG(S.AMOUNT) FROM JOB_DEPARTMENT D
JOIN PAYROLL P ON P.PAYROLL_ID = D.PAYROLL_ID
JOIN SALARY_BONUS S ON P.SALARY_ID = S.SALARY_ID GROUP BY D.NAME
HAVING SUM(P.TOTAL_AMOUNT) > 15000 AND AVG(S.AMOUNT) > 3000;

-- b)
SELECT Q.POSITION, COUNT(E.EMP_ID), AVG(E.AGE) FROM QUALIFICATION Q 
JOIN EMPLOYEE E ON E.EMP_ID =Q.EMP_ID GROUP BY Q.POSITION
HAVING COUNT(E.EMP_ID)>2 AND AVG(E.AGE)>28;

--c)
SELECT E.FNAME || ' ' || E.LNAME AS FULL_NAME, D.NAME AS DEPARTMENT, COUNT(L.LEAVE_ID)
FROM EMPLOYEE E
JOIN JOB_DEPARTMENT D ON E.JOB_ID = D.JOB_ID
JOIN LEAVE L ON L.EMP_ID = E.EMP_ID
GROUP BY E.EMP_ID, E.FNAME || ' ' || E.LNAME, D.NAME
HAVING COUNT(L.LEAVE_ID) > 1;

