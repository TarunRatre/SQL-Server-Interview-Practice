/* =========================================================
   SQL SERVER - DATA ANALYST PRACTICE DATABASE
   ========================================================= */

-- Create database
CREATE DATABASE DataAnalystPractice;
GO

USE DataAnalystPractice;
GO


/* =========================================================
   1. DEPARTMENTS
   ========================================================= */

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NULL
);

INSERT INTO Departments
(
    DepartmentID,
    DepartmentName,
    Location
)
VALUES
(10, 'Sales',       'Mumbai'),
(20, 'IT',          'Bangalore'),
(30, 'HR',          'Delhi'),
(40, 'Finance',     'Pune'),
(50, 'Operations',  'Hyderabad'),
(60, 'Marketing',   'Chennai'),
(70, 'Legal',       NULL);


/* =========================================================
   2. EMPLOYEES
   ========================================================= */

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NULL,
    DepartmentID INT NULL,
    ManagerID INT NULL,
    JobTitle VARCHAR(100) NULL,
    Salary DECIMAL(10,2) NULL,
    HireDate DATE NULL,
    Email VARCHAR(100) NULL,
    Phone VARCHAR(20) NULL,
    City VARCHAR(50) NULL,
    EmploymentStatus VARCHAR(20) NULL,

    CONSTRAINT FK_Employees_Departments
        FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

INSERT INTO Employees
(
    EmployeeID,
    EmployeeName,
    Gender,
    DepartmentID,
    ManagerID,
    JobTitle,
    Salary,
    HireDate,
    Email,
    Phone,
    City,
    EmploymentStatus
)
VALUES

-- Department 10 - Sales
(101, 'Amit Sharma',   'Male',   10, NULL, 'Sales Manager',      85000, '2018-01-15', 'amit@company.com',   '9876500001', 'Mumbai',     'Active'),
(102, 'Ravi Kumar',    'Male',   10, 101,  'Sales Executive',    55000, '2020-03-10', 'ravi@company.com',   '9876500002', 'Mumbai',     'Active'),
(103, 'Priya Singh',   'Female', 10, 101,  'Sales Executive',    68000, '2019-07-22', 'priya@company.com',  '9876500003', 'Pune',       'Active'),
(104, 'Neha Verma',    'Female', 10, 101,  'Sales Executive',    62000, '2021-05-18', NULL,                '9876500004', 'Mumbai',     'Active'),

-- Department 20 - IT
(105, 'Karan Patel',   'Male',   20, NULL, 'IT Manager',          110000, '2017-06-01', 'karan@company.com',  '9876500005', 'Bangalore',  'Active'),
(106, 'Sneha Joshi',   'Female', 20, 105,  'Data Analyst',         72000, '2021-02-15', 'sneha@company.com',  NULL,         'Bangalore',  'Active'),
(107, 'Mohit Gupta',   'Male',   20, 105,  'SQL Developer',        72000, '2020-08-20', 'mohit@company.com',  '9876500007', 'Bangalore',  'Active'),
(108, 'Rahul Mehta',   'Male',   20, 105,  'BI Developer',         95000, '2019-11-11', 'rahul@company.com',  '9876500008', 'Hyderabad',  'Active'),
(109, 'Anjali Rao',    'Female', 20, 105,  'Data Analyst',         NULL, '2022-04-01', 'anjali@company.com', '9876500009', 'Bangalore',  'Active'),

-- Department 30 - HR
(110, 'Pooja Shah',    'Female', 30, NULL, 'HR Manager',           90000, '2018-09-12', 'pooja@company.com',  '9876500010', 'Delhi',      'Active'),
(111, 'Vikas Yadav',   'Male',   30, 110,  'HR Executive',         50000, '2021-01-10', 'vikas@company.com',  '9876500011', 'Delhi',      'Active'),
(112, 'Ritu Jain',     'Female', 30, 110,  'Recruiter',             58000, '2020-10-05', NULL,                '9876500012', 'Delhi',      'Active'),

-- Department 40 - Finance
(113, 'Suresh Gupta',  'Male',   40, NULL, 'Finance Manager',      105000, '2016-04-18', 'suresh@company.com', '9876500013', 'Pune',       'Active'),
(114, 'Meena Iyer',    'Female', 40, 113,  'Accountant',             65000, '2019-06-20', 'meena@company.com',  '9876500014', 'Pune',       'Active'),
(115, 'Arjun Das',     'Male',   40, 113,  'Financial Analyst',      78000, '2020-12-01', 'arjun@company.com',  NULL,         'Pune',       'Active'),

-- Department 50 - Operations
(116, 'Rohit Sen',     'Male',   50, NULL, 'Operations Manager',    98000, '2017-02-14', 'rohit@company.com',  '9876500016', 'Hyderabad',  'Active'),
(117, 'Kavita Roy',    'Female', 50, 116,  'Operations Analyst',    67000, '2021-08-19', 'kavita@company.com', '9876500017', 'Hyderabad',  'Active'),
(118, 'Manish Rao',    'Male',   50, 116,  'Operations Executive',  55000, '2022-01-25', 'manish@company.com', '9876500018', 'Hyderabad',  'Active'),

