show databases;

use day_10_14_db;

show tables;

select * from employees;

-- WINDOW関数
select *, AVG(age) OVER(), COUNT(*)OVER()
from employees;

-- PARTITION BY: 分割してその中で集計する
select *, AVG(age) OVER(partition by department_id) as avg_age,
count(*)over(partition by department_id) as count_department
from employees;

-- ORDER BY
select
	*,
	count(*) over(order by age) as tmp_count
from
	employees;