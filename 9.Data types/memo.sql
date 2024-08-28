--page 8
--q1
use employee;

CREATE TABLE employees ( 
first_name varchar(25), 
last_name varchar(25), 
email varchar(100), 
hire_date date, 
salary decimal(6,2), 
employment varchar(25), 
date_of_birth date, 
notes nvarchar(max) 
);

CREATE TABLE employees2 ( 
first_name varchar(25), 
last_name varchar(25), 
email varchar(100), 
hire_date date, 
salary decimal(6,2), 
employment varchar(25) check(employment in ('permanent fixed-term', 'casual zero hours', 'independent contract')), 
date_of_birth date, 
notes nvarchar(max) 
);

select * from employees;