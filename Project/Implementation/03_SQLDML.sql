-- ================================================
-- 03-SQL DML — INSERT / UPDATE / DELETE / SELECT
-- ================================================


-- ================================================
-- Task 1
-- ================================================

-- Sequences
CREATE SEQUENCE job_dept_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE salary_bonus_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE employee_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE payroll_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE leave_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE qualification_seq START WITH 1 INCREMENT BY 1;

-- 5 departments
INSERT INTO JOB_DEPARTMENT (job_dept, name, description, salary_range)
VALUES ('HR', 'Human Resources', 'Manages employee relations and recruitment', '3000-6000');

INSERT INTO JOB_DEPARTMENT (job_dept, name, description, salary_range)
VALUES ('IT', 'Information Technology', 'Manages systems, networks and software development', '4000-9000');

INSERT INTO JOB_DEPARTMENT (job_dept, name, description, salary_range)
VALUES ('FIN', 'Finance', 'Handles budgeting, accounting and financial reporting', '3500-7000');

INSERT INTO JOB_DEPARTMENT (job_dept, name, description, salary_range)
VALUES ('OPS', 'Operations', 'Oversees daily business operations and logistics', '3000-6500');

INSERT INTO JOB_DEPARTMENT (job_dept, name, description, salary_range)
VALUES ('MKT', 'Marketing', 'Manages branding, campaigns and market research', '3000-7000');

-- 5 salary records
INSERT INTO SALARY_BONUS (amount, annual, bonus, job_ID)
VALUES (4500, 54000, 1000, 1);

INSERT INTO SALARY_BONUS (amount, annual, bonus, job_ID)
VALUES (7000, 84000, 2000, 2);

INSERT INTO SALARY_BONUS (amount, annual, bonus, job_ID)
VALUES (5500, 66000, 1500, 3);

INSERT INTO SALARY_BONUS (amount, annual, bonus, job_ID)
VALUES (5000, 60000, 1200, 4);

INSERT INTO SALARY_BONUS (amount, annual, bonus, job_ID)
VALUES (5200, 62400, 1300, 5);

-- 10 employees
INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Mohammed', 'Al-Rashidi', 'M', 35, 'mohammed.rashidi@ems.com', 'Pass@1234', 1, 1);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Fatima', 'Al-Balushi', 'F', 28, 'fatima.balushi@ems.com', 'Pass@1234', 2, 2);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Ahmed', 'Al-Harthi', 'M', 42, 'ahmed.harthi@ems.com', 'Pass@1234', 3, 3);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Maryam', 'Al-Zadjali', 'F', 31, 'maryam.zadjali@ems.com', 'Pass@1234', 4, 4);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Khalid', 'Al-Farsi', 'M', 38, 'khalid.farsi@ems.com', 'Pass@1234', 5, 5);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Noura', 'Al-Habsi', 'F', 26, 'noura.habsi@ems.com', 'Pass@1234', 1, 1);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Omar', 'Al-Maskari', 'M', 33, 'omar.maskari@ems.com', 'Pass@1234', 2, 2);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Aisha', 'Al-Lawati', 'F', 29, 'aisha.lawati@ems.com', 'Pass@1234', 3, 3);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Yousuf', 'Al-Mamari', 'M', 45, 'yousuf.mamari@ems.com', 'Pass@1234', 4, 4);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID, salary_ID)
VALUES ('Hessa', 'Al-Siyabi', 'F', 30, 'hessa.siyabi@ems.com', 'Pass@1234', 5, 5);

-- 8 payroll records
INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'January payroll processed', 5500, 1, 1);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'January payroll processed', 9000, 2, 2);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'January payroll processed', 7000, 3, 3);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'January payroll processed', 6200, 4, 4);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-01-31', 'YYYY-MM-DD'), 'January payroll processed', 6500, 5, 5);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'February payroll processed', 5500, 1, 1);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'February payroll processed', 9000, 2, 2);

INSERT INTO PAYROLL (pay_date, report, total_amount, emp_ID, salary_ID)
VALUES (TO_DATE('2025-02-28', 'YYYY-MM-DD'), 'February payroll processed', 7000, 3, 3);

-- 5 leave records
INSERT INTO LEAVE (leave_date, reason, emp_ID, payroll_ID)
VALUES (TO_DATE('2025-01-10', 'YYYY-MM-DD'), 'Medical leave for surgery recovery', 1, 1);

