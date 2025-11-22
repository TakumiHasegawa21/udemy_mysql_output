show databases;

use day_10_14_db;

show tables;

-- WITH
-- departmentsから営業部の人を取り出して、employeesと結合する
select
	*
from
	employees as e
inner join
	departments as d
on
	e.department_id = d.id
where 
	d.name = "営業部";

-- 上記のSQLと同義
with tmp_departments as(
	select
		*
	from
		departments
	where
		name = "営業部"
)
select
	*
from
	employees as e
inner join
	tmp_departments
on
	e.department_id = tmp_departments.id;

-- storesテーブルからid1,2,3の物を取り出す (where)
-- itemsテーブルと紐付け、itemsテーブルとordersテーブルを紐づける (inner join)
-- ordersテーブルのorder_amount* order_priceの合計値をstoresテーブルのstore_nameごとに集計する (group by sum)
with tmp_stores as(
	select * from stores where id in(1,2,3)
), tmp_items_orders as (
	select
		items.id as item_id,
		tmp_stores.id as store_id,
		orders.id as order_id,
		orders.order_amount as order_amount,
		orders.order_price as order_price,
		tmp_stores.name as store_name
	from tmp_stores
	inner join items
	on tmp_stores.id = items.store_id
	inner join orders
	on items.id =  orders.item_id
)
select * from tmp_items_orders;