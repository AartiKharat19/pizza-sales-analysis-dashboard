
-- ==================================================
-- PROJECT: COMPANY EMPLOYEE AND DATABASE MANAGEMENT
-- ==================================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS companies;
USE companies;


-- 2. CREATE DEPARTMENT TABLE
CREATE TABLE department (
    DepartmentID INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);


-- 3. CREATE EMPLOYEES TABLE
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    employee_name VARCHAR(100),
    DepartmentID INT,
    salary DECIMAL(10,2),
    managerid VARCHAR(10),
    joining_date DATE,
    FOREIGN KEY (DepartmentID)
        REFERENCES department(DepartmentID)
);


-- 4. INSERT DATA INTO DEPARTMENT TABLE
USE companies;

INSERT INTO department
(DepartmentID, department_name, location)
VALUES
(101, 'IT', 'Pune'),
(102, 'HR', 'Thane'),
(103, 'CS', 'Mumbai'),
(104, 'BI', 'Pune'),
(105, 'Finance', 'Delhi'),
(106, 'Marketing', 'Nashik'),
(107, 'Sales', 'Mumbai'),
(108, 'Support', 'Pune'),
(109, 'Testing', 'Bangalore'),
(110, 'Development', 'Hyderabad'),
(111, 'Operations', 'Pune'),
(112, 'Research', 'Delhi'),
(113, 'Analytics', 'Mumbai'),
(114, 'Security', 'Pune'),
(115, 'Networking', 'Chennai'),
(116, 'Cloud', 'Bangalore'),
(117, 'Database', 'Pune'),
(118, 'Design', 'Delhi'),
(119, 'Training', 'Mumbai'),
(120, 'Admin', 'Thane');


-- 5. INSERT DATA INTO EMPLOYEES TABLE
INSERT INTO employees
(EmployeeID, employee_name, DepartmentID,
 salary, managerid, joining_date)
VALUES
(1, 'Aarti', 101, 20000, 'M101', '2022-03-12'),
(2, 'Pooja', 102, 30000, 'M102', '2023-06-30'),
(3, 'Ramesh', 103, 24000, 'M103', '2021-11-01'),
(4, 'Rekha', 104, 24000, 'M104', '2020-11-01'),
(5, 'Amit', 105, 45000, 'M105', '2019-01-15'),
(6, 'Neha', 106, 35000, 'M106', '2021-07-10'),
(7, 'Rahul', 107, 28000, 'M107', '2022-08-20'),
(8, 'Sneha', 108, 32000, 'M108', '2020-05-18'),
(9, 'Vikas', 109, 40000, 'M109', '2018-12-05'),
(10, 'Priya', 110, 50000, 'M110', '2019-09-25'),
(11, 'Karan', 111, 27000, 'M111', '2023-02-14'),
(12, 'Meena', 112, 38000, 'M112', '2021-04-22'),
(13, 'Sagar', 113, 42000, 'M113', '2020-10-11'),
(14, 'Anjali', 114, 33000, 'M114', '2022-01-08'),
(15, 'Rohit', 115, 29000, 'M115', '2023-11-16'),
(16, 'Kavya', 116, 55000, 'M116', '2018-06-19'),
(17, 'Nikhil', 117, 48000, 'M117', '2019-03-27'),
(18, 'Swati', 118, 26000, 'M118', '2022-12-01'),
(19, 'Manoj', 119, 31000, 'M119', '2021-08-09'),
(20, 'Divya', 120, 36000, 'M120', '2020-02-17');


-- 6. DISPLAY ALL DEPARTMENTS
SELECT *
FROM department;


-- 7. DISPLAY ALL EMPLOYEES
SELECT *
FROM employees;


-- 8. SHOW EMPLOYEES WORKING IN IT DEPARTMENT
SELECT d.department_name, e.employee_name
FROM employees AS e
JOIN department AS d
    ON e.DepartmentID = d.DepartmentID
WHERE d.department_name = 'IT';


-- 9. DISPLAY EMPLOYEES FROM DEPARTMENT 101
SELECT *
FROM employees
WHERE DepartmentID = 101;


-- 10. EMPLOYEES WITH SALARY >= 20000,
--     ORDERED FROM HIGHEST TO LOWEST
SELECT *
FROM employees
WHERE salary >= 20000
ORDER BY salary DESC;


-- 11. COUNT TOTAL EMPLOYEES
SELECT COUNT(*) AS total_employees
FROM employees;


-- 12. FIND AVERAGE SALARY OF ALL EMPLOYEES
SELECT AVG(salary) AS average_salary
FROM employees;


-- 13. FIND AVERAGE SALARY OF EACH DEPARTMENT
SELECT DepartmentID,
       AVG(salary) AS average_salary
FROM employees
GROUP BY DepartmentID;


-- 14. DEPARTMENTS HAVING AT LEAST 3 EMPLOYEES
SELECT DepartmentID,
       COUNT(EmployeeID) AS total_employees
FROM employees
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) >= 3;


-- 15. DISPLAY DEPARTMENT NAME AND EMPLOYEE NAME
SELECT d.department_name, e.employee_name
FROM employees AS e
JOIN department AS d
    ON e.DepartmentID = d.DepartmentID;


-- 16. FIND EMPLOYEES WITHOUT A DEPARTMENT
SELECT *
FROM employees
WHERE DepartmentID IS NULL;


-- 17. EMPLOYEES EARNING MORE THAN THE OVERALL
--     AVERAGE SALARY
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);


-- 18. DISPLAY EACH EMPLOYEE'S MANAGER ID
SELECT employee_name, managerid
FROM employees;


-- 19. CATEGORIZE EMPLOYEES BASED ON SALARY
SELECT employee_name, salary,
    CASE
        WHEN salary > 40000 THEN 'High'
        WHEN salary >= 30000 THEN 'Medium'
        WHEN salary > 20000 THEN 'Low'
        ELSE 'Very Low'
    END AS salary_category
FROM employees;


-- 20. FIND THE SECOND-HIGHEST DISTINCT SALARY
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


-- 21. CREATE AN INDEX ON EMPLOYEE NAME
CREATE INDEX idx_employee_name
ON employees(employee_name);


-- 22. SEARCH FOR A PARTICULAR EMPLOYEE USING NAME
SELECT *
FROM employees
WHERE employee_name = 'Aarti';


-- 23. VIEW EXISTING INDEXES
SHOW INDEX FROM employees;
