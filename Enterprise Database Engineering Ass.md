## **Enterprise Database Engineering Assignment**

#### **Part 1 – Research \& Understanding**

##### **View**



**1. What is a View?**

A view is a virtual table based on a SELECT query. It does not store data itself but, it pulls data from the underlying tables every time it is queried. 

Syntax:

CREATE VIEW VIEW\_NAME AS

SELECT column1, column2

FROM table\_name

WHERE condition;

Types:

1\. Simple View: Based on one table, no aggregate functions, DML allowed.

CREATE VIEW EMP\_VIEW AS

SELECT FIRST\_NAME, SALARY

FROM EMPLOYEES;

2\. Complex View: Based on multiple tables or uses aggregate functions.

CREATE VIEW DEPT\_AVG\_SALARY AS

SELECT D.DEPARTMENT\_NAME, AVG(E.SALARY) AS AVG\_SALARY

FROM EMPLOYEES E

JOIN DEPARTMENTS D ON E.DEPARTMENT\_ID = D.DEPARTMENT\_ID

GROUP BY D.DEPARTMENT\_NAME;

3\. Read Only View: Cannot perform DML operations on it, nobody can modify data through it.

CREATE VIEW EMP\_VIEW AS

SELECT FIRST\_NAME, SALARY

FROM EMPLOYEES

WITH READ ONLY;

4\. Force View: Creates view even if the base table does not exist yet.

CREATE FORCE VIEW EMP\_VIEW AS

SELECT FIRST\_NAME, SALARY

FROM FUTURE\_TABLE;





**2. Why do companies use Views?**

1\. Security: Hide sensitive data from certain users, so data is hidden from unauthorized users.

2\. Simplicity: Hide complex queries behind a simple name.

3\. Consistency: Ensures everyone queries data the same way.

4\. Reusability: Write the query once and use it everywhere.

5\. Data Abstraction: Hide the complexity of the database structure.





**3. What security benefits do Views provide?**

1. Column \& row level security: Restricts which rows/columns a user can see, users only see data relevant to them, sensitive columns can be hidden from unauthorized users.

2\. Hide Business Logic: Users cannot see the underlying table structure, relationships, or business rules so they only see what the view exposes.

3\. Read Only Protection: Views can be created with WITH READ ONLY — preventing users from modifying data through the view.

4\. Grant Access to Views Not Tables: Access to base tables can be revoked and replaced with view access hence giving companies full control over what each user can do.





**4. What is the difference between:**

* Table:  is a physical object that permanently stores data on disk, allowing full DML operations like INSERT, UPDATE and DELETE. The original document
* View: A window to see the document
* Materialized View: is a physical snapshot of a query result that is stored on disk like a table, but unlike a regular view it does not always reflect the latest data. A photocopy of the document at a point in time.





**5. Give at least three enterprise use cases.**

1\. Human Resources

HR departments create views to control who sees employee salary information. Managers can see salaries of their own department only while junior staff see only names and job titles. Payroll team sees full salary and bank details while other departments see none of that information.

2\. Banking and Finance

Banks create views to expose only approved financial data to different departments. Tellers can see account balances but cannot see full account numbers, credit scores, or transaction history. Risk analysts get a different view with aggregated financial data while hiding individual customer details.

3\. Government and Compliance

Government agencies use views to ensure only legally authorized personnel access sensitive citizen data. Views are designed to comply with regulations like GDPR by exposing only consented and anonymized data to analysts while hiding personally identifiable information from unauthorized users.

\-------------------------------------------------------------------------------------------------------------------

##### **Procedure**



**1. What is a Stored Procedure?**

A stored procedure is a precompiled SQL code that can be saved and reused. If you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it. A stored procedure can also have parameters, so it can act based on the parameter value that is passed.





**2. Why do companies use Procedures?**

* Code Reusability: The same procedure can be called from various applications
* Improved Performance: Stored procedures are precompiled and runs faster
* Database Security: You can set users permission to run a specific procedure (limits direct access to tables)
* Easy Maintenance: When updating a procedure, it automatically updates all its use





**3. What problems do Procedures solve?**

1\. Code Duplication: A stored procedure writes the logic once and every application calls it by name, eliminating repetition entirely

2\. Inconsistent Business Logic: Stored procedures centralise all business logic in one place ensuring everyone follows the same rules.

3\. Security Risks: users are granted execute permission only so, they interact with data through the procedure without ever touching the base tables directly

4\. No Error Handling: Stored procedures support exception handling, meaning errors can be caught, logged and managed without crashing the application





**4. What is the difference between procedure \& function?**

Procedure: Performing actions like INSERT, UPDATE, DELETE

Function: Calculating and returning a single value

|**Feature**|**Procedure**|**Function**|
|-|-|-|
|**Purpose**|Performs an action|Returns a value|
|**Return Value**|Does not return a value|Must return a value|
|**Used in SELECT**|Cannot be used|Can be used|
|**Parameters**|IN, OUT, IN OUT|IN only|





