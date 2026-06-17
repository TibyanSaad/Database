-- ================================================
-- 08 Stored Procedures & Functions
-- ================================================


-- ================================================
-- Task 1
-- ================================================


-- Create procedure
CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    P_FNAME      IN EMPLOYEE.FNAME%TYPE,
    P_LNAME      IN EMPLOYEE.LNAME%TYPE,
    P_GENDER     IN EMPLOYEE.GENDER%TYPE,
    P_AGE        IN EMPLOYEE.AGE%TYPE,
    P_EMP_EMAIL  IN EMPLOYEE.EMP_EMAIL%TYPE,
    P_EMP_PASS   IN EMPLOYEE.EMP_PASS%TYPE,
    P_JOB_ID     IN EMPLOYEE.JOB_ID%TYPE,
    P_SALARY_ID  IN EMPLOYEE.SALARY_ID%TYPE
)
IS
BEGIN
    INSERT INTO EMPLOYEE (FNAME, LNAME, GENDER, AGE, EMP_EMAIL, EMP_PASS, JOB_ID, SALARY_ID)
    VALUES (P_FNAME, P_LNAME, P_GENDER, P_AGE, P_EMP_EMAIL, P_EMP_PASS, P_JOB_ID, P_SALARY_ID);

    DBMS_OUTPUT.PUT_LINE('Employee ' || P_FNAME || ' ' || P_LNAME || ' added successfully.');

    COMMIT;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        RAISE_APPLICATION_ERROR(-20001, 'Error: Email already exists in the system.');
END;
/


-- Testing

SET SERVEROUTPUT ON;
EXEC SP_ADD_EMPLOYEE('Salim', 'Al-Kindi', 'M',27, 'salim.kindi@ems.com','Pass@5678',1,1);
EXEC SP_ADD_EMPLOYEE('Salim', 'Al-Kindi', 'M',27, 'salim.kindi@ems.com','Pass@5678',1,1);

-- ERROR at line 1:
-- ORA-20001: Error: Email already exists in the system.
-- ORA-06512: at "PROJ.SP_ADD_EMPLOYEE", line 21
-- ORA-06512: at line 1


-- ================================================
-- Task 2
-- ================================================



-- Create procedure
CREATE OR REPLACE FUNCTION FN_NET_SALARY (
    P_EMP_ID IN EMPLOYEE.EMP_ID%TYPE
)
RETURN NUMBER
IS
    V_NET_SALARY NUMBER;
BEGIN
    SELECT S.AMOUNT + S.BONUS INTO V_NET_SALARY
    FROM EMPLOYEE E
    JOIN SALARY_BONUS S ON E.SALARY_ID = S.SALARY_ID
    WHERE E.EMP_ID = P_EMP_ID;

    RETURN V_NET_SALARY;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;
/

-- using procedure in a select statement
SELECT E.EMP_ID,E.FNAME || ' ' || E.LNAME AS FULL_NAME,FN_NET_SALARY(E.EMP_ID) AS NET_SALARY
FROM EMPLOYEE E ORDER BY NET_SALARY DESC;


