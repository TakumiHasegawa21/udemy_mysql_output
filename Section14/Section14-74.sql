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

-- ROW NUMBER, RANK, DENSE_RANK
select
*,
row_number() over(order by age) as row_num,     -- 常に1,2,3...と連番（重複は無視）
rank() over(order by age) as row_rank,          -- 同値は同順位、次の順位は飛ぶ
dense_rank() over(order by age) as row_dense    -- 同値は同順位、次の順位は飛ばない
from employees;

-- SUME_DIST, PERCENT_RANK
select
age,
rank() over(order by age) as row_rank, -- 行数
percent_rank() over(order by age) as p_age, -- (RANK-1) / (行数-1)
cume_dist() over(order by age) as c_age -- 現在の行の値より小さい行の割合
from employees;

-- LAG, READ
select
age,
lag(age) over(order by age), -- 直前
lag(age, 3, 0) over(order by age), -- 三つ前、ない場合は0
lead(age) over(order by age), -- 直後
lead(age, 2, 0) over(order by age) -- 二つ後、ない場合は0
from employees;

-- FIRST_VALUE, LAST_VALUE
select
*,
first_value(first_name) over(partition by department_id order by age),
last_value(first_name) over(partition by department_id order by age range between unbounded preceding and unbounded following)
from employees;

-- NTILE
select
age,
ntile(2) over(order by age)
from employees;