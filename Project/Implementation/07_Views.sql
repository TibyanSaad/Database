-- ================================================
-- 07 Views
-- ================================================

-- ================================================
-- Task 1
-- ================================================

-- View creation
CREATE VIEW VW_EMPLOYEE_SUMMARY AS
SELECT E.EMP_ID,E.FNAME || ' ' || E.LNAME AS FULL_NAME,E.GENDER,E.AGE,D.NAME,Q.POSITION FROM EMPLOYEE E
JOIN JOB_DEPARTMENT D ON E.JOB_ID = D.JOB_ID 
JOIN QUALIFICATION Q ON Q.EMP_ID=E.EMP_ID;

-- (a) Query the view to list all female employees over 30
SELECT * FROM VW_EMPLOYEE_SUMMARY WHERE GENDER ='F' AND AGE>30;


-- (b) Attempt to INSERT a row through the view
INSERT INTO VW_EMPLOYEE_SUMMARY (FULL_NAME, GENDER, AGE, NAME, POSITION) 
VALUES ('Tibyan Saad', 'F', 24, 'IT', 'Trainee');

-- Error starting at line : 8 in command -
-- INSERT INTO VW_EMPLOYEE_SUMMARY (FULL_NAME, GENDER, AGE, NAME, POSITION) VALUES ('Tibyan Saad', 'F', 24, 'IT', 'Trainee')
-- Error at Command Line : 8 Column : 34
-- Error report -
-- SQL Error: ORA-01733: virtual column not allowed here
-- https://docs.oracle.com/error-help/db/ora-01733/01733. 00000 - "virtual column not allowed here"
-- *Cause: An attempt was made to use an INSERT, UPDATE, or DELETE statement on an expression in a view.
-- *Action: INSERT, UPDATE, or DELETE data in the base tables, instead of the view.
-- More Details :
-- https://docs.oracle.com/error-help/db/ora-01733/


-- ================================================
-- Task 2
-- ================================================


-- View creation
CREATE VIEW VW_PAYROLL_DASHBOARD AS
SELECT P.PAYROLL_ID, E.FNAME || ' ' || E.LNAME AS FULL_NAME, D.NAME,S.AMOUNT,S.BONUS,
L.REASON,P.PAY_DATE,P.TOTAL_AMOUNT FROM EMPLOYEE E
JOIN JOB_DEPARTMENT D ON D.JOB_ID = E.JOB_ID
JOIN PAYROLL P ON P.PAYROLL_ID =D.PAYROLL_ID
JOIN SALARY_BONUS S ON S.JOB_ID = D.JOB_ID
JOIN LEAVE L ON L.PAYROLL_ID = P.PAYROLL_ID;

-- Query the view to find the top 5 payroll records by total_amount.
SELECT * FROM VW_PAYROLL_DASHBOARD ORDER BY TOTAL_AMOUNT DESC FETCH FIRST 5 ROWS ONLY;