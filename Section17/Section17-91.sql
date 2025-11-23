show databases;

use day_15_18_db;

show tables;

drop table students;

create table schools(
	id int primary key,
	name varchar(255)
);

create table students(
	id int primary key,
	name varchar(255),
	age int,
	school_id int,
	foreign key(school_id) references schools(id)
);
insert into schools values(1, "北高校");
insert into students values(1, "Taro", 18, 1); -- 外部キーに値がないのでエラーになる

update schools set id=2;

describe employees;

-- 複数のカラムに外部キー
create table salaries(
	id int primary key,
	company_id int,
	employee_code char(8),
	payment int,
	paid_date date,
	foreign key (company_id, employee_code) references employees(company_id, employee_code)
);
