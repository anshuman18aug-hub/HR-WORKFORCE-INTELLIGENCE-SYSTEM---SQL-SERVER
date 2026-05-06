--Q1 - Active Employees with Department name
SELECT E.Name, D.DepartmentName FROM Employees E INNER JOIN Departments D ON E.DepartmentID=D.DepartmentID WHERE E.Status = 'Active';

--Q2 - Average salary per department
SELECT D.DepartmentName, AVG(Employees.Salary) AS AVG_SALARY FROM Employees  INNER JOIN Departments D ON Employees.EmpID=D.DepartmentID GROUP BY D.DepartmentName;

--Q3 - Departments with more than 3 active employees
SELECT Departments.DepartmentName,COUNT(Employees.Status) as total_count from Employees inner join Departments on Employees.DepartmentID=Departments.DepartmentID where Employees.Status = 'Active' group by Departments.DepartmentName having COUNT(Employees.EmpID) > 3;

--Q4 - Top 3 highest paid employee with their department
SELECT TOP 3 Employees.Name, Departments.DepartmentName FROM Employees INNER JOIN Departments ON Employees.DepartmentID=Departments.DepartmentID ORDER BY Salary DESC;

--Q5 - Employees who have never recevied a performance review
SELECT Employees.Name, Employees.DepartmentID, Employees.Status FROM Employees LEFT JOIN Performence ON Employees.EmpID=Performence.EmpID WHERE Performence.EmpID is null;

--Q6 - Manager name for each employee
SELECT E.Name AS EmployeeName,
M.Name AS ManagerName
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID = M.EmpID;

--Q7 - Employees with rating 5 and their bonus in 2023
SELECT Employees.Name, Performence.Rating, Performence.Bonus, Performence.Year FROM Employees INNER JOIN Performence ON Employees.EmpID=Performence.EmpID WHERE Performence.Rating = 5 AND Performence.Year = 2023;

--Q8 - Employees who joined after 2021 and are still active
SELECT Employees.Name, Employees.JoinDate, Employees.Status FROM Employees WHERE YEAR(Employees.JoinDate) > 2021 AND Employees.Status = 'Active';

--Q9 - Active and Inactive employees per department
SELECT Employees.Status, Departments.DepartmentName FROM Employees INNER JOIN Departments ON Employees.DepartmentID=Departments.DepartmentID GROUP BY Departments.DepartmentName, Employees.Status;

--Q10 - Department with highest average bonus
SELECT TOP 1 Departments.DepartmentName, AVG(Performence.Bonus) AS AVG_BONUS FROM Performence INNER JOIN Employees ON Employees.EmpID=Performence.EmpID INNER JOIN Departments ON Employees.DepartmentID=Departments.DepartmentID GROUP BY Departments.DepartmentName ORDER BY AVG(Performence.Bonus) DESC; 

--Q11 - Departments average salary with more than average salary
SELECT Departments.DepartmentName, AVG(Employees.Salary) as AVG_SALARY FROM Employees INNER JOIN Departments ON Employees.DepartmentID=Departments.DepartmentID WHERE Employees.Salary > (SELECT AVG(Employees.Salary) FROM Employees) GROUP BY Departments.DepartmentName;

--Q12 - Total Bonus paid per department in 2023
SELECT SUM(Performence.Bonus) AS TOTAL_BONUS, Departments.DepartmentName FROM Performence INNER JOIN Employees ON Employees.EmpID=Performence.EmpID INNER JOIN Departments ON Departments.DepartmentID=Employees.DepartmentID WHERE Performence.Year = 2023 GROUP BY Departments.DepartmentName;