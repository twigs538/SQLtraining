--pg 12
--q1
create database Disney;

--q2
use Disney;

create table #characters(name varchar(20), 
city varchar(20),
scene int
);

insert into #characters values ('Goofy', 'France', 301),
('Minnie', 'Mouse Italy', 304),
('Simba', 'Texas', 400);

--q3
select name into ##CharNames from #characters;

select * from ##CharNames;

--q4
--Both, disconnecting the session that created the temp tables  drops the temp tables by that session.

--q5
drop table ##CharNames;

--pg15
--q1
use airbnb;

select name, room_type, price, Rank() over (order by price desc) price_rank from listings;

SELECT name, room_type, price
	,rank() over (order by price desc) as price_rank
	,DENSE_RANK() over (order by price desc) as price_rank_dense
from listings
order by 4;
 

--pg24
--q1
CREATE TABLE Employees (Dept varchar(1), 
TSR varchar(max), 
[Date] date, 
Salary float)

insert into Employees values
('A', 'Zee', '2013-06-06', 55000)
,('B', 'Lindi', '2014-06-01', 60000)
,('C', 'Nomsa', '2015-06-01', 65000)
,('D', 'David', '2016-06-01', 70000)

select * from employees;

--pg29
--q1
select *
from (select neighbourhood,price,room_type from listings) As tb
pivot(sum(price) for room_type in( [Private room],[hotel room],[shared room]))
As pivot_table;
