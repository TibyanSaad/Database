**Definition**

These operations combine results from two or more SELECT statements.

1. Union: Returns all rows from both queries, removing duplicates.
2. Intersect: Returns only rows that exist in both queries (common).
3. Except (MINUS in oracle): Returns rows from the first query that do not exist in the second query.





**Syntax**

1. Union

SELECT column1, column2, ...

FROM table1

UNION

SELECT column1, column2, ...

FROM table2;



2\. Intersect:

SELECT column1, column2, ...

FROM table1

INTERSECT

SELECT column1, column2, ...

FROM table2;



3\. Except:

SELECT column1, column2, ...

FROM table1

MINUS/EXCEPT

SELECT column1, column2, ...

FROM table2;





**Rules \& Conditions** 

|**RULE**|**DETAIL**|
|-|-|
|Columns|Must have same number of columns|
|Data Types|Columns must be compatible|
|ORDER BY|Only once at the very end|
|Column Names|Taken from first SELECT|







**Difference between UNION and UNION ALL**



Union removes duplicate records while Union all keeps all the records including the duplicates, so it displays all without comparison.

&#x20;

Union all syntax:

SELECT column1, column2, ...

FROM table1

UNION ALL

SELECT column1, column2, ...

FROM table2;





**Practical Example** 

1.UNION

SELECT SSN FROM EMPLOYEES

UNION

SELECT SSN FROM WORKING\_HOURS;



2.INTERSECT

SELECT SSN

FROM EMPLOYEES

INTERSECT

SELECT SSN

FROM DEPENDENTS;



3.MINUS

SELECT SSN

FROM EMPLOYEES

MINUS

SELECT SSN

FROM DEPENDENTS;



