**5. Give at least three enterprise use cases.**

1\. Banking in Money Transfer

When a customer transfers money between accounts, a stored procedure ensures both the debit and credit happen together. If one fails, the entire transaction is rolled back, preventing money from being lost or duplicated.

2\. Retail in Stock Management

Every time a customer places an order, a stored procedure automatically deducts the purchased quantity from stock, updates the order status and triggers a restock alert if stock falls below the minimum level.

3\.  Healthcare in Patient Registration

When a new patient registers, a stored procedure creates the patient record, assigns a unique patient ID, schedules an initial appointment and notifies the assigned doctor, all in one transaction.

\-------------------------------------------------------------------------------------------------------------------



##### **Triggers**



**1. What is a Trigger?**

A statement that a system executes automatically when there is any modification to the database. In a trigger, we first specify when the trigger is to be executed and then the action to be performed when the trigger executes. Triggers are used to specify certain integrity constraints and referential constraints that cannot be specified using the constraint mechanism of SQL. 

Types of Triggers:

* AFTER INSERT activated after data is inserted into the table. 
* AFTER UPDATE: activated after data in the table is modified. 
* AFTER DELETE: activated after data is deleted/removed from the table. 
* BEFORE INSERT: activated before data is inserted into the table. 
* BEFORE UPDATE: activated before data in the table is modified.  
* BEFORE DELETE: activated before data is deleted/removed from the table. 





**2. Why do companies use Triggers?**

1\. Automatic Audit Trail

Companies need to track every change made to sensitive data. A trigger automatically logs who changed what and when, without relying on developers to remember to write the logging code manually.

2\. Data Integrity

Triggers ensure data stays consistent across related tables automatically. When a record is deleted from one table, the trigger automatically handles related records in other tables hence preventing orphaned or inconsistent data.

3\. Security and Fraud Detection

Banks and financial institutions use triggers to detect suspicious activity. When an unusual transaction occurs, such as a withdrawal exceeding a limit, the trigger automatically flags it, logs it or blocks it before it completes.





**3. What is the difference between:**

* BEFORE Trigger: Fires before the DML operation executes meaning it runs before the data is actually changed in the table. Used to validate, modify or block the operation before it happens.

→ Use BEFORE

The data has not been saved yet so you can still stop it or modify it

* AFTER Trigger: Fires after the DML operation executes meaning it runs after the data has already been changed in the table. Used to log, notify or update other tables after the change happens.

→ Use AFTER

The data has already been saved so you know exactly what changed





**4. What are the risks of excessive Trigger usage?**

* Performance Overhead: Triggers can introduce significant performance overhead because they execute automatically in response to specific database events. This can lead to increased execution time and resource consumption. 
* Debugging Challenges: Debugging triggers can be difficult because they operate behind the scenes. This can result in hidden logic and complex error tracing, complicating troubleshooting efforts. 
* Maintenance Complexity: Maintaining triggers can be cumbersome, particularly in large systems. This complexity arises from interdependencies and version control issues.
* Limited Functionality: Triggers have inherent limitations that can restrict their use, especially in complex operations or transactions. 





**5. Give at least three enterprise use cases.**

1\. Banking in Fraud Detection

Every time a transaction is made, a trigger automatically checks if the amount exceeds the daily limit or if multiple transactions occur within seconds. If suspicious activity is detected the trigger flags the transaction, logs it and blocks it before it completes, protecting customers from fraud without any manual intervention.

2\. Human Resources in Audit Trail

Every time an employee salary is updated, a trigger automatically logs the old salary, new salary, who made the change and when, creating a complete audit trail that HR and management can review at any time for compliance and accountability.

3\. Healthcare in Patient Record Audit

Every time a patient record is accessed or modified, a trigger logs the action, the user who performed it and the timestamp, ensuring full compliance with healthcare privacy laws such as HIPAA and providing a complete history of who accessed patient data and when.

\-------------------------------------------------------------------------------------------------------------------

##### **Scheduler Jobs**



**1. What is a Scheduler Job?**

DBMS\_SCHEDULER is Oracle's built in scheduling package that allows database administrators and developers to automate and schedule tasks directly inside the database, replacing the older and more limited DBMS\_JOB package.

Syntax:

BEGIN

&#x20;   DBMS\_SCHEDULER.CREATE\_JOB (

&#x20;       JOB\_NAME        => 'job\_name',

&#x20;       JOB\_TYPE        => 'STORED\_PROCEDURE',

&#x20;       JOB\_ACTION      => 'procedure\_name',

&#x20;       START\_DATE      => SYSDATE,

&#x20;       REPEAT\_INTERVAL => 'FREQ=DAILY; BYHOUR=0; BYMINUTE=0',

&#x20;       ENABLED         => TRUE

&#x20;   );

END;





**2. Why do companies use Scheduler Jobs?**

