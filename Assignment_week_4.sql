/* Q1. Write a query to display the first name, last name, department id, and department name for each employee. */

SELECT E.[first_name], E.[last_name], E.[department_id], D.[department_name]
FROM [dbo].[employees] E
JOIN [dbo].[departments] D ON E.[department_id] = D.[department_id]

/* Q2. Write a query to display the first and last name, department name , city, and state/province for each employee. */

SELECT E.[first_name], E.[last_name], D.[department_name], L.[city], L.[state_province]
FROM [dbo].[employees] E
JOIN [dbo].[departments] D ON E.[department_id] = D.[department_id]
JOIN [dbo].[locations] L ON D.[location_id] = L.[location_id]

/* Q3. Write a query to display the first, last name and department who work in the department id 1, 2 and 3 (Use the IN operator) */

SELECT [first_name], [last_name], [department_id]
FROM [dbo].[employees]
WHERE [department_id] IN (1,2,3)

/* Q4. Write a query to display the country name that does not have any locations in the locations table. */

SELECT C.[country_name] 
FROM [dbo].[countries] C
WHERE NOT EXISTS (SELECT 1 FROM [dbo].[locations] L WHERE C.[country_id] = L.[country_id])

/* Q5. Write a query to display region name, country name, street address and city for all the locations listed in the locations table. */

SELECT R.[region_name], C.[country_name], L.[street_address], L.[city]
FROM [dbo].[locations] L
JOIN [dbo].[countries] C ON L.[country_id] = C.[country_id]
JOIN [dbo].[regions] R ON C.[region_id] = R.[region_id];

/* Q6. Write a query to display the details of all employees who are not located at the location with the location id 1700  */

SELECT E.*, L.[location_id]
FROM [dbo].[employees] E
JOIN [dbo].[departments] D ON E.[department_id] = D.[department_id]
JOIN [dbo].[locations] L ON D.[location_id] = L.[location_id]
WHERE L.[location_id] != 1700;


/* Q7. Write a query to show the record of the employee who has the highest salary. */

SELECT TOP 1 * FROM [dbo].[employees]
ORDER BY [salary] DESC;

/* Q8. Write a query to display the details of all the employees whose salaries are greater than the average salary of all employees. */

SELECT * FROM [dbo].[employees]
WHERE [salary] > (SELECT AVG(salary) FROM [dbo].[employees]);

/* Q9. Write a query to display the employee name (first name and last name), employee id and salary of all employees who report to the employee with the firstname ‘Steven’. */ 

SELECT E.[first_name], E.[last_name], E.[employee_id], E.[salary], E.[manager_id]
FROM [dbo].[employees] E
WHERE E.[manager_id] IN ( SELECT [employee_id] FROM [dbo].[employees] WHERE [first_name] = 'Steven');

/* 10. Write a query to display the employee id, first name and last name, salary and a SalaryStatus column with entries HIGH or LOW. Employees whose salary is equal or more than the average salary of all employees should have HIGH, and Employees whose salary is less than the average salary should have LOW in this column. (Use CASE WHEN statement here) */

SELECT [employee_id], [first_name], [last_name], [salary],
CASE WHEN [salary] >= (SELECT AVG([salary]) FROM [dbo].[employees]) THEN 'HIGH'ELSE 'LOW'END AS SalaryStatus
FROM [dbo].[employees];

/* 11. Write a query to show all the department id and name which have at least one employee with the salary greater than 10,000. */

SELECT D.[department_id], D.[department_name]
FROM [dbo].[departments] D
JOIN [dbo].[employees] E ON D.[department_id] = E.[department_id]
WHERE E.[salary] > 10000
GROUP BY D.[department_id], D.[department_name]
HAVING COUNT(*) >= 1;

/* 12. Write a query to show all the department id and names that do not have any employee with the salary greater than 10,000. */

SELECT D.[department_id], D.[department_name]
FROM [dbo].[departments] D
LEFT JOIN [dbo].[employees] E ON D.[department_id] = E.[department_id] AND E.[salary] > 10000
GROUP BY D.[department_id], D.[department_name]
HAVING COUNT(E.[employee_id]) = 0;