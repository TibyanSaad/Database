-- ================================================
-- 06-Subqueries
-- ================================================


-- ================================================
-- Task 1
-- ================================================

-- 1. Employees earning above company average salary
SELECT E.EMP_ID, E.FNAME || ' ' || E.LNAME AS FULL_NAME,
D.NAME, S.AMOUNT AS SALARY FROM EMPLOYEE E
JOIN SALARY_BONUS S   ON E.SALARY_ID  = S.SALARY_ID
JOIN JOB_DEPARTMENT D ON E.JOB_ID     = D.JOB_ID
WHERE S.AMOUNT > (SELECT AVG(SB.AMOUNT) FROM SALARY_BONUS SB);

-- 2. Department with the highest total payroll amount
SELECT D.NAME, SUM(P.TOTAL_AMOUNT)
FROM JOB_DEPARTMENT D
JOIN PAYROLL P ON P.PAYROLL_ID = D.PAYROLL_ID
GROUP BY D.NAME
HAVING SUM(P.TOTAL_AMOUNT) = (SELECT MAX(TOTAL_AMOUNT) FROM PAYROLL);


-- ================================================
-- Task 2
-- ================================================

-- 1. Employees in departments with bonus greater than 500
SELECT E.EMP_ID, E.FNAME, E.LNAME FROM EMPLOYEE E
WHERE E.JOB_ID IN (SELECT S.JOB_ID FROM SALARY_BONUS S
WHERE S.BONUS > 500);

-- 2. Employees earning more than ALL salaries in Maintenance department
SELECT E.EMP_ID, E.FNAME, E.LNAME, S.AMOUNT FROM EMPLOYEE E
JOIN SALARY_BONUS S ON E.SALARY_ID = S.SALARY_ID
WHERE S.AMOUNT > ALL (SELECT S2.AMOUNT FROM SALARY_BONUS S2
JOIN JOB_DEPARTMENT D ON D.JOB_ID = S2.JOB_ID
WHERE D.NAME = 'Maintenance');

-- 3. Employees earning more than ANY salary in HR department
SELECT E.EMP_ID, E.FNAME, E.LNAME, S.AMOUNT FROM EMPLOYEE E
JOIN SALARY_BONUS S ON E.SALARY_ID = S.SALARY_ID
WHERE S.AMOUNT > ANY (SELECT S2.AMOUNT FROM SALARY_BONUS S2
JOIN JOB_DEPARTMENT D ON D.JOB_ID = S2.JOB_ID
WHERE D.NAME = 'Human Resources');