INSERT INTO LEAVE (leave_date, reason, emp_ID, payroll_ID)
VALUES (TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Annual vacation leave', 2, 2);

INSERT INTO LEAVE (leave_date, reason, emp_ID, payroll_ID)
VALUES (TO_DATE('2025-02-05', 'YYYY-MM-DD'), 'Family emergency', 3, 3);

INSERT INTO LEAVE (leave_date, reason, emp_ID, payroll_ID)
VALUES (TO_DATE('2025-02-12', 'YYYY-MM-DD'), 'Maternity leave', 4, 4);

INSERT INTO LEAVE (leave_date, reason, emp_ID, payroll_ID)
VALUES (TO_DATE('2025-02-20', 'YYYY-MM-DD'), 'Sick leave', 5, 5);

-- 5 qualification records
INSERT INTO QUALIFICATION (position, date_in, emp_ID)
VALUES ('HR Manager', TO_DATE('2018-03-15', 'YYYY-MM-DD'), 1);

INSERT INTO QUALIFICATION (position, date_in, emp_ID)
VALUES ('Senior Developer', TO_DATE('2019-06-01', 'YYYY-MM-DD'), 2);

INSERT INTO QUALIFICATION (position, date_in, emp_ID)
VALUES ('Financial Analyst', TO_DATE('2017-09-20', 'YYYY-MM-DD'), 3);

INSERT INTO QUALIFICATION (position, date_in, emp_ID)
VALUES ('Operations Supervisor', TO_DATE('2020-01-10', 'YYYY-MM-DD'), 4);

INSERT INTO QUALIFICATION (position, date_in, emp_ID)
VALUES ('Marketing Specialist', TO_DATE('2021-05-25', 'YYYY-MM-DD'), 5);

-- 10 EMPLOYEE_ADDRESS records
INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (1, 'Muscat, Al Khuwair, Street 12, Villa 5');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (2, 'Muscat, Madinat Al Sultan Qaboos, Street 7, Flat 3');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (3, 'Muscat, Ruwi, Street 4, Building 9');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (4, 'Muscat, Qurum, Street 18, Villa 2');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (5, 'Muscat, Al Azaiba, Street 22, Flat 7');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (6, 'Muscat, Bowsher, Street 3, Villa 11');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (7, 'Muscat, Al Ghubrah, Street 9, Flat 1');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (8, 'Muscat, Wattayah, Street 6, Building 4');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (9, 'Muscat, Al Mabelah, Street 14, Villa 8');

INSERT INTO EMPLOYEE_ADDRESS (emp_ID, contact_add)
VALUES (10, 'Muscat, Al Hail, Street 5, Flat 2');

-- 5 QUALIFICATION_REQUIREMENTS records
INSERT INTO QUALIFICATION_REQUIREMENTS (qual_ID, requirements)
VALUES (1, 'Bachelor degree in Human Resources or Business Administration');

INSERT INTO QUALIFICATION_REQUIREMENTS (qual_ID, requirements)
VALUES (2, 'Bachelor degree in Computer Science or Software Engineering');

INSERT INTO QUALIFICATION_REQUIREMENTS (qual_ID, requirements)
VALUES (3, 'Bachelor degree in Finance or Accounting');

INSERT INTO QUALIFICATION_REQUIREMENTS (qual_ID, requirements)
VALUES (4, 'Bachelor degree in Business Management or Operations');

INSERT INTO QUALIFICATION_REQUIREMENTS (qual_ID, requirements)
VALUES (5, 'Bachelor degree in Marketing or Communications');

-- Filling JOB_DEPARTMENT payroll_ID column
UPDATE JOB_DEPARTMENT SET payroll_ID = 1 WHERE job_ID = 1;
UPDATE JOB_DEPARTMENT SET payroll_ID = 2 WHERE job_ID = 2;
UPDATE JOB_DEPARTMENT SET payroll_ID = 3 WHERE job_ID = 3;
UPDATE JOB_DEPARTMENT SET payroll_ID = 4 WHERE job_ID = 4;
UPDATE JOB_DEPARTMENT SET payroll_ID = 5 WHERE job_ID = 5;

COMMIT;


-- ================================================
-- Task 2
-- ================================================

-- Employees between age 25 and 40 ordered by last name
SELECT * FROM EMPLOYEE WHERE AGE>25 AND AGE <40 ORDER BY LNAME ASC;

-- Employees with payroll total amount greater than 5000
SELECT E.FNAME,E.LNAME,J.NAME, P.* FROM EMPLOYEE E 
JOIN JOB_DEPARTMENT J ON E.JOB_ID = J.JOB_ID 
JOIN PAYROLL P ON P.PAYROLL_ID = J.PAYROLL_ID 
WHERE TOTAL_AMOUNT>5000;

-- Employees who took sick leave
SELECT E.FNAME, E.LNAME , L.REASON FROM EMPLOYEE E 
JOIN LEAVE L ON E.EMP_ID=L.EMP_ID WHERE LOWER(L.REASON) LIKE LOWER('%sick%');

-- Departments and their employees
SELECT D.NAME FROM EMPLOYEE E
JOIN JOB_DEPARTMENT D ON D.JOB_ID = E.JOB_ID WHERE(SELECT JOB_ID FROM EMPLOYEE);


-- ================================================
-- Task 3
-- ================================================

-- Give a 10% salary increase to all employees in the 'Engineering' department
UPDATE SALARY_BONUS SET BONUS = BONUS * 1.10
WHERE JOB_ID IN (SELECT JOB_ID FROM JOB_DEPARTMENT WHERE NAME = 'Engineering');

-- Update the emp_email of all employees to lowercase using Oracle's LOWER() function.
UPDATE EMPLOYEE SET EMP_EMAIL = LOWER(EMP_EMAIL);

-- Set the salary_range in JOB_DEPARTMENT to 'REVISED' for any department whose average total payroll
-- exceeds 8000.
UPDATE JOB_DEPARTMENT SET SALARY_RANGE = 'REVISED' WHERE JOB_ID IN 
(SELECT D.JOB_ID FROM JOB_DEPARTMENT D
JOIN EMPLOYEE E ON E.JOB_ID = D.JOB_ID
JOIN PAYROLL P ON P.EMP_ID = E.EMP_ID
GROUP BY D.JOB_ID HAVING AVG(P.TOTAL_AMOUNT) > 8000); 


-- ================================================
-- Task 4
-- ================================================

SELECT * FROM LEAVE;

-- Delete all LEAVE records older than 2 years from today.
DELETE FROM LEAVE WHERE LEAVE_DATE < ADD_MONTHS(SYSDATE, -24);

-- Delete QUALIFICATION records for employees who no longer exist in the EMPLOYEE table
DELETE FROM QUALIFICATION WHERE EMP_ID NOT IN 
(SELECT EMP_ID FROM EMPLOYEE);

-- Before executing (b), write a SELECT to preview which records would be deleted.
-- After each DELETE, verify the result with a SELECT COUNT(*).
SELECT COUNT(*) FROM QUALIFICATION WHERE EMP_ID NOT IN 
(SELECT EMP_ID FROM EMPLOYEE);