* Automation: tasks run automatically without human intervention.
* Consistency: jobs run at the exact same time every time without fail.
* Performance: heavy tasks like reports and backups are scheduled during off peak hours to avoid slowing down the system.
* Reliability: Oracle tracks job success and failure and logs every run for monitoring.





**3. What is the difference between:**

* Trigger:  fires automatically in response to an event — such as an INSERT, UPDATE or DELETE on a table. It has no schedule
* Scheduler Job: runs automatically based on a time or interval.

|**Feature**|**Trigger**|**Scheduler Job**|
|-|-|-|
|**What starts it**|A DML event — INSERT, UPDATE, DELETE|A time or interval|
|**When it runs**|Instantly when event occurs|At a scheduled time|
|**Depends on**|Data change in a table|Clock or calendar|
|**Can be scheduled**|No|Yes|
|**Used for**|Validation, auditing, integrity|Automation, reports, maintenance|
|**Fires how many times**|Once per row or statement|Once per scheduled interval|





**4. What processes are commonly automated?**

1\. Payroll Processing

Automatically calculates and processes employee salaries, deductions, bonuses and tax on a fixed date every month, eliminating manual payroll runs and ensuring every employee is paid accurately and on time.

2\. Database Backups

Automatically backs up the entire database or specific tables during off peak hours every night, ensuring data is always recoverable without a DBA manually triggering the backup.

3\. Fraud Detection Reports

Automatically runs fraud detection queries every night, scanning all transactions for suspicious activity and generating alerts for the security team to review the next morning.

4\. Email and Notification Alerts

Automatically sends scheduled notification emails or inserts alert records when certain conditions are met — such as overdue invoices, contract renewals or system warnings.





**5. Give at least three enterprise use cases.**

1. Healthcare in Nightly Patient Record Backup

Every night at 2am, a scheduler job automatically runs a shell script that backs up all patient records, medical histories and appointment data to a secure offsite location — ensuring full data recovery is possible in the event of a system failure and maintaining compliance with healthcare data retention laws.

2\. Human Resources in Monthly Payroll Processing

On the first of every month, a scheduler job automatically calls the payroll procedure — calculating salaries, applying bonuses, deducting taxes and updating all employee payment records without any manual intervention. This eliminates human error and ensures every employee is paid accurately and on time every single month.

3\. Banking in Nightly Fraud Detection

Every night after business hours, a scheduler job automatically runs a fraud detection procedure that scans all transactions made during the day — flagging suspicious activity, blocking compromised accounts and generating a fraud report for the security team to review the next morning. This ensures fraud is caught overnight rather than discovered days later.

\-------------------------------------------------------------------------------------------------------------------

#### **Part 2 – Enterprise Decision Making**

**For each scenario:**

**1. Identify which object should be used:**

* **View**
* **Procedure**
* **Trigger**
* **Scheduler Job**

**2. Explain your reasoning**.



***Scenario 1***

**The HR department should only see:**

**• Employee Name**

**• Department Name**

**They should not see salary information.**

View, because we are restricting what columns a user can see and  a view exposes only the approved columns and completely hides salary information





**Scenario 2**

**Every salary update must automatically be recorded for auditing purposes.**

Trigger, because the requirement is about automatically reacting to a data change the moment it happens. Every time a salary is updated, the trigger fires instantly and records the change in an audit table without any manual intervention.





**Scenario 3**

**Management wants a report generated automatically every Friday at 4:00 PM.**

Scheduler job, because the requirement is purely time based — the report needs to run automatically at a specific day and time every week regardless of what is happening in the database.





**Scenario 4**

**The Finance department wants one reusable process that calculates annual bonuses.**

Stored Procedure, because we need a reusable block of business logic that can be called whenever needed.





**Scenario 5**

**The company wants a notification whenever an employee's salary is modified.**

Trigger, because the requirement is about automatically reacting to a data change the moment it happens. Every time a salary is updated, the trigger fires instantly and records the change in an audit table without any manual intervention.





**Scenario 6**

**Management wants a dashboard displaying employee information without exposing underlying tables.**

View,  because the requirement is about exposing specific data to management in a controlled way, a view presents the required employee information through a virtual table without giving management direct access to the underlying tables or sensitive data they should not see.

\-------------------------------------------------------------------------------------------------------------------

#### **Part 3 – Architecture Design**

**Design simple architecture for an HR system using:**

**• Views**

**• Procedures**

**• Triggers**

**• Scheduler Jobs**

**Include:**

**• HR Users**

**• Database Objects**

**• Tables**

**• Audit Tables**

**• Reports**

**Draw a simple diagram showing how the objects interact.**



&#x20;                   +------------------+

&#x20;                   |    **HR Users**      |

&#x20;                   +--------+---------+

&#x20;                            |

&#x20;                            v

&#x20;                   +------------------+

&#x20;                   |      **Views**       |

&#x20;                   | Employee View    |

