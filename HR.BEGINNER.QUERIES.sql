--Q1 - ALL EMPLOYEES DETAILS
SELECT * FROM Employees;


--Q2 - NAME AND SALARY OF ALL EMPLOYEES
SELECT Employees.Name, Employees.Salary FROM Employees;

--Q3 - ALL EMPLOYEES FROM MUMBAI
SELECT Employees.Name FROM Employees WHERE Employees.City = 'Mumbai';

--Q4 - ALL ACTIVE EMPLOYEES
SELECT Employees.Name, Employees.Status FROM Employees WHERE Employees.Status = 'Active';

--Q5 - ALL EMPLOYEES WITH SALARY GREATER THAN 60000
SELECT Employees.Name, Employees.Salary FROM Employees WHERE Employees.Salary > 60000;

--Q6 - ALL EMPLOYEES SALARY HIGHEST TO LOWEST
SELECT Employees.Name, Employees.Salary FROM Employees ORDER BY Employees.Salary DESC;

--Q7 - TOP 5 EMPLOYEES BY SALARY
SELECT TOP 5 Employees.Name, Employees.Salary FROM Employees ORDER BY Employees.Salary DESC;

--Q8 - TOTAL NUMBER OF EMPLOYEES
SELECT COUNT(Employees.EmpID) AS TOTAL_EMPLOYEES FROM Employees;

--Q9 - MAX AND MIN SALARY
SELECT MAX(Employees.Salary) AS MAXIMUM_SALARY, MIN(Employees.Salary) AS MINIMUM_SALARY FROM Employees;

--Q10 - ALL UNIQUE CITIES WHERE EMPLOYEE LIVE
SELECT DISTINCT(Employees.City) AS UNIQUE_CITIES FROM Employees;
