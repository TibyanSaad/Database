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