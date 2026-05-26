-- HR WORKFORCE JOINS QUERY

-- List all active employees with their department name
SELECT Employees1.Name, Employees1.Status, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID WHERE Employees1.Status='Active';

-- Find the average salary per department
SELECT AVG(Employees1.Salary) AS AVG_SALARY, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID GROUP BY Departments1.DepartmentName;

-- Find employees earning more than the average salary of their department
SELECT Employees1.Name, Employees1.Salary, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID WHERE Employees1.Salary > (SELECT AVG(Employees1.Salary) FROM Employees1 WHERE Employees1.DepartmentID=Departments1.DepartmentID);

-- List departments with more than 3 active employees
SELECT COUNT(Employees1.Status) AS TOTAL_COUNT, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID WHERE Employees1.Status = 'Active' GROUP BY Departments1.DepartmentName HAVING COUNT(Employees1.EmpID) > 3;

-- Find the top 3 highest paid employees with their department
SELECT TOP 3 Employees1.Name, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID ORDER BY Employees1.Salary DESC;

-- Find employees who have never received a performance review
SELECT Employees1.Name, [Performence(1)].Rating, Employees1.EmpID FROM [Performence(1)] LEFT JOIN Employees1 ON Employees1.EmpID=[Performence(1)].EmpID WHERE [Performence(1)].EmpID IS NULL;

-- Find the manager name for each employee
SELECT e.Name AS Employee_Name, m.Name AS Manager_Name FROM Employees1 e LEFT JOIN Employees1 m ON e.ManagerID=m.EmpID;

-- List employees with rating 5 and their bonus in 2023
SELECT Employees1.Name, [Performence(1)].Rating, [Performence(1)].Bonus, [Performence(1)].Year FROM [Performence(1)] INNER JOIN Employees1 ON Employees1.EmpID=[Performence(1)].EmpID WHERE [Performence(1)].Rating = 5 AND [Performence(1)].Year = 2023;

-- Find total bonus paid per department in 2023
SELECT Departments1.DepartmentName, SUM([Performence(1)].Bonus) AS TOTAL_BONUS FROM [Performence(1)] INNER JOIN Employees1 ON Employees1.EmpID=[Performence(1)].EmpID INNER JOIN Departments1 ON Departments1.DepartmentID=Employees1.DepartmentID WHERE [Performence(1)].Year = 2023 GROUP BY Departments1.DepartmentName;

-- Find employees who joined after 2021 and are still active
SELECT Employees1.Name, Employees1.Status, Employees1.JoinDate FROM Employees1 WHERE YEAR(Employees1.JoinDate) > 2021 AND Employees1.Status = 'Active';

-- Count active employees per department
SELECT COUNT(Employees1.Status) AS STATUS_COUNT, Departments1.DepartmentName FROM Departments1 INNER JOIN Employees1 ON Employees1.DepartmentID=Departments1.DepartmentID WHERE Employees1.Status = 'Active' GROUP BY Departments1.DepartmentName;

-- Find department with highest average bonus
SELECT Departments1.DepartmentName, AVG([Performence(1)].Bonus) AS HIGHEST_BONUS FROM [Performence(1)] INNER JOIN Employees1 ON Employees1.EmpID=[Performence(1)].EmpID INNER JOIN Departments1 ON Departments1.DepartmentID=Employees1.DepartmentID GROUP BY Departments1.DepartmentName ORDER BY AVG([Performence(1)].Bonus) DESC;