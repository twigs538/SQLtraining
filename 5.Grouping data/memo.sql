use airbnb;

--page 6
--q1
select room_type, MAX(price) as MostExpensive from listings
group by room_type
order by MostExpensive desc;

select room_type, price from listings
group by room_type, price
order by price desc;

--q2
select host_id, host_name, AVG(price) AS price_on_avg from listings
group by host_id, host_name;

--q3
select top 5 neighbourhood, count(neighbourhood) as nr_of_listings from listings
group by neighbourhood
order by count(neighbourhood) desc;

select top 5 neighbourhood, count(name) as nr_of_listings from listings
group by neighbourhood
order by count(neighbourhood) desc;

select neighbourhood, count(neighbourhood) as nr_of_listings from listings
group by neighbourhood
order by count(neighbourhood) desc
limit 5;

--q4
select top 10 neighbourhood, MAX(price) as MostExpensive from listings
group by neighbourhood
order by MostExpensive desc;

select neighbourhood, MAX(price) as MostExpensive from listings
group by neighbourhood
order by MostExpensive desc
limit 10;

select neighbourhood, name, max_price
from (select neighbourhood, name, max(price) as max_price, ROW_NUMBER() over (partition by neighbourhood order by max(price) desc) as Split
		from listings group by neighbourhood, name) as s
where split<=10

with rankedlistings as (
	select neighbourhood,
	name,
	price,
	row_number() over (partition by neighbourhood order by price desc) as listing_rank
	from listings
	)
select neighbourhood,
	name,
	price
	from rankedlistings
	where listing_rank <=10;

select distinct neighbourhood from listings;

--page 9
--q1
SELECT neighbourhood, AVG(price) as avg_price FROM listings
GROUP BY neighbourhood 
HAVING AVG(price) > 1000;

--q2
SELECT host_name, COUNT(number_of_reviews) as review_count FROM listings
GROUP BY host_name
HAVING COUNT(number_of_reviews) > 50;

select host_name, sum(number_of_reviews) from listings
group by host_name
having sum(number_of_reviews) > 50
order by 1;

select host_name, sum(number_of_reviews) as Total_Number_of_Reviews
from listings
group by host_name
having sum(number_of_reviews) > 50
order by Total_Number_of_Reviews asc;

--q3
select * from listings;

select room_type, avg(availability_365)
from listings
group by room_type
having avg(availability_365) > 240;

--page 14
--q1
select distinct host_name, neighbourhood from listings;

select distinct host_name from listings
union
select distinct neighbourhood from listings

--use select distinct neighbourhood into to create neighbourhood

--q2
select count(distinct(room_type)) from listings;

--q3
select count(name) from listings
where name like '%catering%';

select count(distinct name) from listings
where name like '%catering%';