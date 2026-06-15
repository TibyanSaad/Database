**Query Review 1**

SELECT e.first\_name, e.last\_name, d.department\_name

FROM employees e

JOIN departments d

ON e.employee\_id = d.department\_id;



This query returns the employees that have the same employee id as the department id, and this logic is incorrect, this is what i would rewrite it to, to display the employee and their respective department:



SELECT e.first\_name, e.last\_name, d.department\_name

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id;



it doesn't make sense to display the employees that have the same id as an existing department, instead display the employee and the department they belong to.





**Query Review 2**

SELECT e.first\_name, e.last\_name, j.job\_title

FROM employees e

JOIN jobs j

ON e.employee\_id = j.job\_id;



The output is an error as the value of employee id is a number and the value for job is a string. To fix this i would change the query to:



SELECT e.first\_name, e.last\_name, j.job\_title

FROM employees e

JOIN jobs j

ON e.job\_id = j.job\_id;

&#x20;



**Query Review 3**

SELECT e.first\_name, d.department\_name

FROM employees e

LEFT JOIN departments d

ON e.department\_id = d.department\_id

WHERE d.department\_name = 'Sales';



There is no need to use left join as there is a condition applied. to correct it i would remove the left join and make it just an inner join, the output would be the same.



SELECT e.first\_name, d.department\_name

FROM employees e

JOIN departments d

ON e.department\_id = d.department\_id

WHERE d.department\_name = 'Sales';







**Query Review 4**

SELECT e.first\_name, m.first\_name AS manager\_name

FROM employees e

JOIN employees m

ON e.employee\_id = m.manager\_id;



It displays employees who are managers of each other which means managers and the people they manage, but in order to display the employees manager which is the other way around, id use this query:



SELECT e.first\_name, m.first\_name AS manager\_name 

FROM employees e

JOIN employees m

ON M.employee\_id = E.manager\_id;