-- Department 60 - Marketing
(119, 'Deepak Jain',   'Male',   60, NULL, 'Marketing Manager',     92000, '2018-03-15', 'deepak@company.com', '9876500019', 'Chennai',    'Active'),
(120, 'Nisha Kapoor',  'Female', 60, 119,  'Marketing Analyst',     70000, '2020-07-10', 'nisha@company.com',  '9876500020', 'Chennai',    'Active'),
(121, 'Varun Malhotra', 'Male',  60, 119,  'SEO Specialist',        60000, '2021-09-01', 'varun@company.com',  '9876500021', 'Chennai',    'Resigned'),

-- NULL / edge-case records
(122, 'Sameer Khan',   'Male',   NULL, NULL, 'Consultant',           75000, '2023-01-15', 'sameer@company.com', NULL, 'Mumbai',     'Active'),
(123, 'Isha Nair',     'Female', 70, NULL, 'Legal Executive',        NULL, NULL,         'isha@company.com',   '9876500023', NULL,         'Active'),
(124, 'Test User',     NULL,     10, 101,  'Intern',                 0,    '2024-01-01', NULL,                NULL,         NULL,         'Inactive'),

-- Duplicate salary values for ranking/window-function practice
(125, 'Raj Malhotra',  'Male',   20, 105,  'Data Analyst',          72000, '2023-05-01', 'raj@company.com',    '9876500025', 'Bangalore',  'Active');


/* =========================================================
   3. PROJECTS
   ========================================================= */

CREATE TABLE Projects
(
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100) NOT NULL,
    DepartmentID INT NULL,
    ProjectManagerID INT NULL,
    Budget DECIMAL(12,2) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    ProjectStatus VARCHAR(30) NULL,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID),

    FOREIGN KEY (ProjectManagerID)
        REFERENCES Employees(EmployeeID)
);

INSERT INTO Projects
(
    ProjectID,
    ProjectName,
    DepartmentID,
    ProjectManagerID,
    Budget,
    StartDate,
    EndDate,
    ProjectStatus
)
VALUES
(1001, 'Sales Dashboard',       10, 101, 500000, '2023-01-01', '2023-06-30', 'Completed'),
(1002, 'CRM Upgrade',           10, 101, 750000, '2023-04-01', NULL,         'In Progress'),
(1003, 'Data Warehouse',        20, 105, 1500000,'2022-07-01', NULL,         'In Progress'),
(1004, 'HR Automation',         30, 110, 400000, '2023-02-01', '2023-08-31', 'Completed'),
(1005, 'Financial Reporting',   40, 113, 900000, '2023-01-15', NULL,         'In Progress'),
(1006, 'Supply Chain Analytics',50, 116, 1200000,'2023-03-01', NULL,         'In Progress'),
(1007, 'Marketing Analytics',   60, 119, 650000, '2023-05-01', '2023-12-31', 'Completed'),
(1008, 'Internal Audit',        40, 113, NULL,    '2024-01-01', NULL,         'Planning'),
(1009, 'AI Reporting',          20, 105, 2000000,'2024-02-01', NULL,         'Planning');


/* =========================================================
   4. EMPLOYEE PROJECT ASSIGNMENTS
   ========================================================= */

CREATE TABLE EmployeeProjects
(
    EmployeeID INT NOT NULL,
    ProjectID INT NOT NULL,
    RoleName VARCHAR(100) NULL,
    HoursWorked INT NULL,
    AssignmentStart DATE NULL,
    AssignmentEnd DATE NULL,

    PRIMARY KEY (EmployeeID, ProjectID),

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID),

    FOREIGN KEY (ProjectID)
        REFERENCES Projects(ProjectID)
);

INSERT INTO EmployeeProjects
(
    EmployeeID,
    ProjectID,
    RoleName,
    HoursWorked,
    AssignmentStart,
    AssignmentEnd
)
VALUES
(101, 1001, 'Project Manager', 800, '2023-01-01', '2023-06-30'),
(102, 1001, 'Sales Analyst',   450, '2023-01-10', '2023-06-20'),
(103, 1001, 'Sales Analyst',   500, '2023-01-15', '2023-06-25'),

(101, 1002, 'Project Manager', 300, '2023-04-01', NULL),
(104, 1002, 'Sales Executive', 250, '2023-04-15', NULL),

(105, 1003, 'Project Manager', 900, '2022-07-01', NULL),
(106, 1003, 'Data Analyst',    700, '2022-08-01', NULL),
(107, 1003, 'SQL Developer',   850, '2022-08-15', NULL),
(108, 1003, 'BI Developer',    800, '2022-09-01', NULL),

