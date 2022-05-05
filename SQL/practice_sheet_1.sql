
-- create
CREATE TABLE Employee (
  Employee_Id INTEGER PRIMARY KEY,
  First_name TEXT NOT NULL,
  Last_name TEXT NOT NULL,
  Salary INTEGER NOT NULL,
  Joining_date TEXT NOT NULL,
  Department TEXT NOT NULL
);

-- insert
INSERT INTO Employee VALUES (1, 'Bob', 'Kinto', 1000000, '2019-01-20', 'Finance');
INSERT INTO Employee VALUES (2, 'Jerry', 'Kansxo', 6000000, '2019-01-15', 'IT');
INSERT INTO Employee VALUES (3, 'Philip', 'Jose', 8900000, '2019-02-05', 'Banking');
INSERT INTO Employee VALUES (4, 'John', 'Abraham', 2000000, '2019-02-25', 'Insurance');
INSERT INTO Employee VALUES (5, 'Michael', 'Mathew', 2200000, '2019-02-28', 'Finance');
INSERT INTO Employee VALUES (6, 'Alex', 'chreketo', 4000000, '2019-05-10', 'IT');
INSERT INTO Employee VALUES (7, 'Yohan', 'Soso', 1230000, '2019-06-20', 'Banking');

-- Get all employees. 
SELECT * FROM Employee;

-- Display the first name and last name of all employees.
SELECT First_name, Last_name FROM Employee;

-- Get the name of all employees having salary between 6000000 and 2200000.
SELECT First_name, Last_name FROM Employee WHERE Salary BETWEEN 2200000 AND 6000000;

-- Display all the values of the “First_Name” column using the alias “Employee Name”
SELECT First_name as Employee_Name from Employee;

-- Get all “Last_Name” in lowercase.
SELECT LOWER(Last_name) FROM Employee;

-- Get all “Last_Name” in uppercase.
SELECT UPPER(Last_name) FROM Employee;
