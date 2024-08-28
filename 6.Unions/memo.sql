use [HR analytics];
--page 9
--q1
select * from HR_F
union
select * from HR_M
union 
Select * from HR_unknown;

--q2
SELECT *
FROM (
    SELECT *
    FROM HR_F
    UNION
    SELECT *
    FROM HR_M
    UNION
    SELECT *
    FROM HR_unknown
) AS combined_data
WHERE enrolled_university LIKE 'Full time%';

select * from HR_F
where enrolled_university like  'Full time%'
Union
select * from HR_M
where enrolled_university like 'Full time%'
union 
Select * from HR_unknown
where enrolled_university like 'Full time%';

select * from HR_F
where enrolled_university =  'Full time course'
Union
select * from HR_M
where enrolled_university = 'Full time course'
union 
Select * from HR_unknown
where enrolled_university = 'Full time course';

--page 10
--q1
use [Nobel-database];

select country from countries
Union all
select country from countriesother;

--q2
select country from countries
Union
select country from countriesother;

--q3
select top 5 Country,[Number of prizes] from Countries
union
select top 5 country,Number_of_prizes from Countriesother;

select Country, `Number of prizes` from Countries
union
select country, Number_of_prizes from Countriesother
limit 5;

--q4
select Country from Countries
where [Percentage prizes won by men] like '%100%'
union
select country from Countriesother
where percentage_prizes_won_m like '%100%';

select Country from Countries
where [Percentage prizes won by men] = '100%'
union
select country from Countriesother
where percentage_prizes_won_m = '100%';

select Country from Countries
where `percentage prizes won by men` like '%100%'
union
select country from Countriesother
where percentage_prizes_won_m like '%100%';

--page 11
--q1
use auditions;

select * from Table1
union all
select * from Table2;

--q2
select * from Table1
where Gender = 'M'
union
select * from Table2
where Gender = 'M';

--q3
select * from Table1
where Gender = 'f'
union
select * from Table2
where Age > '15';

--page 12
--q1
use [Shop data];
use shop_data;

select * from Shopdata1 as s1
where s1.ItemQuantity > 500
union
select * from Shopdata2  as s2
where s2.ItemQuantity > 500;

--q2
select distinct s1.[Product Name] from Shopdata1 as s1
union
select distinct s2.[Product Name] from Shopdata2 as s2;

select distinct 'Product Name' from Shopdata1
union
select distinct 'Product Name' from Shopdata2;

--q3
select * from Shopdata1 as s1
where month(s1.OrderDate) = 03
union
select * from Shopdata2 as s2
where month(s2.OrderDate) = 03;

select * from Shopdata1
where OrderDate like '%/03/%'
union
select * from Shopdata2
where OrderDate like '%/03/%'

--q4
select s1.[Product Name], s1.ItemQuantity, s1.OrderDate from Shopdata1 as s1
where year(s1.OrderDate) between 2021 and 2023
union
select s2.[Product Name], s2.ItemQuantity, s2.OrderDate from Shopdata2 as s2
where year(s2.OrderDate) between 2021 and 2023

select 'Product Name', ItemQuantity, OrderDate from Shopdata1
where year(OrderDate) between 2021 and 2023
union
select 'Product Name', ItemQuantity, OrderDate from Shopdata2
where year(OrderDate) between 2021 and 2023

Select `Product Name`, ItemQuantity, OrderDate from shopdata1 Where OrderDate between '2021/01/01' AND '2023/12/31'
Union 
Select `Product Name`, ItemQuantity, OrderDate from shopdata2 Where OrderDate between '2021/01/01' AND '2023/12/31';

--q5
select * from Shopdata1 as s1
where s1.ItemOrdID = 11
union
select * from Shopdata2 as s2
where s2.ItemOrdID = 11

--q6
select * from Shopdata1 as s1
where s1.[Product Name] like 'C%'
union
select * from Shopdata2 as s2
where s2.[Product Name] like 'C%'

select * from Shopdata1
where `Product Name` like 'C%'
union
select * from Shopdata2
where `Product Name` like 'C%'