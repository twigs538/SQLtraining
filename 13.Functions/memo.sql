--pg27
--q1
use [L&D_Company_tables];

select first_name, last_name, hire_date, DATEDIFF(year,hire_date, getdate()) DurationAtCompany from Employees;

select first_name, last_name, hire_date, DATEDIFF(hire_date, curdate()) DurationAtCompany from Employees;

select first_name
	, last_name
	, hire_date
	,  case when DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date))>getdate() --if the last full year date is after the current date 
			then DATEDIFF(YYYY, hire_date, dateadd(year,-1,getdate())) --then calculate the number of years up to last years anniversary
				else DATEDIFF(year, hire_date, getdate()) end as years --otherwise get the number of years up to this year
	--, DATEDIFF(year, hire_date, getdate()) as YearCheck
	, case when DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date))>getdate() --if the last full year date is after the current date
			and DATEFROMPARTS(year(getdate()),month(getdate()),day(hire_date))>getdate() --and the last full month is after the current date
				then datediff(m,DATEFROMPARTS(year(getdate())-1,month(hire_date),day(hire_date)),eomonth(GETDATE(),-1)) --then calculate the number of months from last year's anniversary up to last month
			when DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date))>getdate() --if the last full year date is after the current date
			and DATEFROMPARTS(year(getdate()),month(getdate()),day(hire_date))<getdate() --the last full month is before the current date
				then datediff(m,DATEFROMPARTS(year(getdate())-1,month(hire_date),day(hire_date)),GETDATE()) --then calculate the number of months from last year's anniversary up to this month
			when DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date))<getdate() --if the last full year date is before the current date
			and DATEFROMPARTS(year(getdate()),month(getdate()),day(hire_date))>getdate() --and the last full month is after the current date
				then datediff(m,DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date)),eomonth(GETDATE(),-1)) --then calculate the number of months from this year's anniversary up to last month
			when DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date))<getdate() --if the last full year date is before the current date
			and DATEFROMPARTS(year(getdate()),month(getdate()),day(hire_date))<getdate() --and the last full month is before the current date
				then datediff(m,DATEFROMPARTS(year(getdate()),month(hire_date),day(hire_date)),GETDATE()) --then calculate the number of months from this year's anniversary up to this month
			else 0 end as months --else the anniversary is equal to the current day and there are therefore no months to count
	, case when day(hire_date)>day(getdate()) --if the day is after the current date
				then DATEDIFF(d, DATEFROMPARTS(year(getdate()),month(getdate())-1,day(hire_date)),getdate()) --then calculate the number of days from last month's anniversary to now
			when day(hire_date)<day(getdate()) --if the day is before the current date
				then DATEDIFF(d, DATEFROMPARTS(year(getdate()),month(getdate()),day(hire_date)),getdate()) --then calculate the number of days from this month's anniversary
			else 0 end as [days] --other wise there are no days to count
from Employees;

--q2
select first_name, last_name, hire_date, dateadd(year, 30, hire_date) "30 year anniversary" from Employees;

select first_name, last_name, hire_date, DATE_ADD(hire_date, INTERVAL 30 year) "30 year anniversary" from Employees;

select distinct first_name
	, last_name
	, hire_date
	, cast(datefromparts(year(hire_date)+30, month(hire_date), day(hire_date)) as datetime)  as anniversay_30
from Employees;

--q3
select year(hire_date) "YearHired", count(*) "NumberOfEmployeesHired" from Employees
group by year(hire_date);

--q4
select first_name, last_name, eomonth(hire_date) "PayDay" from Employees;

select first_name, last_name, LAST_DAY(hire_date) "PayDay" from Employees;

--pg 28
/*Pg. 28. Practice DATE FUNCTIONS*/
--1
use [L&D_Shop_tables];
select * from Payments
where paymentDate between '2005/01/01' and '2005/01/03';

select * from Payments
where paymentDate between '2005-01-01' and '2005-01-03';
 
--2 /*need to specify date format e.g. dd/mm/yyyy or mm/dd/yyy*/
select * from Orders
where DATEDIFF(m, orderDate, '2005/04/10') between 1 and 3;

select * from Orders
where DATEDIFF(orderDate, '2005/04/10') between 1 and 3;
 
