/*
SQL Server Interview Practice
Challenges 01–12
Topics: SELECT, WHERE, JOINs, GROUP BY, HAVING, Aggregations, ORDER BY
*/

-- =========================================================
-- Challenge 01
-- Find all IT employees whose salary is greater than ₹50,000.
-- Expected columns: EmployeeID, EmployeeName, Salary
-- =========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT'
  AND e.Salary > 50000;


-- =========================================================
-- Challenge 02
-- Find all IT employees and display them with the highest
-- salary first.
-- Expected columns: EmployeeID, EmployeeName, Salary
-- =========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT'
ORDER BY e.Salary DESC;


-- =========================================================
-- Challenge 03
-- Find the average salary for each department.
-- Expected columns: DepartmentID, AverageSalary
-- =========================================================

SELECT
    DepartmentID,
    AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID;


-- =========================================================
-- Challenge 04
-- Find departments where the average salary is greater than
-- ₹50,000.
-- Expected columns: DepartmentID, AverageSalary
-- =========================================================

SELECT
    DepartmentID,
    AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;


-- =========================================================
-- Challenge 05
-- Find departments that have at least 2 employees.
-- Expected columns: DepartmentID, EmployeeCount
-- =========================================================

SELECT
    DepartmentID,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) >= 2;


-- =========================================================
-- Challenge 06
-- Display each employee's name and department name.
-- Expected columns: EmployeeName, DepartmentName
-- =========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID;


-- =========================================================
-- Challenge 07
-- Find the names of employees who work in the IT department.
-- Expected columns: EmployeeName, DepartmentName
-- =========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';


-- =========================================================
-- Challenge 08
-- Find the number of employees in each department.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 09
-- Find all departments and the number of employees in each
-- department, including departments that have zero employees.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 10
-- Find departments that have more than 2 employees.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) > 2;


-- =========================================================
-- Challenge 11
-- Display all departments, including departments with zero
-- employees, sorted by employee count from highest to lowest.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY EmployeeCount DESC;


-- =========================================================
-- Challenge 12
-- Find departments where employees earning more than ₹50,000
-- are at least 2.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) >= 2;

