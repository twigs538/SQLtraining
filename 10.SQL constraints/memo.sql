--page 19
--q1
use [HR analytics];

Create table PL_employees(Employee_ID int primary key,
First_name varchar(20) not null,
Last_Name varchar(20) not null,
Wage_amount int CHECK (wage_amount>=10000) not null,
Age int CHECK (Age>=18) not null,
citizenship varchar CHECK (citizenship='South African') not null,
Email varchar unique not null);

select * from PL_employees;
--select * from employees;

--page 27
use [HR analytics];

CREATE TABLE employmenttypes(
job_id int PRIMARY KEY,
job_title varchar,
min_salary money,
max_salary money
);

select * from employmenttypes;

--page 28
--q1
ALTER TABLE employmenttypes
drop CONSTRAINT PK__employme__6E32B6A5E58278EF;

alter table employmenttypes
drop PRIMARY KEY;

--q2
ALTER TABLE employmenttypes 
ADD CONSTRAINT uq_job_title Unique(job_title);

--q3
ALTER TABLE employmenttypes
ADD CONSTRAINT ck_min_salary CHECK (Min_salary > 10000);

--q4
ALTER TABLE employmenttypes
ADD CONSTRAINT ck_max_salary CHECK (Max_salary < 100000);

EXECUTE sp_columns employmenttypes;

EXEC sp_rename 'table name', 'new table name';

sp_help employmenttypes;

select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS

SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE  
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS;

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS;

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.CONSTRAINT_COLUMN_USAGE

SELECT name
FROM   sys.key_constraints
WHERE  [type] = 'PK'
       AND [parent_object_id] = Object_id('[dbo].[PL_employees]');

select COLUMN_NAME, CONSTRAINT_NAME, REFERENCED_COLUMN_NAME, REFERENCED_TABLE_NAME
from information_schema.KEY_COLUMN_USAGE
where TABLE_NAME = 'employmenttypes';

CREATE TABLE Employees (
  EmployeeID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DepartmentID INT,
  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);