&#x20;                   | Payroll View     |

&#x20;                   | Leave View       |

&#x20;                   +--------+---------+

&#x20;                            |

&#x20;                            v

&#x20;                   +------------------+

&#x20;                   |   **Procedures**     |

&#x20;                   | Add Employee     |

&#x20;                   | Update Employee  |

&#x20;                   | Process Payroll  |

&#x20;                   | Approve Leave    |

&#x20;                   +--------+---------+

&#x20;                            |

&#x20;                            v

&#x20;                   +------------------+

&#x20;                   |      **Tables**      |

&#x20;                   | Employees        |

&#x20;                   | Departments      |

&#x20;                   | Payroll          |

&#x20;                   | Leave Requests   |

&#x20;                   +--------+---------+

&#x20;                            |

&#x20;               +------------+------------+

&#x20;               |                         |

&#x20;               v                         v

&#x20;     +------------------+      +------------------+

&#x20;     |     **Triggers**     |      |     **Reports**      |

&#x20;     | INSERT Trigger   |      | Employee Report  |

&#x20;     | UPDATE Trigger   |      | Payroll Report   |

&#x20;     | DELETE Trigger   |      | Leave Report     |

&#x20;     +--------+---------+      +------------------+

&#x20;              |

&#x20;              v

&#x20;     +------------------+

&#x20;     |   **Audit Tables**   |

&#x20;     | Employee\_Audit   |

&#x20;     | Payroll\_Audit    |

&#x20;     | Leave\_Audit      |

&#x20;     +--------+---------+

&#x20;              ^

&#x20;              |

&#x20;     +------------------+

&#x20;     | **Scheduler Jobs**   |

&#x20;     | Monthly Payroll  |

&#x20;     | Leave Balance    |

&#x20;     | Audit Cleanup    |

&#x20;     +------------------+



\-------------------------------------------------------------------------------------------------------------------



#### **Part 4 – Reflection**

**Answer:**

**If applications can perform all business logic themselves, why do enterprise systems still place logic inside the**

**database?**

**Support your answer using:**

**• Views**

**• Procedures**

**• Triggers**

**• Scheduler Jobs**





Enterprise systems place logic inside the database because applications can be bypassed, replaced, or fail, but the database is always there, it is the single point of truth.

A view ensures every application sees the same secure and consistent data regardless of who wrote it. A procedure centralises business logic so that when a rule changes, it is updated once and every application automatically follows it. A trigger enforces rules at the database engine level meaning no script, DBA, or rogue application can bypass them. A scheduler job runs critical tasks like payroll and backups independently of any application, so a server crash never means a missed payroll.

The application is temporary. The database is permanent. Logic placed inside the database survives every application change, replacement, and upgrade.

\-------------------------------------------------------------------------------------------------------------------

### **Oracle Implementation**

#### **Part 5 – View Implementation**



**Task 1**

**Create a View displaying:**

**• Employee ID**

**• Employee Name**

**• Department ID**

**• Salary**

CREATE VIEW EMPLOYEE\_DETAILS\_VIEW AS

SELECT EMPLOYEE\_ID, FIRST\_NAME||' '||LAST\_NAME AS EMPLOYEE\_NAME,DEPARTMENT\_ID,SALARY

FROM EMPLOYEES;





**Task 2**

**Create a View displaying:**

**• Employee Name**

**• Department Name**

**• Job Title**

**• Salary**

CREATE VIEW EMPLOYEE\_DETAILS1\_VIEW AS

SELECT FIRST\_NAME||' '||LAST\_NAME AS EMPLOYEE\_NAME,DEPARTMENT\_NAME,JOB\_TITLE, SALARY

FROM EMPLOYEES E

JOIN DEPARTMENTS D ON D.DEPARTMENT\_ID= E.DEPARTMENT\_ID

JOIN JOBS J ON J.JOB\_ID = E.JOB\_ID;





**Task 3**

**Using the View created above:**

**Display employees earning more than 10000.**

SELECT \* FROM EMPLOYEE\_DETAILS\_VIEW WHERE SALARY>10000;





**Task 4**

**Explain:**

**Why would management prefer querying the View instead of querying EMPLOYEES directly?**

For security reasons such as not exposing the table name for anyone who is available in the network as the are able to drop and alter the table and the table should main integrity and be consistent. Another reason is that to limit access to a user where they are not required to have the authority to view certain information from the table and only give access where needed.



\-------------------------------------------------------------------------------------------------------------------



#### **Part 6 – Procedure Implementation**

**Task 5**

**Create a Procedure that accepts:**

**• Department ID**

**and displays:**

**• Employee Name**

**• Salary**

**for employees belonging to that department.**

CREATE OR REPLACE PROCEDURE GET\_EMPLOYEES\_DEPT 

(P\_DEPARTMENT\_ID IN NUMBER) AS

BEGIN

&#x20;   FOR EMP IN (

