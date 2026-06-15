**Query Review 1**



SELECT first\_name, salary FROM employees WHERE salary > AVG(salary);





it is trying to display the employees whos salary is above average

this query gives an error of 'ORA-00934: group function is not allowed here' because it uses an aggregate function in a WHERE to fix this we should create a subquery.



quick fix:

SELECT first\_name, salary FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);



**Query Review 2**



SELECT department\_name FROM departments WHERE department\_id = (SELECT department\_id FROM employees);



it is trying to display the departments that has employees

this query gives an error of 'ORA-01427: single-row subquery returns more than one row' because the sub query returns more than 1 record.



quick fix:

SELECT DISTINCT d.department\_name

FROM departments d

JOIN employees e ON d.department\_id = e.department\_id;

&#x20;use join as it is faster and more logical in this example.



**Query Review 3**



SELECT \* FROM employees WHERE department\_id IN (SELECT salary FROM employees);



it is trying to compare the salary of an employee with the department id which is logically incorrect. it displays an output but with an empty table.





**Query Review 4**



SELECT first\_name FROM employees WHERE salary > ( SELECT salary FROM employees WHERE department\_id = 90);



it is trying to display the salary of employees that belong to a single department, and it gives an error of this 'ORA-01427: single-row subquery returns more than one row' as the subquery returns more than 1 value so it doesn't know which value to compare to what.





