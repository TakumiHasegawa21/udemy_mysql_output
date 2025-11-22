show databases;

use day_10_14_db;

show tables;

select * from employees;

select * from departments;


-- INNER JOIN
select * from employees as emp
inner join departments as dt
on emp.department_id = dt.id;

-- 特定のカラムを取り出す
select emp.id, emp.first_name, emp.last_name, dt.id as department_id, dt.name as department_name from employees as emp
inner join departments as dt
on emp.department_id = dt.id;

-- 複数のレコードで紐づける
select * from students as std
inner join
users as usr
on std.first_name = usr.first_name and std.last_name = usr.last_name;

-- =以外で紐づける
select * from employees as emp
inner join
	students as std
on emp.id < std.id;