(110, 1004, 'Project Manager', 600, '2023-02-01', '2023-08-31'),
(111, 1004, 'HR Executive',    400, '2023-02-10', '2023-08-15'),

(113, 1005, 'Project Manager', 700, '2023-01-15', NULL),
(114, 1005, 'Accountant',       450, '2023-02-01', NULL),
(115, 1005, 'Financial Analyst',550, '2023-02-10', NULL),

(116, 1006, 'Project Manager', 750, '2023-03-01', NULL),
(117, 1006, 'Operations Analyst',600,'2023-03-15', NULL),
(118, 1006, 'Operations Executive',500,'2023-03-20', NULL),

(119, 1007, 'Project Manager', 650, '2023-05-01', '2023-12-31'),
(120, 1007, 'Marketing Analyst',500,'2023-05-15', '2023-12-15');


/* =========================================================
   5. CUSTOMERS
   ========================================================= */

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NULL,
    City VARCHAR(50) NULL,
    SignupDate DATE NULL,
    CustomerSegment VARCHAR(30) NULL
);

INSERT INTO Customers
VALUES
(201, 'Alpha Industries',   'Male',   'Mumbai',    '2022-01-10', 'Enterprise'),
(202, 'Bright Solutions',   'Female', 'Pune',      '2022-02-15', 'SMB'),
(203, 'Crown Retail',       'Male',   'Delhi',     '2022-03-20', 'Enterprise'),
(204, 'Delta Traders',      'Female', 'Mumbai',    '2022-04-05', 'SMB'),
(205, 'Elite Corp',         'Male',   'Bangalore', '2022-05-18', 'Enterprise'),
(206, 'Future Mart',        'Female', 'Chennai',   '2022-06-25', 'SMB'),
(207, 'Global Tech',        'Male',   'Hyderabad', '2022-07-10', 'Enterprise'),
(208, 'Horizon Ltd',        'Female', NULL,        '2022-08-12', 'SMB'),
(209, 'India Retail',       NULL,     'Pune',      NULL,         'SMB'),
(210, 'Nova Enterprises',   'Male',   'Delhi',     '2023-01-15', NULL);


/* =========================================================
   6. ORDERS
   ========================================================= */

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT NULL,
    OrderDate DATE NULL,
    SalesAmount DECIMAL(12,2) NULL,
    Discount DECIMAL(5,2) NULL,
    OrderStatus VARCHAR(30) NULL,
    SalespersonID INT NULL,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (SalespersonID)
        REFERENCES Employees(EmployeeID)
);

INSERT INTO Orders
VALUES
(5001, 201, '2023-01-05', 125000,  5, 'Completed', 102),
(5002, 202, '2023-01-08',  85000, 10, 'Completed', 103),
(5003, 203, '2023-01-15', 210000,  8, 'Completed', 102),
(5004, 204, '2023-02-02',  45000,  0, 'Cancelled', 104),
(5005, 205, '2023-02-18', 175000, 12, 'Completed', 103),
(5006, 206, '2023-03-01',  95000,  5, 'Completed', 102),
(5007, 207, '2023-03-14', 320000, 15, 'Completed', 104),
(5008, 208, '2023-03-20',  70000, NULL, 'Pending',   103),
(5009, 209, '2023-04-05', 110000,  5, 'Completed', 102),
(5010, 210, '2023-04-20', 250000, 10, 'Completed', NULL),

(5011, 201, '2023-05-01', 150000,  5, 'Completed', 102),
(5012, 202, '2023-05-10',  90000,  7, 'Completed', 103),
(5013, 203, '2023-05-15', 180000, 10, 'Completed', 104),
(5014, 205, '2023-06-01', 220000, 15, 'Completed', 102),
(5015, 207, '2023-06-20', 350000, NULL,'Pending',   104),
(5016, 210, '2023-07-05', 275000, 10, 'Completed', NULL),
(5017, 204, '2023-07-15',  55000,  5, 'Cancelled', 104),
(5018, 206, '2023-08-01', 120000,  8, 'Completed', 102),
(5019, 208, '2023-08-12',  80000,  5, 'Completed', 103),
(5020, 209, '2023-09-01', 135000, 10, 'Completed', 102);


/* =========================================================
   7. PRODUCTS
   ========================================================= */

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NULL,
    UnitPrice DECIMAL(10,2) NULL,
    CostPrice DECIMAL(10,2) NULL
);

INSERT INTO Products
VALUES
(301, 'Laptop',       'Electronics', 75000, 60000),
(302, 'Monitor',      'Electronics', 25000, 18000),
(303, 'Keyboard',     'Accessories',  3000,  1800),
(304, 'Mouse',        'Accessories',  1500,   800),
(305, 'Office Chair', 'Furniture',   12000,  8000),
(306, 'Desk',         'Furniture',   18000, 12000),
(307, 'Headset',      'Accessories',  4500,  2800),
(308, 'Printer',      'Electronics', 22000, 17000);


/* =========================================================
   8. ORDER DETAILS
   ========================================================= */

