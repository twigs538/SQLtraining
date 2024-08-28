use airbnb;

--page 10
--q1
select name from listings
where name like 'M%'
order by name;

--q2
select name from listings
where name like '%Cozy%';

--q3
select * from listings
where host_name like 'Chris' or host_name like 'Chris+%' or host_name like 'Chris &%' or host_name like '%Chris';

select * from listings
where host_name like '%Chris' or host_name like 'Chris+%' or host_name like 'Chris %';

--q4
select * from listings
where room_type not like '%apartment%';

select count(name) as Listings, room_type from listings
where room_type not like '%apartment%'
group by room_type, Listings;

select count(name) from listings where name not like '%apartment%';

select * from listings where name not like '%apartment%';

--q5
select id, name, host_id from listings
where host_id like '____35';

select name, host_id from listings
where host_id like '____35';

--pg 11
--q1
select * from listings
where name like '%Cape%' and host_id like '_____';

select * from listings
where name like '%Cape%' and  char_length(host_id) = 5;

select * from listings
where name like '%Cape%' and  len(host_id) = 5;

--q2
select * from listings
where neighbourhood like '%1%';

select * from listings
where neighbourhood like 'Ward%1%';

--q3
select * from listings
where room_type like '_N%';

select room_type from listings
where room_type like '_n%'
group by room_type;

select distinct room_type from listings
where room_type like '_n%';

--q4
select * from listings
where host_name like '%Y';