&#x20;               SELECT FIRST\_NAME || ' ' || LAST\_NAME AS EMPLOYEE\_NAME,

&#x20;                      SALARY

&#x20;               FROM EMPLOYEES

&#x20;               WHERE DEPARTMENT\_ID = P\_DEPARTMENT\_ID

&#x20;              )

&#x20;   LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Employee Name: ' || EMP.EMPLOYEE\_NAME ||

&#x20;                            ' | Salary: ' || EMP.SALARY);

&#x20;   END LOOP;

END;

/





**Task 6**

**Modify the Procedure so it only returns employees whose salary is above the department average salary.**

CREATE OR REPLACE PROCEDURE GET\_EMPLOYEES\_AVG\_GREATER\_THAN\_DEPT

(P\_DEPARTMENT\_ID IN NUMBER) AS

BEGIN

&#x20;   FOR EMP IN (

&#x20;               SELECT FIRST\_NAME || ' ' || LAST\_NAME AS EMPLOYEE\_NAME,

&#x20;                      SALARY

&#x20;               FROM EMPLOYEES E

&#x20;               WHERE DEPARTMENT\_ID = P\_DEPARTMENT\_ID

&#x20;               AND SALARY > (SELECT AVG(SALARY)FROM EMPLOYEES M

&#x20;                             WHERE M.DEPARTMENT\_ID = E.DEPARTMENT\_ID)

&#x20;              )

&#x20;   LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Employee: ' || EMP.EMPLOYEE\_NAME ||

&#x20;                            ' | Salary: ' || EMP.SALARY);

&#x20;   END LOOP;

END;

/





**Task 7**

**Explain:**

**Why is a Procedure better than rewriting the query repeatedly?**

Creating a procedure is more efficient than rewriting a query as it saves time for the person querying it, because the logic is written once, stored in the database, and called by anyone with a single line. When the rule changes it is updated in one place and every application automatically gets the change. It is also pre-compiled by Oracle making it faster than a raw query that has to be parsed and compiled every time it runs.

\-------------------------------------------------------------------------------------------------------------------

#### **Part 7 – Trigger Implementation**

**Management wants salary changes audited.**

**Task 8**

**Create a table:**

**SALARY\_AUDIT**

**containing:**

**• Employee ID**

**• Old Salary**

**• New Salary**

**• Update Date**

CREATE TABLE SALARY\_AUDIT (EMPLOYEE\_ID NUMBER, OLD\_SALARY NUMBER, NEW\_SALARY NUMBER, UPDATE\_DATE DATE DEFAULT SYSDATE);





**Task 9**

**Create a Trigger that automatically records salary changes.**

CREATE OR REPLACE TRIGGER LOG\_SALARY\_CHANGE

AFTER UPDATE OF SALARY ON EMPLOYEES

FOR EACH ROW

BEGIN

&#x20;   INSERT INTO SALARY\_AUDIT

&#x20;   (EMPLOYEE\_ID, OLD\_SALARY, NEW\_SALARY, UPDATE\_DATE)

&#x20;   VALUES

&#x20;   (:OLD.EMPLOYEE\_ID, :OLD.SALARY, :NEW.SALARY, SYSDATE);

END;

/





**Task 10**

**Test the Trigger.**

**Update employee salaries and verify audit records are generated correctly.**

UPDATE EMPLOYEES SET SALARY = 25000 WHERE EMPLOYEE\_ID = 100;

SELECT \* FROM SALARY\_AUDIT;





**Task 11**

**Enhance the Trigger to also store:**

**• Username**

**• Timestamp**

ALTER TABLE SALARY\_AUDIT ADD (USERNAME VARCHAR2(50),TIME\_CHANGED TIMESTAMP);



CREATE OR REPLACE TRIGGER LOG\_SALARY\_CHANGE

AFTER UPDATE OF SALARY ON EMPLOYEES

FOR EACH ROW

BEGIN

&#x20;   INSERT INTO SALARY\_AUDIT

&#x20;   (EMPLOYEE\_ID, OLD\_SALARY, NEW\_SALARY, UPDATE\_DATE, USERNAME, TIME\_CHANGED)

&#x20;   VALUES

&#x20;   (:OLD.EMPLOYEE\_ID, :OLD.SALARY, :NEW.SALARY, SYSDATE, USER, SYSTIMESTAMP);

END;

/



UPDATE EMPLOYEES SET SALARY = 24000 WHERE EMPLOYEE\_ID = 100;



SELECT \* FROM SALARY\_AUDIT;



\-------------------------------------------------------------------------------------------------------------------

#### **Part 8 – Scheduler Job Design**

**Task 12**

**Every day at 8:00 PM:**

**Generate a report identifying employees whose salaries exceed their department average salary.**

**Provide:**

**• Job Name**

**• Schedule**

**• Logic Executed**

CREATE OR REPLACE PROCEDURE RUN\_HIGH\_EARNERS\_REPORT AS

