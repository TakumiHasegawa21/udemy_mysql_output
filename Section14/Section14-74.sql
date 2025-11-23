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

-- PARTITION BY + ORDER BY
select *,
count(*) over(partition by department_id order by age) as count_value
from employees;

-- 月毎の、合計をemployeesのIDで昇順に並び替えて出す
select *, max(payment) over(partition by sa.paid_date order by emp.id)
from employees as emp
inner join salaries as sa
on emp.id = sa.employee_id;

-- salesテーブルのorder_price * order_amountの合計値の7日間の平均を求める
-- まずは、日付ごとの合計値を求める
-- 7日平均を求める
select 
	*,
	sum(order_price * order_amount) over(order by order_date rows between 6 preceding and current row)
from
	orders;

with daily_summary as(
select
	order_date, sum(order_price * order_amount) as sale
from
	orders
group by
	order_date
)
select
	*,
	avg(sale) over(order by order_date rows between 6 preceding and current row) -- 6日前から現在の行まで
from
	daily_summary;