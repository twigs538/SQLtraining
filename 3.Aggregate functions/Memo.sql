use airbnb;

--page 10
--q1
select sum(price) as TotalPrice from listings
where neighbourhood = 'Ward 77';

--q2
select AVG(price) as AvgPrice from listings
where room_type = 'Private room';

select round(AVG(price),2) as AvgPrice from listings
where room_type = 'Private room';

select convert(decimal,avg(price),2) from listings
where room_type = 'Private room';

select concat('R',round(AVG(price),2)) as AvgPrice from listings
where room_type = 'Private room';

select 'R' + cast(round(AVG(price),2) as varchar) as AvgPrice from listings
where room_type = 'Private room';

select 'R' + convert(varchar, round(avg(price),2)) from listings
where room_type = 'Private room';

--q3
select MAX(minimum_nights) as HighMinimumNights from listings
where neighbourhood = 'Ward 60';

--q4
select count(minimum_nights) as HowManyMinimum from listings
where room_type = 'Shared room' and minimum_nights = 1;

select count(room_type) as HowManyMinimum from listings
where room_type = 'Shared room' and minimum_nights = 1;

select count(*) as HowManyMinimum from listings
where room_type = 'Shared room' and minimum_nights = 1;

--page 11
--q1
select top 1 name, max(price) as MostExpensiveListings from listings
group by name
order by MostExpensiveListings desc;

select name, max(price) as MostExpensiveListings from listings
group by name
order by MostExpensiveListings desc
limit 1;

select top 1 name, price as MostExpensiveListings
from listings
order by MostExpensiveListings desc;

select name, price as MostExpensiveListings
from listings
order by MostExpensiveListings desc
limit 1;

Select name
From listings
Where price = (Select MAX(price) from listings);

--q2
select count(name) from listings
where room_type =  'Private room';

--q3
select  max(reviews_per_month) as ReviewsPM  from listings
where number_of_reviews >= 200 and price > 2000;

--q4
select avg(price) as AvgListingsPrice from listings
where host_id = 3961453;

select round(AVG(price),2) as AvgListingsPrice from listings
where host_id = 3961453;

select round(AVG(price),2) - 1000 as AvgListingsPrice from listings
where host_id = 3961453;

select concat('R',round(AVG(price),2)) as AvgListingsPrice from listings
where host_id = 3961453;

select host_name from listings
where host_id = 3961453
group by host_name;

select distinct host_name from listings
where host_id = 3961453;