--page 12
--q1
create database StudentsDb;

--q2
use StudentsDb;

create table Students_tbl (Student_ID varchar(5), Name varchar (20), Surname varchar(20), Age int, Grade int, Subject varchar(20));

--q3
insert into students_tbl (Student_ID, name , surname , age , grade , subject)
values ('Stu01','Mat','Burger',16,10,'Science'),('Stu02','Steven','Louis',12,7,'Economics'),('Stu03','Kamo','Segau',15,6,'Mathematics');

select * from students_tbl;

--page 13
--q1
create table Wild_Cats (Student_ID varchar(5), Membership_Fee float(10));

--q2
insert into Wild_Cats (Student_ID, Membership_Fee) values ('STU01', 260),('STU02', 300);

select Student_ID, concat('R', Membership_Fee) as 'Membership_Fee(Rands)' from Wild_Cats;

select * from Wild_Cats;