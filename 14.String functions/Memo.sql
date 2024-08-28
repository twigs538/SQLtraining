use [L&D_Company_tables];
use [L&D_Shop_tables];

--pg15 exercise
select * from Products;

select left(productName,1) as Initial
	, count(productName) as Count
from Products
group by left(productName,1);

--pg 28 
--q1
select first_name + ' ' + last_name as Fullname from Employees;

select concat(first_name, ' ', last_name) as Fullname from Employees;

--q2
select Employees.first_name + ' ' + Employees.last_name as Fullname, Jobs.job_title  from Employees
inner join Jobs on Employees.job_id = Jobs.job_id
where Jobs.job_title = 'Accountant';

--q3
select employee_id, lower(concat(first_name,'.',last_name,'@sqltutorial.org')) as email_address
from Employees;

select email, ascii(email) as Encoded from Employees;

--working
DECLARE @table TABLE (email VARCHAR(100));
INSERT INTO @table (email) select email from Employees;

DECLARE @email VARCHAR(100);
DECLARE @ascii_string VARCHAR(1000);
DECLARE @i INT;
DECLARE @cursor CURSOR;

SET @cursor = CURSOR FOR
SELECT email FROM @table;

OPEN @cursor;
FETCH NEXT FROM @cursor INTO @email;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @ascii_string = '';
    SET @i = 1;

    WHILE @i <= LEN(@email)
    BEGIN
        SET @ascii_string = @ascii_string + CONVERT(VARCHAR(3), ASCII(SUBSTRING(@email, @i, 1))) + ',';
        SET @i = @i + 1;
    END;

    PRINT @email + ': ' + @ascii_string;
	--select @email, @ascii_string;

    FETCH NEXT FROM @cursor INTO @email;
END;

CLOSE @cursor;
DEALLOCATE @cursor;

--q4
select email, char(115) as Decoded from Employees;

SELECT 
    email,
    CHAR(106) + CHAR(111) + CHAR(104) + CHAR(110) + CHAR(46) + 
    CHAR(100) + CHAR(111) + CHAR(101) + CHAR(64) + 
    CHAR(101) + CHAR(120) + CHAR(97) + CHAR(109) + CHAR(112) + 
    CHAR(108) + CHAR(101) + CHAR(46) + CHAR(99) + CHAR(111) + 
    CHAR(109) AS decoded_email
FROM Employees;

select * from Employees;
--select * from Departments;
select * from jobs;


select employee_id, case when trim(lower(concat(first_name,'.',last_name,'@sqltutorial.org'))) not like '% %' then trim(email)

	else concat(left(lower(concat(first_name,'.',last_name,'@sqltutorial.org'))

				,CHARINDEX(' ',lower(concat(first_name,'.',last_name,'@sqltutorial.org')))-1),SUBSTRING(lower(concat(first_name,'.',last_name,'@sqltutorial.org'))

				,CHARINDEX(' ',lower(concat(first_name,'.',last_name,'@sqltutorial.org')))+1, len(lower(concat(first_name,'.',last_name,'@sqltutorial.org')))

				-CHARINDEX(' ',lower(concat(first_name,'.',last_name,'@sqltutorial.org'))))) end as Email

from Employees;