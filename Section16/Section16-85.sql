show databases;

use day_10_14_db;

select * from employees;

-- UPDATE 更新したいテーブル名 SET 更新したい列 = 更新する値
update employees set age = age+1 where id=1;

select
	*
from
	employees as emp
where
	emp.department_id = (select id from departments where name = "営業部");

-- 営業部の人の年齢を+2する
update
	employees as emp
set
	emp.age = emp.age + 2
where
	emp.department_id = (select id from departments where name = "営業部");

-- INNER JOIN
select * from employees;

alter table employees
add department_name varchar(255);

-- LEFT JOIN
select emp.*, coalesce(dt.name, "不明") from
employees as emp
left join departments as dt
on emp.department_id = dt.id;

update
employees as emp
left join departments as dt
on emp.department_id = dt.id
set emp.department_name = coalesce(dt.name, "不明");