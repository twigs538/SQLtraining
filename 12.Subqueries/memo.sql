--page 3
--q1
use airbnb;

Select * from listings
where price >= (select avg(price) from listings)

--q2
Select name, price from listings
Where price = ( select max(price) from listings)

--page 31
use [L&D_Company_tables]
--q1
select first_name, last_name from employees
where job_id = (select job_id from jobs where job_title = 'Accountant')

--q2
select * from employees
where department_id in (select department_ID from departments where department_name = 'Finance');

--q3
select count(employee_id) from employees
where salary > (select avg(salary) from employees)

--q4
select first_name, last_name from employees
where job_id in (select job_id from jobs where min_salary > 8000)

select distinct em.first_name
	, em.last_name
from Platinum_Academy..LnDCompany_Employees em
join (select *
from Platinum_Academy..LnDCompany_Jobs
where min_salary>=8000) sub on sub.job_id=em.job_id

--Use a join to check this:
select e.first_name, e.last_name,  j.job_title, e.salary, min_salary from employees e
left join Jobs j
on j.job_ID = e.job_id
order by min_salary desc;

--page 32
--q1
select name from listings
where price = (select max(price) from listings);

--q2
select HOST_NAME, last_review from listings
where day(last_review) = 1;

select host_name, last_review from listings
where last_review in (select last_review from listings where day(last_review) = 1);

select host_name, last_review from listings
where last_review = (select min(last_review) from listings);

select distinct host_name
from Platinum_Academy..AirBnB_listings l
join (select listing_id
	, min(date) as FirstReviewDate
from Platinum_Academy..AirBnB_reviews
group by listing_id) sub on l.last_review=sub.FirstReviewDate and l.id=sub.listing_id

--q3
select * from listings
where price < (select avg(price) from listings);

--page 38
--q1
use [L&D_Company_tables];
use l&d_company_sql_scripts;
select * from Departments;

With Departmentcount (name, surname, depID, Dep) as 
(
Select e.first_name, e.last_name, e.department_id, d.department_name from employees e
join departments d
on e.department_id=d.department_id
)
select dep, count(*) 
from DepartmentCount
Group by dep;

--q2
use [L&D_Company_tables];
use l&d_company_sql_scripts;

with TotalSal (EmpID, Dep, Job, Salary) as
(
Select e.employee_ID, d.department_name , j.job_title , e.salary 
from employees e
inner  join departments d
on e.department_ID = d.department_ID
inner join jobs j
on e.job_id = j.job_id
)
Select Dep, Job, sum(Salary)
from TotalSal
group by Dep, Job