--3 /*there is no records with a 2000 order year*/
select min(year(orderdate))
from Orders
where YEAR(orderDate)=2000;

--pg 29
/*pg.29 Practice Date Functions*/
--1 /*assumed the the day ends at midnight*/
use airports;
select distinct name
	, municipality
	, iso_region
	, last_updated
	, datepart(hour,last_updated)
from airports
where datepart(hour,last_updated) between 17 and 20;

select distinct name
	, municipality
	, iso_region
	, last_updated
	, extract(hour from last_updated)
from airports
where extract(hour from last_updated) between 17 and 20;

select * from airports;

--pg 30
--q1
use [L&D_Shop_tables];
use l&d_shop_sql_scripts;

select o.orderNumber,o.orderdate,p.paymentdate,p.customerNumber, DATEDIFF(day,o.orderdate,p.paymentdate) from orders o
join payments p on o.customerNumber=p.customerNumber
where o.orderNumber=10123 and p.customerNumber=103;

select o.orderNumber,o.orderdate,p.paymentdate,p.customerNumber, DATEDIFF(o.orderdate,p.paymentdate) from orders o
join payments p on o.customerNumber=p.customerNumber
where o.orderNumber=10123 and p.customerNumber=103;

select o.customerNumber
	, o.orderNumber
	, sum(od.priceEach*od.quantityOrdered) as orderTotal
	, o.orderDate
	, p.paymentDate
	, p.amount
	, DATEDIFF(d, o.orderDate, p.paymentDate) as daysToPay
from Orders o
join OrderDetails od on od.orderNumber=o.orderNumber
join Payments p on p.customerNumber=o.customerNumber 
where o.customerNumber=103 and o.orderNumber=10123 
group by o.customerNumber
	, o.orderNumber
	, o.orderDate
	, p.paymentDate
	, p.amount
having sum(od.priceEach*od.quantityOrdered)=p.amount

select * from orders;
select * from Payments;

--q2
select c.customerNumber,o.orderNumber,c.customerName,o.shippedDate, o.requiredDate from orders o
join Customers c on o.customerNumber=c.customerNumber
where datediff(day,shippedDate,requiredDate)>7;

select distinct c.customerNumber
	, c.customerName
	--, o.shippedDate
	--, o.requiredDate
from Orders o
join Customers c on c.customerNumber=o.customerNumber
where o.status='shipped' and DATEDIFF(day,o.shippedDate,o.requiredDate) >= 7;

--q3
select c.customerNumber,o.orderNumber,c.customerName,o.shippedDate, o.requiredDate
from orders o 
join Customers c on o.customerNumber=c.customerNumber
where o.shippedDate>o.requiredDate;

--q4
select c.customerNumber,o.orderNumber,c.customerName,o.shippedDate, o.requiredDate ,
case when datediff(day,shippedDate,requiredDate)>7 then 'early'
     when o.shippedDate>o.requiredDate then 'late'
 else 'Invalid'
 end status
from orders o 
join Customers c on o.customerNumber=c.customerNumber
order by status;

--4
select c.customerNumber
	, c.customerName
	, o.orderNumber
	, sum(od.priceEach*od.quantityOrdered) as orderTotal
	, p.amount
	, case when datediff(day, p.paymentDate, o.orderDate) > 7 then 'early' else 'late' end as paymentReceived
from Orders o
join OrderDetails od on od.orderNumber=o.orderNumber
left join Customers c on c.customerNumber=o.customerNumber
left join Payments p on p.customerNumber=o.customerNumber
group by c.customerNumber
	, c.customerName
	, o.orderNumber
	, p.amount
	, case when datediff(day, p.paymentDate, o.orderDate) > 7 then 'early' else 'late' end
--having sum(od.priceEach*od.quantityOrdered)=p.amount

select distinct c.customerNumber
	, c.customerName
	, o.orderNumber
	, p.amount
	, case when datediff(day, p.paymentDate, o.orderDate) > 7 then 'early' else 'late' end as paymentReceived
from Orders o
join OrderDetails od on od.orderNumber=o.orderNumber
left join Customers c on c.customerNumber=o.customerNumber
left join Payments p on p.customerNumber=o.customerNumber