BEGIN

&#x20;   FOR DEPT IN (SELECT DISTINCT DEPARTMENT\_ID FROM EMPLOYEES)

&#x20;   LOOP

&#x20;       GET\_EMPLOYEES\_AVG\_GREATER\_THAN\_DEPT(DEPT.DEPARTMENT\_ID);

&#x20;   END LOOP;

END;

/



BEGIN

&#x20;   DBMS\_SCHEDULER.CREATE\_JOB (

&#x20;       JOB\_NAME        => 'DAILY\_HIGH\_EARNERS\_REPORT',

&#x20;       JOB\_TYPE        => 'STORED\_PROCEDURE',

&#x20;       JOB\_ACTION      => 'RUN\_HIGH\_EARNERS\_REPORT',

&#x20;       START\_DATE      => SYSDATE,

&#x20;       REPEAT\_INTERVAL => 'FREQ=DAILY; BYHOUR=20; BYMINUTE=0', -- at 8pm

&#x20;       ENABLED         => TRUE

&#x20;   );

END;

/





**Task 13**

**Every Friday at 4:00 PM:**

**Generate a report listing departments with the highest average salaries.**

**Provide:**

**• Job Name**

**• Schedule**

**• Logic Executed**

CREATE TABLE DEPT\_AVG\_SALARY\_REPORT (

&#x20;   DEPARTMENT\_ID   NUMBER,

&#x20;   DEPARTMENT\_NAME VARCHAR(100),

&#x20;   AVG\_SALARY      NUMBER,

&#x20;   REPORT\_DATE     DATE

);



CREATE OR REPLACE PROCEDURE GENERATE\_DEPT\_AVG\_SALARY\_REPORT AS

BEGIN

&#x20;   INSERT INTO DEPT\_AVG\_SALARY\_REPORT

&#x20;   (DEPARTMENT\_ID, DEPARTMENT\_NAME, AVG\_SALARY, REPORT\_DATE)

&#x20;   SELECT D.DEPARTMENT\_ID,

&#x20;          D.DEPARTMENT\_NAME,

&#x20;          ROUND(AVG(E.SALARY), 2) AS AVG\_SALARY,

&#x20;          SYSDATE AS REPORT\_DATE

&#x20;   FROM DEPARTMENTS D

&#x20;   JOIN EMPLOYEES E ON D.DEPARTMENT\_ID = E.DEPARTMENT\_ID

&#x20;   GROUP BY D.DEPARTMENT\_ID, D.DEPARTMENT\_NAME

&#x20;   ORDER BY AVG\_SALARY DESC;

&#x20;   COMMIT;

END;

/



BEGIN

&#x20;   DBMS\_SCHEDULER.CREATE\_JOB (

&#x20;       JOB\_NAME        => 'WEEKLY\_HIGH\_AVG\_SALARY\_REPORT',

&#x20;       JOB\_TYPE        => 'STORED\_PROCEDURE',

&#x20;       JOB\_ACTION      => 'GENERATE\_DEPT\_AVG\_SALARY\_REPORT',

&#x20;       START\_DATE      => SYSDATE,

&#x20;       REPEAT\_INTERVAL => 'FREQ=WEEKLY; BYDAY=FRI; BYHOUR=16; BYMINUTE=0',

&#x20;       ENABLED         => TRUE

&#x20;   );

END;

/





**Task 14**

**Every month:**

**Generate a report identifying employees who have not received salary updates during the last six months.**

**Provide:**

**• Job Name**

**• Schedule**

**• Logic Executed**

CREATE TABLE NO\_SAL\_6MTH\_REPORT (

&#x20;   EMPLOYEE\_ID     NUMBER,

&#x20;   EMPLOYEE\_NAME   VARCHAR(100),

&#x20;   SALARY          NUMBER,

&#x20;   LAST\_UPDATE     DATE,

&#x20;   MONTHS\_SINCE    NUMBER,

&#x20;   REPORT\_DATE     DATE

);



CREATE OR REPLACE PROCEDURE GENERATE\_NO\_SALARY\_6\_MONTH\_REPORT AS

BEGIN

&#x20;   INSERT INTO NO\_SAL\_6MTH\_REPORT

&#x20;   (EMPLOYEE\_ID, EMPLOYEE\_NAME, SALARY, LAST\_UPDATE, MONTHS\_SINCE, REPORT\_DATE)

&#x20;   SELECT E.EMPLOYEE\_ID,

&#x20;          E.FIRST\_NAME || ' ' || E.LAST\_NAME AS EMPLOYEE\_NAME,

&#x20;          E.SALARY,

&#x20;          MAX(SA.UPDATE\_DATE)                                  AS LAST\_UPDATE,

&#x20;          ROUND(MONTHS\_BETWEEN(SYSDATE, MAX(SA.UPDATE\_DATE))) AS MONTHS\_SINCE,

