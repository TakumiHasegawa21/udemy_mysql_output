show databases;

create database day_10_14_db;

use day_10_14_db;

select * from employees;

-- 部署一覧
select * from departments;

-- INで絞り込む
select * from employees where department_id in(1,2);

-- 副問合せを使う
select * from departments where name in ("経営企画部", "営業部");

select * from employees where department_id in
	(select id from departments where name in ("経営企画部", "営業部")
)

select * from  students;
select * from users;

-- 複数カラムのIN (副問合せ)
select * from  students
where (first_name, last_name) in (
	select first_name, last_name from users
);

-- 副問合せ3: 集計と使う
select
	*
from
	employees
where
	age = (select max(age) from employees);

-- 副問合せ4: FROM句で用いる
select
	max(avg_age) as "部署ごとの平均年齢の最大"
from
	(select
		department_id,
		avg(age) as avg_age
	from 
		employees
	group by
		department_id
	) as temp_emp;

-- 副問合せ5: SELECTの中に書く
select
	cs.id,
	cs.first_name,
	cs.last_name,
	(select
		max(order_date)
	from
		orders as order_max
	where
		cs.id = order_max.customer_id
	)
from
	customers cs
where
	cs.id < 10;

-- 副問合せ6: CASEと使う
select
	emp.*,
	case
		when emp.department_id = (select id from departments where name = "経営企画部")
		then "経営層"
		else "その他"
	end as "役割"
from
	employees as emp;