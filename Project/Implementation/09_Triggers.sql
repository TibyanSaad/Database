-- ================================================
-- 09 Triggers
-- ================================================


-- ================================================
-- Task 1
-- ================================================


-- removing the default sequence added at table creation
ALTER TABLE EMPLOYEE MODIFY (EMP_ID NUMBER);

-- creating sequence 
CREATE SEQUENCE EMP_SEQ START WITH 11 INCREMENT BY 1;

-- creating trigger
CREATE OR REPLACE TRIGGER TRG_EMP_ID
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
WHEN (NEW.EMP_ID IS NULL)
BEGIN
    SELECT EMP_SEQ.NEXTVAL INTO :NEW.EMP_ID FROM DUAL;
END;
/

-- tesing the trigger
INSERT INTO EMPLOYEE (FNAME, LNAME, GENDER, AGE, EMP_EMAIL, EMP_PASS, JOB_ID, SALARY_ID)
VALUES ('Lina', 'Al-Busaidi', 'F', 27, 'lina.busaidi@ems.com', 'Pass@9012', 2, 2);

INSERT INTO EMPLOYEE (FNAME, LNAME, GENDER, AGE, EMP_EMAIL, EMP_PASS, JOB_ID, SALARY_ID)
VALUES ('Mariam', 'Al-Riyami', 'F', 26, 'mariam.riyami@ems.com', 'Pass@3344', 3, 3);

-- checking 
SELECT * FROM EMPLOYEE;


-- ================================================
-- Task 2
-- ================================================

-- creating EMPLOYEE_LOG table w/sequence
CREATE SEQUENCE employee_log_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE EMPLOYEE_LOG (
log_id NUMBER DEFAULT employee_log_seq.NEXTVAL PRIMARY KEY,
emp_id NUMBER NOT NULL,
action VARCHAR2(50) NOT NULL,
log_timestamp TIMESTAMP DEFAULT SYSTIMESTAMP,
CONSTRAINT fk_log_emp FOREIGN KEY (emp_id)
REFERENCES EMPLOYEE(emp_id)
);


-- creating trigger
CREATE OR REPLACE TRIGGER TRG_EMP_WELCOME_LOG
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEE_LOG (emp_id, action)
    VALUES (:NEW.EMP_ID, 'NEW HIRE');
END;
/


-- inserting records for testing
INSERT INTO EMPLOYEE (FNAME, LNAME, GENDER, AGE, EMP_EMAIL, EMP_PASS, JOB_ID, SALARY_ID)
VALUES ('Yaqoub', 'Al-Amri', 'M', 32, 'yaqoub.amri@ems.com', 'Pass@7788', 4, 4);

INSERT INTO EMPLOYEE (FNAME, LNAME, GENDER, AGE, EMP_EMAIL, EMP_PASS, JOB_ID, SALARY_ID)
VALUES ('Salma', 'Al-Wahaibi', 'F', 29, 'salma.wahaibi@ems.com', 'Pass@4455', 5, 5);


-- checking 
SELECT * FROM EMPLOYEE_LOG;