&#x20;          SYSDATE                                              AS REPORT\_DATE

&#x20;   FROM EMPLOYEES E

&#x20;   LEFT JOIN SALARY\_AUDIT SA ON E.EMPLOYEE\_ID = SA.EMPLOYEE\_ID

&#x20;   GROUP BY E.EMPLOYEE\_ID, E.FIRST\_NAME, E.LAST\_NAME, E.SALARY

&#x20;   HAVING MAX(SA.UPDATE\_DATE) < ADD\_MONTHS(SYSDATE, -6)

&#x20;   OR MAX(SA.UPDATE\_DATE) IS NULL;

&#x20;   COMMIT;

END;

/



BEGIN

&#x20;   DBMS\_SCHEDULER.CREATE\_JOB (

&#x20;       JOB\_NAME        => 'NO\_SALARY\_6\_MONTH\_UPDATE\_REPORT',

&#x20;       JOB\_TYPE        => 'STORED\_PROCEDURE',

&#x20;       JOB\_ACTION      => 'GENERATE\_NO\_SALARY\_6\_MONTH\_REPORT',

&#x20;       START\_DATE      => SYSDATE,

&#x20;       REPEAT\_INTERVAL => 'FREQ=MONTHLY; BYMONTHDAY=1; BYHOUR=0; BYMINUTE=0',

&#x20;       ENABLED         => TRUE

&#x20;   );

END;

/



\-------------------------------------------------------------------------------------------------------------------



#### **Part 9 – Enterprise Change Request**

**Management has changed requirements.**

**Modify your design accordingly.**

**Change Request 1**

**The HR View must now include:**

**• Job Title**

**• Department Name**

**• City**

**without exposing underlying tables.**

**Explain how you would modify the View.**

CREATE OR REPLACE VIEW HR\_VIEW AS

SELECT J.JOB\_TITLE, D.DEPARTMENT\_NAME,L.CITY

FROM EMPLOYEES E

JOIN DEPARTMENTS D ON E.DEPARTMENT\_ID = D.DEPARTMENT\_ID

JOIN JOBS J ON E.JOB\_ID = J.JOB\_ID

JOIN LOCATIONS L ON D.LOCATION\_ID = L.LOCATION\_ID;





**Change Request 2**

**The Procedure must now return:**

**• employees earning above department average**

**• ordered by highest salary**

**Modify your design.**



CREATE OR REPLACE PROCEDURE GET\_EMPLOYEES\_AVG\_GREATER\_THAN\_DEPT

(P\_DEPARTMENT\_ID IN NUMBER) AS

BEGIN

&#x20;   FOR EMP IN (

&#x20;               SELECT FIRST\_NAME || ' ' || LAST\_NAME AS EMPLOYEE\_NAME,

&#x20;                      SALARY

&#x20;               FROM EMPLOYEES E

&#x20;               WHERE DEPARTMENT\_ID = P\_DEPARTMENT\_ID

&#x20;               AND SALARY > (

&#x20;                             SELECT AVG(SALARY)

&#x20;                             FROM EMPLOYEES M

&#x20;                             WHERE M.DEPARTMENT\_ID = E.DEPARTMENT\_ID

&#x20;                            )

&#x20;               ORDER BY SALARY DESC

&#x20;              )

&#x20;   LOOP

&#x20;       DBMS\_OUTPUT.PUT\_LINE('Employee: ' || EMP.EMPLOYEE\_NAME ||

&#x20;                            ' | Salary: ' || EMP.SALARY);

&#x20;   END LOOP;

END;

/





**Change Request 3**

**The Trigger must now record:**

**• Username**

**• Timestamp**

**• Department ID**

**Modify your design.**



ALTER TABLE SALARY\_AUDIT ADD DEPARTMENT\_ID NUMBER;



CREATE OR REPLACE TRIGGER LOG\_SALARY\_CHANGE

AFTER UPDATE OF SALARY ON EMPLOYEES

FOR EACH ROW

BEGIN

&#x20;   INSERT INTO SALARY\_AUDIT

&#x20;   (EMPLOYEE\_ID, OLD\_SALARY, NEW\_SALARY, UPDATE\_DATE,

&#x20;    USERNAME, TIME\_CHANGED, DEPARTMENT\_ID)

&#x20;   VALUES

&#x20;   (:OLD.EMPLOYEE\_ID, :OLD.SALARY, :NEW.SALARY, SYSDATE,

&#x20;    USER, SYSTIMESTAMP, :NEW.DEPARTMENT\_ID);

END;

/



UPDATE EMPLOYEES SET SALARY = 25000 WHERE EMPLOYEE\_ID = 100;



SELECT \* FROM SALARY\_AUDIT;



**Change Request 4**

**The Scheduler Job must run:**

**• Every Friday**

**• At 4:00 PM**

**instead of every day.**

**Modify your design.**

EXEC DBMS\_SCHEDULER.DROP\_JOB('DAILY\_HIGH\_EARNERS\_REPORT');



