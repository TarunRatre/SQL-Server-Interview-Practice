/*
SQL Server Interview Practice
Challenges 25–31
Topics: Scalar subqueries, distinct salary ranking,
company-level salary analysis, and correlated subqueries
*/

-- =========================================================
-- Challenge 25
-- Find the employee(s) who earn the highest salary.
-- Expected column: EmployeeName
-- =========================================================

SELECT
    EmployeeName
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);


-- =========================================================
-- Challenge 26
-- Find the second-highest salary among all employees.
-- Expected column: SecondHighestSalary
-- =========================================================

SELECT
    MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);


-- =========================================================
-- Challenge 27
-- Find the employee(s) who earn the second-highest
-- distinct salary.
-- Expected column: EmployeeName
-- =========================================================

SELECT
    EmployeeName
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees
    )
);


-- =========================================================
-- Challenge 28
-- Find the third-highest distinct salary from the Employees
-- table.
-- Expected column: ThirdHighestSalary
-- =========================================================

SELECT
    MAX(Salary) AS ThirdHighestSalary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees
    )
);


-- =========================================================
-- Challenge 29
-- Find the employee(s) who earn the third-highest
-- distinct salary.
-- Expected column: EmployeeName
-- =========================================================

SELECT
    EmployeeName
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Employees
        WHERE Salary < (
            SELECT MAX(Salary)
            FROM Employees
        )
    )
);


-- =========================================================
-- Challenge 30
-- Find the department name and employee name of the
-- employee(s) who earn the highest salary in the company.
-- Expected columns: EmployeeName, DepartmentName
-- =========================================================

SELECT
    e.EmployeeName,
    d.DepartmentName
FROM Employees AS e
LEFT JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(Salary)
    FROM Employees
);


-- =========================================================
-- Challenge 31
-- Find the employee(s) who earn the highest salary within
-- each department.
-- Expected columns: DepartmentName, EmployeeName, Salary
-- =========================================================

SELECT
    d.DepartmentName,
    e.EmployeeName,
    e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
    ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(e2.Salary)
    FROM Employees AS e2
    WHERE e2.DepartmentID = e.DepartmentID
);
