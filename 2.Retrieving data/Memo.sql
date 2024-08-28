use airbnb;
--page4
--q1
select * from listings;

--q2
select name, room_type from listings;

--q3
SELECT name, host_name, last_review FROM listings
order by last_review desc;

SELECT name, host_name, last_review FROM listings
where year(last_review) = 2021;

--q4
SELECT reviews_per_month, room_type, minimum_nights FROM listings;

--page8
--q1
select name, room_type from listings
where room_type = 'Private room';

--q2
select * from listings
where minimum_nights = 1;

--q3
select * from listings
where last_review >= '2021/01/01';

select * from listings where year(last_review) = 2021;

Select * from listings
Where last_review between '2021/01/01' and '2021/12/31';

Select * from listings
where last_review like '%2021%';

--q4
select name, availability_365 from listings where availability_365 = 365;

select name, availability_365 from listings where availability_365 >= 0;

--q5
SELECT room_type, price, reviews_per_month FROM listings WHERE reviews_per_month < '0.05';

--page11
--q1
select name, room_type from listings
where room_type = 'Private room' or room_type = 'hotel room';

--q2
select * from listings
where minimum_nights = 1 or minimum_nights = 7;

--q3
select * from listings
where year(last_review) = 2021 or price < 1000;

--q4
select name, neighbourhood from listings
where neighbourhood = 'ward 107' or neighbourhood =  'ward 77';

--q5
SELECT * FROM listings
WHERE room_type = 'Private room' and price < 500;

--q6
select * from listings
where (neighbourhood = 'ward 107' or neighbourhood = 'ward 77') and room_type = 'Entire home/apt';

--page 13
--q1
select name, neighbourhood from listings 
where neighbourhood in ('Ward 107','Ward 115','Ward 54','Ward 77','Ward 61','Ward 59');

--q2
SELECT name, room_type
FROM listings
WHERE room_type NOT IN ('Entire home/apt', 'Shared room');

--q3
select host_name, name from listings 
where host_name in ('Chris','Erika & Chris', 'Chris & David', 'Chris+Alison');

--page 15
--q1
select name, neighbourhood from listings
where neighbourhood not in ('ward 107');

select name, neighbourhood from listings
where neighbourhood <> 'ward 107';

select name, neighbourhood from listings
where neighbourhood != 'ward 107';

--q2
select name, neighbourhood from listings
where neighbourhood != 'ward 107' or neighbourhood !=  'ward 108' or neighbourhood !=  'ward 109';

select name, neighbourhood from listings
where neighbourhood != 'ward 107' and neighbourhood !=  'ward 108' and neighbourhood !=  'ward 109';

select name, neighbourhood from listings
where neighbourhood not in ('Ward 107','Ward 108','Ward 109');

--q3
SELECT name, host_name, last_review FROM listings WHERE last_review between  '2020/07/01'  AND  '2020/07/31';

select name, host_name, last_review from listings 
where year(last_review) = 2020 and month(last_review) = 07;

--q4
SELECT name, room_type, latitude, longitude FROM listings 
where (latitude not between '-33.0000' and '-33.9999') and (Longitude not between '18.0000' and '18.5000');

SELECT name, room_type, latitude, longitude FROM listings
where latitude not between ('-33.0000') and ('-33.9999') and Longitude not between ('18.0000') and ('18.5000');

--page 17
--q1
select * from listings
where (room_type = 'private room' and price < 500) or (room_type = 'shared room' and price < 500);

select * from listings
where room_type in ('private room', 'shared room')
and price < 500;

--q2
select * from listings
where room_type = 'entire home/apt' and (neighbourhood <> 'ward 107' and neighbourhood <> 'ward 108' and neighbourhood <> 'ward 109');

select * from listings
where room_type = 'entire home/apt' and (neighbourhood <> 'ward 107' or neighbourhood <> 'ward 108' or neighbourhood <> 'ward 109');

--page 20
--q1
Select * from listings 
where (room_type = 'private room'  or room_type = 'shared room') and price < 500 
order by price asc;

--q2
select * from listings
where room_type =  'Entire home/apt'  and (Neighbourhood != 'Ward 107'  and Neighbourhood != 'Ward 108'  and Neighbourhood != 'Ward 109')
order by last_review desc;

select * from listings
where room_type =  'Entire home/apt'  and (Neighbourhood != 'Ward 107'  or Neighbourhood != 'Ward 108'  or Neighbourhood != 'Ward 109')
order by last_review desc;

--q3
Select name from listings where host_name = 'Abe (S.A.)'
Order by price;

--q4
select name, room_type, price, number_of_reviews from listings
where number_of_reviews < 20 and price > 1000
order by name asc;

select name, room_type, price, number_of_reviews from listings
where number_of_reviews < 20 and price > 1000
order by 1; 

select name, room_type, price, number_of_reviews from listings
where room_type like 'home/apartments' and price > 1000 and reviews_per_month < '20'
order by room_type asc;

select name, room_type, price from listings
where room_type = 'Entire home/apt' and (number_of_reviews < 20 and price > 1000)
order by name desc;

--q5 (question is incorrrect)
SELECT * FROM listings
where room_type =  'Private room'  and number_of_reviews > 100 and price < 500 
order by neighbourhood, price  desc;

--page 22
--q1 (question is incorrrect)
select * from listings
where room_type is not null;

select * from listings
where room_type is null;

--q2
select * from listings 
where neighbourhood_group is null;

select * from listings
where isnull(room_type);

--q3
select * from listings 
where host_name is null;

--q4 (question is vague)
select name from listings
where host_id is not null and host_name is null;

select name from listings where host_name like 'Entire home/apt' and host_id is not null and host_name is null;

--page 26
--q1
select top 5 name, number_of_reviews from listings order by number_of_reviews desc;

select name, number_of_reviews from listings order by number_of_reviews desc
limit 5;

--q2
select top 10 name, host_name, number_of_reviews, price from listings where room_type =  'Entire home/apt'  order by price desc;

select name, host_name, number_of_reviews, price
from listings
where room_type = 'Entire home/apt'
order by price desc
offset 0 rows
fetch next 10 rows only;

select name, host_name, number_of_reviews, price from listings where room_type =  'Entire home/apt'  order by price desc
limit 10;

--q3
select name, host_name, number_of_reviews, price from listings where room_type = 'Entire home/apt' order by price desc
offset 1 rows
fetch next 1 rows only;

select * from listings 
where room_type = 'Entire home/apt'
order by price desc
limit 1 offset 1

--q4 (question is vague)
select top 15 name, price from listings
order by price asc;

select top 15 name, price from listings
where room_type = 'Entire home/apt'
order by price asc;

select name, price from listings
order by price asc
limit 15;

www.w3schools.com/sql/sql_any_all