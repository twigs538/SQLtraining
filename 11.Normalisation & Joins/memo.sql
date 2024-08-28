use restaurant;

--page 31
--q1
select s.customer_ID, sum(m.price)from sales s
join menu m on 
s.product_id = m.product_id
group by s.customer_id;

select m.customer_id, join_date, sum(me.price) as MoneySpent
from Members m
join Sales s on s.customer_id=m.customer_id
join Menu me on me.product_id=s.product_id
group by m.customer_id, join_date

--q2
select m.product_name, count(s.product_ID) as Times_Purchased from menu m 
join sales s on 
m.product_id = s.product_id 
group by m.product_name 
order by count(s.product_ID) desc;

--q3
select s.customer_ID, sum(m.price) from sales s 
join menu m on s.product_id = m.product_id 
join members mem on s.customer_id = mem.customer_id 
where s.order_date < mem.join_date 
group by s.customer_id;

select m.customer_id, count(s.product_id) as NoPurchased , sum(me.price) OrderTotal from Members m
join Sales s on s.customer_id=m.customer_id and s.order_date<m.join_date
join Menu me on me.product_id=s.product_id
group by m.customer_id
order by m.customer_id;

use [L&D_Company_tables];
--page 33
--q1
select a.first_name,a.last_name,b.job_title from Employees a
inner join jobs b on a.job_id=b.job_id;

--q2
select a.first_name,a.last_name,b.job_title,c.department_name from Employees a
inner join jobs b on a.job_id=b.job_id
inner join Departments c on a.department_id=c.department_id;

--q3
select a.first_name,a.last_name,b.department_name,c.city from Employees a
inner join departments b on a.department_id=b.department_id
inner join locations c on c.location_id=b.location_id;

select distinct em.first_name, em.last_name, d.department_name, l.city
from Employees em
left join Departments d on d.department_id=em.department_id
left join Locations l on l.location_id=d.location_id

--q4
select a.first_name,a.last_name,b.first_name from Employees a
inner join Employees b on b.employee_id=a.manager_id;

select distinct em1.first_name as Manager_first_name, em2.first_name as Employee_first_name from Employees em1
left join Employees em2 on em2.employee_id=em1.manager_id;

--q5
select a.first_name,a.last_name,b.department_name from Employees a
inner join departments b on a.department_id=b.department_id
order by b.department_name;

--q6
select a.department_name, sum(b.salary) from Employees b
inner join departments a on a.department_id=b.department_id
group by a.department_name;

--page 34
--q1
select a.first_name,a.last_name,count(b.relationship) from Employees a
inner join dependants b on a.employee_id=b.employee_id
group by a.first_name,a.last_name;

--q2
select * from Employees;

select first_name, salary
from Employees

select first_name, department_id, salary - (select min(salary) from employees) min_amount
from employees;

Select employees.first_name, employees.salary, employees.salary - jobs.min_salary as amount_above_min from employees
left join jobs on  jobs.job_id = employees.job_id;

--q3
Select regions.region_name, COUNT(employees.employee_id) as no_employees from employees
left join departments on  departments.department_id = employees.department_id
left join locations on locations.location_id = departments.location_id
left join countries on countries.country_id = locations.country_id
left join regions on regions.region_id = countries.region_id
Group by regions.region_name;


With Departmentcount (name, surname, depID, Dep) as 
(
Select e.first_name, e.last_name, e.department_id,d.department_name from employees e
join departments$ d on e.department_id=d.department_id
)
select dep, count(*) 
from DepartmentCount
Group by dep;


-----------------------------------------------------
CREATE database restaurant;
USE restaurant;
CREATE TABLE sales (
 customer_id VARCHAR(1), 
 order_date DATE, 
 product_id INTEGER
);
INSERT INTO sales
 (customer_id, order_date, product_id)
VALUES
 ( 'A', '2021-01-01', 1 ),
 ( 'A', '2021-01-01', 2 ), 
 ( 'A', '2021-01-07', 2 ), 
 ( 'A', '2021-01-10', 3 ), 
 ( 'A', '2021-01-11', 3 ), 
 ( 'A', '2021-01-11', 3 ), 
 ( 'B', '2021-01-01', 2 ), 
 ( 'B', '2021-01-02', 2 ), 
 ( 'B', '2021-01-04', 1 ), 
 ( 'B', '2021-01-11', 1 ), 
 ( 'B', '2021-01-16', 3 ), 
 ( 'B', '2021-02-01', 3 ), 
 ( 'C', '2021-01-01', 3 ), 
 ( 'C', '2021-01-01', 3 ), 
 ( 'C', '2021-01-07', 3 );

CREATE TABLE menu (
 product_id INTEGER, 
 product_name VARCHAR(5),
 price INTEGER
);
INSERT INTO menu
 (product_id, product_name, price)
VALUES
 ( 1, 'sushi', 10 ), 
 ( 2, 'curry', 15 ), 
 ( 3, 'ramen', 12 );
 
CREATE TABLE members (
 customer_id VARCHAR(1), 
 join_date DATE
);
INSERT INTO members
 (customer_id, join_date)
VALUES
 ( 'A', '2021-01-07' ), 
 ( 'B', '2021-01-09' );

create table Normalisation (
Project_Code varchar(5),
Project_Name varchar(20),
Project_Manager varchar(20),
Project_Budget int,
Employee_No varchar(4),
Employee_Name varchar(20),
Department_No varchar(3),
Department_Name varchar(20),
Hourly_Rate int)

insert into Normalisation values
('PC010','Reservation System','Mr. Ajay',120500,'S100','Mohan','D03','Database',21),
('PC010','Reservation System','Mr. Ajay',120500,'S101','Vipul','D02','Testing',16),
('PC010','Reservation System','Mr. Ajay',120500,'S102','Riyaz','D01','IT',22),
('PC011','HR System','Mrs. Charu',500500,'S103','Pavan','D03','Database',18),
('PC011','HR System','Mrs. Charu',500500,'S104','Jitendra','D02','Testing',17),
('PC011','HR System','Mrs. Charu',500500,'S315','Pooja','D01','IT',23),
('PC012','Attendance System','Mr. Rajesh',710700,'S137','Rahul','D03','Database',21),
('PC012','Attendance System','Mr. Rajesh',710700,'S218','Avneesh','D02','Testing',15),
('PC012','Attendance System','Mr. Rajesh',710700,'S109','Vikas','D01','IT',20)

--1NF
select * from Normalisation;


--2NF
create table EmployeesTable(
Employee_No varchar(4),
Employee_Name varchar(20),
Hourly_Rate int);

create table ProjectTable(
Employee_No varchar(4),
Project_Code varchar(5),
Project_Name varchar(20),
Project_Manager varchar(20),
Project_Budget int);

create table DepartmentTable(
Employee_No varchar(4),
Department_No varchar(3),
Department_Name varchar(20)
)

insert into EmployeesTable
select Employee_No, Employee_Name, Hourly_Rate from Normalisation

select * from EmployeesTable

insert into DepartmentTable
select Employee_No, Department_No, Department_Name from Normalisation;

select * from DepartmentTable;

insert into ProjectTable
select Employee_No, Project_Code, Project_Name, Project_Manager, Project_Budget from Normalisation

select * from ProjectTable;

--3NF
select * from EmployeesTable;
select * from DepartmentTable;
select * from ProjectTable;