CREATE TABLE OrderDetails
(
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NULL,
    UnitPrice DECIMAL(10,2) NULL,
    Discount DECIMAL(5,2) NULL,

    PRIMARY KEY (OrderID, ProductID),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
VALUES
(5001, 301, 1, 75000, 5),
(5001, 303, 5,  3000, 5),

(5002, 302, 2, 25000, 10),
(5002, 304, 4,  1500, 10),

(5003, 301, 2, 75000, 8),
(5003, 307, 5,  4500, 8),

(5004, 305, 3, 12000, 0),

(5005, 306, 5, 18000, 12),
(5005, 305, 4, 12000, 12),

(5006, 302, 3, 25000, 5),
(5006, 304, 3,  1500, 5),

(5007, 301, 4, 75000, 15),
(5007, 302, 2, 25000, 15),

(5008, 308, 3, 22000, NULL),

(5009, 303, 10, 3000, 5),
(5009, 304, 10, 1500, 5),

(5010, 301, 3, 75000, 10),
(5010, 305, 5, 12000, 10),

(5011, 301, 2, 75000, 5),
(5011, 307, 4,  4500, 5),

(5012, 302, 2, 25000, 7),
(5012, 303, 5,  3000, 7),

(5013, 306, 5, 18000, 10),
(5013, 305, 4, 12000, 10),

(5014, 301, 2, 75000, 15),
(5014, 308, 2, 22000, 15),

(5015, 301, 5, 75000, NULL),

(5016, 302, 5, 25000, 10),
(5016, 307, 4,  4500, 10),

(5017, 305, 3, 12000, 5),

(5018, 308, 4, 22000, 8),

(5019, 303, 15, 3000, 5),
(5019, 304, 10, 1500, 5),

(5020, 306, 5, 18000, 10),
(5020, 305, 3, 12000, 10);


/* =========================================================
   9. MONTHLY SALES
   Useful for window functions, trends, running totals,
   LAG/LEAD, moving averages, YoY/MoM analysis.
   ========================================================= */

CREATE TABLE MonthlySales
(
    SalesMonth DATE NOT NULL,
    DepartmentID INT NOT NULL,
    SalesAmount DECIMAL(12,2) NULL,

    PRIMARY KEY (SalesMonth, DepartmentID),

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);

INSERT INTO MonthlySales
VALUES
('2023-01-01', 10, 450000),
('2023-02-01', 10, 520000),
('2023-03-01', 10, 610000),
('2023-04-01', 10, 580000),
('2023-05-01', 10, 720000),
('2023-06-01', 10, 690000),

('2023-01-01', 20, 800000),
('2023-02-01', 20, 850000),
('2023-03-01', 20, 920000),
('2023-04-01', 20, 880000),
('2023-05-01', 20, 1050000),
('2023-06-01', 20, 1100000),

('2023-01-01', 30, 250000),
('2023-02-01', 30, 280000),
('2023-03-01', 30, 300000),
('2023-04-01', 30, 270000),
('2023-05-01', 30, 320000),
('2023-06-01', 30, 350000),

('2023-01-01', 40, 500000),
('2023-02-01', 40, 550000),
('2023-03-01', 40, 620000),
('2023-04-01', 40, 600000),
('2023-05-01', 40, 680000),
('2023-06-01', 40, 720000);


/* =========================================================
   10. ATTENDANCE
   ========================================================= */

CREATE TABLE Attendance
(
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    Status VARCHAR(20) NULL,
    HoursWorked DECIMAL(5,2) NULL,

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

INSERT INTO Attendance
VALUES
(1, 101, '2024-01-01', 'Present', 8),
(2, 102, '2024-01-01', 'Present', 8),
(3, 103, '2024-01-01', 'Absent',  0),
(4, 104, '2024-01-01', 'Present', 7.5),
(5, 105, '2024-01-01', 'Present', 9),
(6, 106, '2024-01-01', 'Present', 8),
(7, 107, '2024-01-01', 'Late',    6),
(8, 108, '2024-01-01', 'Present', 8),
(9, 109, '2024-01-01', NULL,       NULL),
(10,110, '2024-01-01', 'Present', 8);


/* =========================================================
   VERIFY TABLES
   ========================================================= */

SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM EmployeeProjects;
SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM OrderDetails;
SELECT * FROM MonthlySales;
SELECT * FROM Attendance;









/* =========================================================
   DATA ANALYST PRACTICE DATABASE
   ADDITIONAL SALES + SUPPLY CHAIN MODULE
   ========================================================= */

USE DataAnalystPractice;
GO


/* =========================================================
   1. SUPPLIERS
   ========================================================= */

CREATE TABLE Suppliers
(
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NULL,
    State VARCHAR(50) NULL,
    SupplierCategory VARCHAR(50) NULL,
    Rating DECIMAL(3,2) NULL,
    SupplierStatus VARCHAR(20) NULL
);

INSERT INTO Suppliers
VALUES
(401, 'TechSource India',       'Mumbai',    'Maharashtra', 'Electronics', 4.50, 'Active'),
(402, 'Global Components',      'Pune',      'Maharashtra', 'Electronics', 4.20, 'Active'),
(403, 'OfficePro Supplies',     'Delhi',     'Delhi',       'Furniture',   4.00, 'Active'),
(404, 'Prime Accessories',      'Bangalore', 'Karnataka',   'Accessories', 4.70, 'Active'),
(405, 'Metro Furniture',        'Chennai',   'Tamil Nadu',  'Furniture',   3.80, 'Active'),
(406, 'Digital World',          'Hyderabad', 'Telangana',   'Electronics', 4.10, 'Active'),
(407, 'Reliable Traders',       'Kolkata',   'West Bengal', 'Accessories', 3.60, 'Active'),
(408, 'Future Components',      'Noida',     'Uttar Pradesh','Electronics', 4.30, 'Inactive');


/* =========================================================
   2. PRODUCT-SUPPLIER RELATIONSHIP
   ========================================================= */

CREATE TABLE ProductSuppliers
(
    ProductID INT NOT NULL,
    SupplierID INT NOT NULL,
    SupplyPrice DECIMAL(10,2) NULL,
    LeadTimeDays INT NULL,

    PRIMARY KEY (ProductID, SupplierID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID),

    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);

INSERT INTO ProductSuppliers
VALUES
(301, 401, 59000, 7),
(301, 402, 60000, 10),
(301, 406, 58500, 8),

(302, 401, 17500, 7),
(302, 402, 18000, 9),

(303, 404, 1700, 5),
(303, 407, 1800, 8),

(304, 404, 750, 5),
(304, 407, 800, 7),

(305, 403, 7800, 12),
(305, 405, 8000, 15),

(306, 403, 11500, 14),
(306, 405, 12000, 16),

(307, 404, 2700, 6),
(307, 407, 2800, 9),

(308, 401, 16500, 8),
(308, 406, 17000, 10);


/* =========================================================
   3. WAREHOUSES
   ========================================================= */

CREATE TABLE Warehouses
(
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(100) NOT NULL,
    City VARCHAR(50) NULL,
    State VARCHAR(50) NULL,
    Capacity INT NULL
);

INSERT INTO Warehouses
VALUES
(501, 'Mumbai Central Warehouse',    'Mumbai',    'Maharashtra', 10000),
(502, 'Bangalore Tech Warehouse',    'Bangalore', 'Karnataka',    15000),
(503, 'Delhi North Warehouse',       'Delhi',     'Delhi',         12000),
(504, 'Hyderabad Distribution Hub',  'Hyderabad', 'Telangana',     18000),
(505, 'Chennai South Warehouse',     'Chennai',   'Tamil Nadu',    10000);


/* =========================================================
   4. INVENTORY
   ========================================================= */

CREATE TABLE Inventory
(
    WarehouseID INT NOT NULL,
    ProductID INT NOT NULL,
    StockQuantity INT NULL,
    ReorderLevel INT NULL,
    ReorderQuantity INT NULL,
    LastRestockDate DATE NULL,

    PRIMARY KEY (WarehouseID, ProductID),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO Inventory
VALUES

-- Mumbai
(501, 301, 45, 20, 50, '2024-01-15'),
(501, 302, 80, 30, 70, '2024-01-20'),
(501, 303, 250, 80, 200, '2024-01-18'),
(501, 304, 300, 100, 250, '2024-01-22'),
(501, 305, 35, 15, 40, '2024-01-10'),
(501, 306, 20, 10, 30, '2024-01-12'),

-- Bangalore
(502, 301, 60, 25, 60, '2024-01-17'),
(502, 302, 100, 40, 80, '2024-01-19'),
(502, 303, 350, 100, 250, '2024-01-21'),
(502, 304, 500, 150, 400, '2024-01-21'),
(502, 307, 120, 40, 100, '2024-01-16'),

-- Delhi
(503, 301, 30, 20, 50, '2024-01-10'),
(503, 305, 15, 10, 30, '2024-01-14'),
(503, 306, 8, 10, 25, '2024-01-13'),
(503, 308, 25, 10, 30, '2024-01-11'),

-- Hyderabad
(504, 301, 75, 30, 70, '2024-01-18'),
(504, 302, 90, 30, 70, '2024-01-20'),
(504, 307, 150, 50, 100, '2024-01-22'),
(504, 308, 40, 15, 40, '2024-01-15'),

-- Chennai
(505, 305, 40, 15, 40, '2024-01-09'),
(505, 306, 25, 10, 30, '2024-01-11'),
(505, 303, 180, 60, 150, '2024-01-20');


/* =========================================================
   5. INVENTORY TRANSACTIONS
   ========================================================= */

CREATE TABLE InventoryTransactions
(
    TransactionID INT PRIMARY KEY,
    WarehouseID INT NOT NULL,
    ProductID INT NOT NULL,
    TransactionDate DATE NOT NULL,
    TransactionType VARCHAR(30) NOT NULL,
    Quantity INT NOT NULL,
    ReferenceType VARCHAR(30) NULL
);

INSERT INTO InventoryTransactions
VALUES
(6001, 501, 301, '2024-01-05', 'Purchase',   100, 'PurchaseOrder'),
(6002, 501, 301, '2024-01-10', 'Sale',        -20, 'Order'),
(6003, 501, 302, '2024-01-12', 'Purchase',   150, 'PurchaseOrder'),
(6004, 501, 302, '2024-01-12', 'Sale',        -40, 'Order'),
(6005, 502, 301, '2024-01-05', 'Purchase',   120, 'PurchaseOrder'),
(6006, 502, 301, '2024-01-15', 'Sale',        -35, 'Order'),
(6007, 502, 303, '2024-01-07', 'Purchase',   500, 'PurchaseOrder'),
(6008, 502, 303, '2024-01-20', 'Sale',        -80, 'Order'),
(6009, 503, 306, '2024-01-05', 'Purchase',    50, 'PurchaseOrder'),
(6010, 503, 306, '2024-01-18', 'Sale',        -42, 'Order'),
(6011, 504, 308, '2024-01-12', 'Purchase',    80, 'PurchaseOrder'),
(6012, 504, 308, '2024-01-25', 'Sale',        -40, 'Order'),
(6013, 505, 305, '2024-01-10', 'Purchase',    70, 'PurchaseOrder'),
(6014, 505, 305, '2024-01-22', 'Sale',        -30, 'Order'),
(6015, 501, 304, '2024-01-25', 'Adjustment',  -10, 'StockAdjustment');


/* =========================================================
   6. SHIPMENTS
   ========================================================= */

CREATE TABLE Shipments
(
    ShipmentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    WarehouseID INT NULL,
    ShipmentDate DATE NULL,
    Carrier VARCHAR(50) NULL,
    ShippingMethod VARCHAR(30) NULL,
    ShippingCost DECIMAL(10,2) NULL,
    ShipmentStatus VARCHAR(30) NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
);

INSERT INTO Shipments
VALUES
(7001, 5001, 501, '2023-01-06', 'BlueDart',   'Express',  1200, 'Delivered'),
(7002, 5002, 501, '2023-01-09', 'Delhivery',  'Standard',  600, 'Delivered'),
(7003, 5003, 503, '2023-01-17', 'BlueDart',   'Express',  1500, 'Delivered'),
(7004, 5005, 502, '2023-02-20', 'FedEx',      'Standard',  900, 'Delivered'),
(7005, 5006, 504, '2023-03-02', 'Delhivery',  'Standard',  700, 'Delivered'),
(7006, 5007, 504, '2023-03-15', 'BlueDart',   'Express',  1800, 'Delivered'),
(7007, 5008, 501, '2023-03-21', 'Delhivery',  'Standard',  500, 'In Transit'),
(7008, 5009, 501, '2023-04-06', 'FedEx',      'Standard',  750, 'Delivered'),
(7009, 5010, 503, '2023-04-21', 'BlueDart',   'Express',  1600, 'Delivered'),
(7010, 5011, 501, '2023-05-02', 'Delhivery',  'Standard',  700, 'Delivered'),
(7011, 5012, 502, '2023-05-11', 'FedEx',      'Standard',  650, 'Delivered'),
(7012, 5013, 503, '2023-05-16', 'BlueDart',   'Express',  1100, 'Delivered'),
(7013, 5014, 502, '2023-06-02', 'FedEx',      'Standard',  900, 'Delivered'),
(7014, 5015, 504, '2023-06-21', 'Delhivery',  'Express',  1400, 'In Transit'),
(7015, 5016, 503, '2023-07-06', 'BlueDart',   'Express',  1500, 'Delivered');


/* =========================================================
   7. DELIVERIES
   ========================================================= */

CREATE TABLE Deliveries
(
    DeliveryID INT PRIMARY KEY,
    ShipmentID INT NOT NULL,
    ExpectedDeliveryDate DATE NULL,
    ActualDeliveryDate DATE NULL,
    DeliveryStatus VARCHAR(30) NULL,

    FOREIGN KEY (ShipmentID)
        REFERENCES Shipments(ShipmentID)
);

INSERT INTO Deliveries
VALUES
(8001, 7001, '2023-01-08', '2023-01-08', 'On Time'),
(8002, 7002, '2023-01-12', '2023-01-13', 'Late'),
(8003, 7003, '2023-01-20', '2023-01-19', 'Early'),
(8004, 7004, '2023-02-24', '2023-02-24', 'On Time'),
(8005, 7005, '2023-03-06', '2023-03-08', 'Late'),
(8006, 7006, '2023-03-19', '2023-03-18', 'Early'),
(8007, 7007, '2023-03-25', NULL,         'In Transit'),
(8008, 7008, '2023-04-10', '2023-04-09', 'Early'),
(8009, 7009, '2023-04-25', '2023-04-25', 'On Time'),
(8010, 7010, '2023-05-06', '2023-05-07', 'Late'),
(8011, 7011, '2023-05-15', '2023-05-14', 'Early'),
(8012, 7012, '2023-05-20', '2023-05-20', 'On Time'),
(8013, 7013, '2023-06-07', '2023-06-10', 'Late'),
(8014, 7014, '2023-06-27', NULL,         'In Transit'),
(8015, 7015, '2023-07-10', '2023-07-10', 'On Time');


/* =========================================================
   8. RETURNS
   ========================================================= */

CREATE TABLE Returns
(
    ReturnID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    ReturnDate DATE NULL,
    ReturnQuantity INT NULL,
    ReturnReason VARCHAR(100) NULL,
    RefundAmount DECIMAL(12,2) NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO Returns
VALUES
(9001, 5003, 301, '2023-01-25', 1, 'Damaged',          75000),
(9002, 5005, 305, '2023-03-01', 1, 'Wrong Product',   12000),
(9003, 5007, 301, '2023-03-25', 1, 'Defective',       75000),
(9004, 5009, 303, '2023-04-15', 2, 'Customer Changed Mind', 6000),
(9005, 5011, 307, '2023-05-15', 1, 'Damaged',           4500),
(9006, 5014, 308, '2023-06-15', 1, 'Defective',        22000),
(9007, 5018, 308, '2023-08-15', 1, 'Wrong Product',    22000);


/* =========================================================
   9. PAYMENTS
   ========================================================= */

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentDate DATE NULL,
    PaymentMethod VARCHAR(30) NULL,
    PaymentAmount DECIMAL(12,2) NULL,
    PaymentStatus VARCHAR(30) NULL,

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);

INSERT INTO Payments
VALUES
(10001, 5001, '2023-01-05', 'Credit Card', 125000, 'Paid'),
(10002, 5002, '2023-01-08', 'UPI',          85000, 'Paid'),
(10003, 5003, '2023-01-15', 'Bank Transfer',210000,'Paid'),
(10004, 5004, '2023-02-02', 'Credit Card',   45000, 'Refunded'),
(10005, 5005, '2023-02-18', 'Bank Transfer',175000,'Paid'),
(10006, 5006, '2023-03-01', 'UPI',           95000,'Paid'),
(10007, 5007, '2023-03-14', 'Credit Card',  320000,'Paid'),
(10008, 5008, '2023-03-20', 'UPI',           70000,'Pending'),
(10009, 5009, '2023-04-05', 'Bank Transfer',110000,'Paid'),
(10010, 5010, '2023-04-20', 'Credit Card',  250000,'Paid'),
(10011, 5011, '2023-05-01', 'UPI',          150000,'Paid'),
(10012, 5012, '2023-05-10', 'UPI',           90000,'Paid'),
(10013, 5013, '2023-05-15', 'Bank Transfer',180000,'Paid'),
(10014, 5014, '2023-06-01', 'Credit Card',  220000,'Paid'),
(10015, 5015, '2023-06-20', 'UPI',          350000,'Pending'),
(10016, 5016, '2023-07-05', 'Bank Transfer',275000,'Paid');


/* =========================================================
   10. SALES TARGETS
   ========================================================= */

CREATE TABLE SalesTargets
(
    TargetID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    TargetMonth DATE NOT NULL,
    SalesTarget DECIMAL(12,2) NULL,

    FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);

INSERT INTO SalesTargets
VALUES
(11001, 102, '2023-01-01', 300000),
(11002, 102, '2023-02-01', 350000),
(11003, 102, '2023-03-01', 400000),
(11004, 102, '2023-04-01', 400000),
(11005, 102, '2023-05-01', 450000),

(11006, 103, '2023-01-01', 300000),
(11007, 103, '2023-02-01', 350000),
(11008, 103, '2023-03-01', 350000),
(11009, 103, '2023-04-01', 400000),
(11010, 103, '2023-05-01', 450000),

(11011, 104, '2023-01-01', 250000),
(11012, 104, '2023-02-01', 300000),
(11013, 104, '2023-03-01', 350000),
(11014, 104, '2023-04-01', 350000),
(11015, 104, '2023-05-01', 400000);


/* =========================================================
   11. PROMOTIONS
   ========================================================= */

CREATE TABLE Promotions
(
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    ProductID INT NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    DiscountPercent DECIMAL(5,2) NULL,

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO Promotions
VALUES
(12001, 'New Year Sale',      301, '2023-01-01', '2023-01-15', 10),
(12002, 'Republic Day Sale',  302, '2023-01-20', '2023-01-30', 15),
(12003, 'Summer Sale',        303, '2023-04-01', '2023-04-30', 12),
(12004, 'Monsoon Sale',       305, '2023-07-01', '2023-07-31', 10),
(12005, 'Festival Sale',      301, '2023-10-01', '2023-10-31', 20),
(12006, 'Festival Sale',      307, '2023-10-01', '2023-10-31', 15);


/* =========================================================
   12. CUSTOMER FEEDBACK
   ========================================================= */

CREATE TABLE CustomerFeedback
(
    FeedbackID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderID INT NULL,
    FeedbackDate DATE NULL,
    Rating INT NULL,
    FeedbackText VARCHAR(500) NULL,

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);

INSERT INTO CustomerFeedback
VALUES
(13001, 201, 5001, '2023-01-10', 5, 'Excellent service'),
(13002, 202, 5002, '2023-01-15', 4, 'Good experience'),
(13003, 203, 5003, '2023-01-25', 3, 'Product damaged'),
(13004, 205, 5005, '2023-03-01', 4, 'Good product'),
(13005, 206, 5006, '2023-03-10', 5, 'Very satisfied'),
(13006, 207, 5007, '2023-03-28', 2, 'Product defective'),
(13007, 209, 5009, '2023-04-20', 4, 'Good service'),
(13008, 210, 5010, '2023-04-30', 5, 'Excellent delivery'),
(13009, 201, 5011, '2023-05-10', 4, 'Good'),
(13010, 205, 5014, '2023-06-20', 3, 'Average experience');


/* =========================================================
   13. PURCHASE ORDERS
   ========================================================= */

CREATE TABLE PurchaseOrders
(
    PurchaseOrderID INT PRIMARY KEY,
    SupplierID INT NOT NULL,
    WarehouseID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ExpectedDate DATE NULL,
    ActualDeliveryDate DATE NULL,
    PurchaseStatus VARCHAR(30) NULL,

    FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID),

    FOREIGN KEY (WarehouseID)
        REFERENCES Warehouses(WarehouseID)
);

INSERT INTO PurchaseOrders
VALUES
(14001, 401, 501, '2024-01-01', '2024-01-08', '2024-01-07', 'Received'),
(14002, 402, 502, '2024-01-03', '2024-01-12', '2024-01-15', 'Received'),
(14003, 403, 503, '2024-01-05', '2024-01-17', '2024-01-16', 'Received'),
(14004, 404, 502, '2024-01-07', '2024-01-12', '2024-01-12', 'Received'),
(14005, 405, 505, '2024-01-10', '2024-01-25', '2024-01-28', 'Received'),
(14006, 406, 504, '2024-01-12', '2024-01-20', '2024-01-20', 'Received'),
(14007, 407, 501, '2024-01-15', '2024-01-25', NULL,         'Pending');


/* =========================================================
   14. PURCHASE ORDER DETAILS
   ========================================================= */

CREATE TABLE PurchaseOrderDetails
(
    PurchaseOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NULL,
    UnitCost DECIMAL(10,2) NULL,

    PRIMARY KEY (PurchaseOrderID, ProductID),

    FOREIGN KEY (PurchaseOrderID)
        REFERENCES PurchaseOrders(PurchaseOrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);

INSERT INTO PurchaseOrderDetails
VALUES
(14001, 301, 100, 59000),
(14001, 302, 150, 17500),
(14002, 301, 120, 60000),
(14002, 302, 100, 18000),
(14003, 305, 80, 7800),
(14003, 306, 50, 11500),
(14004, 303, 500, 1700),
(14004, 304, 700, 750),
(14005, 305, 100, 8000),
(14005, 306, 60, 12000),
(14006, 308, 100, 16500),
(14006, 307, 150, 2700),
(14007, 303, 400, 1800);


/* =========================================================
   VERIFY NEW TABLES
   ========================================================= */

SELECT * FROM Suppliers;
SELECT * FROM ProductSuppliers;
SELECT * FROM Warehouses;
SELECT * FROM Inventory;
SELECT * FROM InventoryTransactions;
SELECT * FROM Shipments;
SELECT * FROM Deliveries;
SELECT * FROM Returns;
SELECT * FROM Payments;
SELECT * FROM SalesTargets;
SELECT * FROM Promotions;
SELECT * FROM CustomerFeedback;
SELECT * FROM PurchaseOrders;
SELECT * FROM PurchaseOrderDetails;
GO








                         ┌── Departments
                         │
Employees ───────────────┼── Projects
    │                    │
    └── EmployeeProjects │
                         │
                         └── SalesTargets
                             
Customers
    │
    └── Orders ───────────────┐
          │                   │
          ├── OrderDetails ─ Products
          │                       │
          ├── Payments            └── ProductSuppliers ─ Suppliers
          ├── Shipments
          │      │
          │      └── Deliveries
          │
          └── Returns

Products
    │
    ├── Inventory ─ Warehouses
    │
    ├── InventoryTransactions
    │
    └── Promotions

Suppliers
    │
    └── PurchaseOrders
             │
             └── PurchaseOrderDetails

Customers
    │
    └── CustomerFeedback