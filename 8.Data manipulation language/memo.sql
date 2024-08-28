--page 7
--q1
use airbnb;
create database ShopPty;
use ShopPty;

create table Customers (CustomerID varchar(5), CompanyName  varchar(40), ContactName varchar(30));

create table Orders (OrderID int, CustomerID varchar(5), EmployeeID int, OrderDate date, RequiredDate date, ShippedDate date);

create table OrderDetails (OrderID int, ProductID int, UnitPrice decimal(10,4), Quantity smallint, Discount real);

create table Products (ProductID int, ProductName varchar(40), SupplierID int, CategoryID int, QuantityPerUnit varchar(20), UnitPrice decimal(10,4), UnitsInStock smallint);

select * from Products;

alter table Products
add Description varchar(255);

alter table Products
drop column Description;

--q2
insert into Customers values ('1', 'Yeezus', 'Kanye');
insert into Orders values (2, '2', 22, '2024/04/05', '2024/05/06', '2024/05/10');
insert into OrderDetails values (3, 3, 333.33, 3, 30);
insert into Products values (4, 'Yeezus Piece', 44, 4, '4', 444.44, 4);

--q3
truncate table OrderDetails;

--q4
drop table OrderDetails;

--page 8
--q2
use airbnb;
ALTER TABLE hosts 
alter COLUMN birthdate DATE;

alter table hosts
change column birthdate birthdate date;

--page 11
--q1
use [HR analytics];
create table HR_fulltime (enrollee_id float, city nvarchar(255), enrolled_university nvarchar(255));

--q2
insert into HR_fulltime select enrollee_id, city, enrolled_university from HR_unknown
where enrolled_university = 'Full time course';

select * from HR_fulltime

--page 13
--q1.a
use airbnb;
select * from listings
order by host_name;

--(Email hidden by Airbnb)  & NULL values

--q1.b
--8 entries

--q1.c
update listings
set host_name = 'Not completed'
where host_name is NULL;

update listings
set host_name = 'Hidden'
where host_name = '(Email hidden by Airbnb)';

select * from listings;

--q2
UPDATE employee  SET phone = REPLACE( phone   +1-    +27-  );