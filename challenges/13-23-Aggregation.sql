/*
SQL Server Interview Practice
Challenges 13–23
Topics: Conditional JOIN filtering, SUM, COUNT, AVG, MIN, MAX,
GROUP BY, HAVING, LEFT JOIN, and business-oriented aggregation
*/

-- =========================================================
-- Challenge 13
-- Find departments that have at least 2 employees earning
-- more than ₹50,000.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
   AND e.Salary > 50000
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) >= 2;


-- =========================================================
-- Challenge 14
-- Find departments where the total salary of employees
-- earning more than ₹50,000 is greater than ₹1,00,000.
-- Expected columns: DepartmentName, TotalSalary
-- =========================================================

SELECT
    d.DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > 50000
GROUP BY d.DepartmentName
HAVING SUM(e.Salary) > 100000
ORDER BY TotalSalary DESC;


-- =========================================================
-- Challenge 15
-- Find departments that have at least 3 employees.
-- Display the departments with the highest employee count first.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) >= 3
ORDER BY EmployeeCount DESC;


-- =========================================================
-- Challenge 16
-- Find departments where the average salary is greater than
-- ₹55,000.
-- Expected columns: DepartmentName, AverageSalary
-- =========================================================

SELECT
    d.DepartmentName,
    ROUND(AVG(e.Salary), 0) AS AverageSalary
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING AVG(e.Salary) > 55000;


-- =========================================================
-- Challenge 17
-- Find the minimum and maximum salary for each department.
-- Expected columns: DepartmentName, MinimumSalary, MaximumSalary
-- =========================================================

SELECT
    d.DepartmentName,
    MIN(e.Salary) AS MinimumSalary,
    MAX(e.Salary) AS MaximumSalary
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 18
-- Find each department's average salary considering only
-- employees whose salary is ₹50,000 or more.
-- Expected columns: DepartmentName, AverageSalary
-- =========================================================

SELECT
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
WHERE e.Salary >= 50000
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 19
-- Find departments where the total salary of all employees
-- is greater than ₹2,00,000.
-- Expected columns: DepartmentName, TotalSalary
-- =========================================================

SELECT
    d.DepartmentName,
    SUM(e.Salary) AS TotalSalary
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(e.Salary) > 200000;


-- =========================================================
-- Challenge 20
-- Find the number of employees earning ₹60,000 or more
-- in each department.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
WHERE e.Salary >= 60000
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 21
-- Find departments that have at least 2 employees earning
-- ₹60,000 or more.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
   AND e.Salary >= 60000
GROUP BY d.DepartmentName
HAVING COUNT(e.EmployeeID) >= 2;


-- =========================================================
-- Challenge 22
-- Find the number of employees earning ₹60,000 or more in
-- each department, including every department even when it
-- has no qualifying employees.
-- Expected columns: DepartmentName, EmployeeCount
-- =========================================================

SELECT
    d.DepartmentName,
    COUNT(e.EmployeeID) AS EmployeeCount
FROM Departments AS d
LEFT JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
   AND e.Salary >= 60000
GROUP BY d.DepartmentName;


-- =========================================================
-- Challenge 23
-- Find departments where the average salary is greater than
-- ₹55,000.
-- Expected columns: DepartmentName, AverageSalary
-- =========================================================

SELECT
    d.DepartmentName,
    AVG(e.Salary) AS AverageSalary
FROM Departments AS d
INNER JOIN Employees AS e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
HAVING AVG(e.Salary) > 55000;
