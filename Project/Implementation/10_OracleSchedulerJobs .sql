-- ================================================
-- 10 Oracle Scheduler Jobs
-- ================================================


-- ================================================
-- Task 1
-- ================================================

-- creating the job
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_GREET_EMPLOYEES',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN
                                DBMS_OUTPUT.PUT_LINE(''Payroll System Initialized'');
                                INSERT INTO EMPLOYEE_LOG (emp_id, action)
                                VALUES (1, ''SYSTEM JOB EXECUTED'');
                             END;',
        start_date      => SYSTIMESTAMP + INTERVAL '2' MINUTE, --once in 2 mins
        enabled         => TRUE
    );
END;
/

-- testing after 2 mins
SELECT * FROM EMPLOYEE_LOG;


-- ================================================
-- Task 2
-- ================================================

-- creating job

BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name        => 'JOB_DAILY_LEAVE_REPORT',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'DECLARE
                                V_LEAVE_COUNT NUMBER;
                             BEGIN
                                SELECT COUNT(*) INTO V_LEAVE_COUNT
                                FROM LEAVE
                                WHERE TRUNC(LEAVE_DATE) = TRUNC(SYSDATE);
                                INSERT INTO EMPLOYEE_LOG (emp_id, action)
                                VALUES (1, ''DAILY LEAVE REPORT: '' || V_LEAVE_COUNT || '' leave record(s) today'');
                             END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY; BYHOUR=7; BYMINUTE=0; BYSECOND=0',
        enabled         => TRUE
    );
END;
/

-- showing job definition
SELECT * FROM USER_SCHEDULER_JOBS WHERE JOB_NAME =
'JOB_DAILY_LEAVE_REPORT';
