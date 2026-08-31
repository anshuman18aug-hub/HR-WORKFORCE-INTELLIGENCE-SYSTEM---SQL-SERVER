select * from Employees
select * from Departments
select * from Performence

CTEs
-- AVERAGE SALARY BY DEPARTMENT
;WITH DEPT_SALARY AS (
SELECT Employees.DepartmentID, AVG(Employees.Salary) AS AVGSALARY FROM Employees GROUP BY Employees.DepartmentID
)
SELECT Departments.DepartmentName, DEPT_SALARY.AVGSALARY FROM DEPT_SALARY JOIN Departments ON Departments.DepartmentID=DEPT_SALARY.DEPARTMENTID ORDER BY DEPT_SALARY.AVGSALARY DESC;

-- EMPLOYEES EARNING ABOVE THEIR DEPARTMENT AVERAGE
;WITH DEPT_AVG_SALARY AS (
SELECT Employees.DepartmentID, AVG(Employees.Salary) AVG_SALARY FROM Employees GROUP BY Employees.DepartmentID
)
SELECT Employees.Name, Employees.EmpID,Departments.DepartmentName, Employees.Salary, DEPT_AVG_SALARY.AVG_SALARY FROM Employees JOIN DEPT_AVG_SALARY ON Employees.DepartmentID = DEPT_AVG_SALARY.DepartmentID JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID WHERE Employees.Salary > DEPT_AVG_SALARY.AVG_SALARY;

-- HIGHEST RATED EMPLOYEE IN EACH DEPARTMENT
;WITH EMP_RATING AS (
SELECT Employees.Name, Employees.EmpID, Employees.DepartmentID, Performence.Rating, RANK() OVER(PARTITION BY EMPLOYEES.DEPARTMENTID ORDER BY PERFORMENCE.RATING DESC) AS RNK FROM Employees JOIN Performence ON Employees.EmpID = Performence.EmpID
)
SELECT EMP_RATING.NAME, EMP_RATING.EMPID, Departments.DepartmentName, EMP_RATING.RATING FROM EMP_RATING JOIN Departments ON EMP_RATING.DepartmentID = Departments.DepartmentID WHERE RNK  = 1;