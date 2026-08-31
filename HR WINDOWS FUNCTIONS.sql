SELECT * FROM Employees1;
SELECT * FROM Departments1;
SELECT * FROM [Performence(1)];

-- WINDOW FUNCTIONS QUERY

SELECT Employees1.EmpID, Employees1.DepartmentID, Employees1.Salary, RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS 'SALARY RANK' FROM Employees1;

SELECT Employees1.EmpID, Employees1.DepartmentID, Employees1.Salary, DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS 'SALARY RANK' FROM Employees1;

SELECT Employees1.EmpID, Employees1.Salary, ROW_NUMBER() OVER(ORDER BY Salary DESC) AS 'SALARY_RANK' FROM Employees1;

SELECT Employees1.Name, Employees1.EmpID, Employees1.Salary,Employees1.JoinDate, LAG(Salary) OVER(ORDER BY JOINDATE) AS 'PREVIOUS_SALARY' FROM Employees1;

SELECT Employees1.Name, Employees1.EmpID, Employees1.Salary, Employees1.JoinDate, LEAD(Salary) OVER(ORDER BY JOINDATE) AS 'NEXT_SALARY' FROM Employees1;

SELECT Employees1.Name, Employees1.Salary, Employees1.JoinDate, SUM(Employees1.Salary) OVER(ORDER BY JOINDATE) AS 'RUNNING TOTAL' FROM Employees1; 

SELECT Employees1.Name, Employees1.DepartmentID, Employees1.Salary, AVG(Employees1.Salary) OVER(PARTITION BY DepartmentID) AS 'DEPT_AVG_SALARY' FROM Employees1;