BEGIN

&#x20;   DBMS\_SCHEDULER.CREATE\_JOB (

&#x20;       JOB\_NAME        => 'WEEKLY\_HIGH\_EARNERS\_REPORT',

&#x20;       JOB\_TYPE        => 'STORED\_PROCEDURE',

&#x20;       JOB\_ACTION      => 'RUN\_HIGH\_EARNERS\_REPORT',

&#x20;       START\_DATE      => SYSDATE,

&#x20;       REPEAT\_INTERVAL => 'FREQ=WEEKLY; BYDAY=FRI; BYHOUR=16; BYMINUTE=0',

&#x20;       ENABLED         => TRUE

&#x20;   );

END;

/



\-------------------------------------------------------------------------------------------------------------------

#### **Part 10 – Final Enterprise Challenge**

**Design a complete HR Auditing \& Reporting Solution.**

**Requirements:**

**1. HR users must not access tables directly.** 

**2. Salary changes must be audited automatically.**

**3. Weekly reports must be generated automatically.**

**4. Managers must access employee information through controlled access.**

**5. Historical salary changes must be stored.**

**Your solution must identify:**

**• Which Views will be used.**

**• Which Procedures will be used.**

**• Which Triggers will be used.**

**• Which Scheduler Jobs will be used.**

**Provide a simple architecture diagram and explain the role of each object**



\*\*\*\*\*\*\*\*\*\*\*\*\*refer to HR Auditing \& Reporting Solution.png\*\*\*\*\*\*\*\*\*\*\*\*\*



+-------------+    +-------------+    +-------------+    +-------------+

|   HR USERS  |    |   FINANCE   |    |   MANAGERS  |    |   SYSTEM    |

+-------------+    +-------------+    +-------------+    +-------------+

&#x20;      |                  |                  |                  |

&#x20;      v                  v                  v                  v

+-------------+    +-------------+    +-------------+    +-------------+

|    VIEW     |    |  PROCEDURE  |    |    VIEW     |    |  SCHEDULER  |

|  EMP\_VIEW   |    | SALARY\_CALC |    | EMP\_INFO\_V  |    |     JOB     |

+-------------+    +-------------+    +-------------+    +-------------+

&#x20;      |                  |                  |                  |

&#x20;      v                  v                  v                  v

+-------------+    +-------------+    +-------------+    +-------------+

|  EMPLOYEES  |    |  EMPLOYEES  |    |  EMPLOYEES  |    |    JOBS     |

|      \&      |    |      \&      |    |      \&      |    |    TABLE    |

| DEPARTMENTS |    | DEPARTMENTS |    | DEPARTMENTS |    |             |

| (Base table)|    | (Base table)|    | (Base table)|    | (table deps |

+-------------+    +------+------+    +-------------+    |  on report  |

&#x20;                         |                              |requirements)|

&#x20;                         v                              +------+------+

&#x20;                  +------+------+                              |

&#x20;                  |   TRIGGER   |                              |

&#x20;                  | (Log change)|                              |

&#x20;                  +------+------+                              |

&#x20;                         |                                     |

&#x20;           +-------------+-------------+                       |

&#x20;           |                           |                       |

&#x20;           v                           v                       v

+--------------------+    +--------------------+     +--------------------+

|  NO\_UPDATE\_REPORT  |    |   SALARY\_AUDIT     |     |      DEPT\_AVG      |

|                    |    |                    |     |                    |

| (Historical        |    | (Salary changes)   |     |  (Every Friday)    |

|  changes)          |    |                    |     |                    |

+--------------------+    +--------------------+     +--------------------+



1.VIEW

2.TRIGGER

3.SCHEDULER

4.VIEW

5.TRIGGER + AUDIT TABLE 

The HR Auditing and Reporting Solution is built around four database objects that work together to enforce security, automate auditing and generate reports without any manual intervention. HR users access employee and department data exclusively through `EMP\_VIEW` and managers access their information through `EMP\_INFO\_V`, meaning no user ever touches the base tables directly, satisfying both the security and controlled access requirements. When the Finance team needs to calculate salaries they call the `SALARY\_CALC` procedure which centralises the logic in one place ensuring consistency across the organisation. Every time a salary is updated the `LOG\_SALARY\_CHANGE` trigger fires automatically at the database level and permanently records the old salary, new salary, username, timestamp and department ID into the `SALARY\_AUDIT` table, this cannot be bypassed by any user or application. Finally the System handles all automated reporting through two scheduler jobs, `WEEKLY\_HIGH\_EARNERS\_REPORT` runs every Friday at 4pm and inserts the `DEPT\_AVG` report, while `NO\_SALARY\_6\_MONTH\_UPDATE\_REPORT` runs on the first of every month and inserts the `NO\_UPDATE\_REPORT` identifying employees overdue for a salary review, both running completely independently of any application or human trigger.





























