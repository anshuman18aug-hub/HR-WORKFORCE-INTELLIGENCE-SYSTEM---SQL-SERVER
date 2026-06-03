-- CASE STATEMENTS QUERIES

SELECT Employees1.EmpID, Employees1.Salary, CASE WHEN Salary >= 70000 THEN 'HIGH SALARY' WHEN Salary >= 50000 THEN 'MEDIUM SALARY' ELSE 'LOW SALARY' END AS SALARY_CATEGORY FROM Employees1;

SELECT [Performence(1)].Rating, [Performence(1)].EmpID, CASE WHEN [Performence(1)].Rating >= 5 THEN 'TOP PERFORMER' WHEN [Performence(1)].Rating >= 3 THEN 'GOOD PERFORMER' ELSE 'LOW PERFORMER' END AS RATING_CATEGORY FROM [Performence(1)];

SELECT Employees1.Name, Employees1.Salary, CASE WHEN Employees1.Salary > AVG(Employees1.Salary) OVER(PARTITION BY DepartmentID) THEN 'ABOVE AVERAGE' ELSE 'BELOW AVERAGE' END AS SALARY_STATUS FROM Employees1;

SELECT [Performence(1)].EmpID, [Performence(1)].Rating, Employees1.Name, CASE WHEN [Performence(1)].Rating = 5 THEN '15% HIKE' WHEN [Performence(1)].Rating = 4 THEN '10% HIKE' WHEN [Performence(1)].Rating = 3 THEN '5% HIKE' ELSE 'NO HIKE' END AS HIKE_RECOMMEDATION FROM [Performence(1)] INNER JOIN Employees1 ON Employees1.EmpID=[Performence(1)].EmpID;

SELECT [Performence(1)].EmpID, [Performence(1)].Rating, CASE WHEN [Performence(1)].Rating >= 4 THEN 'ELIGIBLE' ELSE 'NOT ELIGIBLE' END AS BONUS_ELIGIBILITY FROM [Performence(1)];

SELECT Employees1.Name, CASE WHEN Employees1.Salary < 40000 AND [Performence(1)].Rating <= 2 THEN 'HIGH RISK' ELSE 'LOW RISK' END AS RETENTION_RISK FROM Employees1 INNER JOIN [Performence(1)] ON [Performence(1)].EmpID=Employees1.EmpID;
