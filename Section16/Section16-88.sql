show databases;

create database day_15_18_db;

use day_15_18_db;

show tables;

create table users(
	id int primary key,
	first_name varchar(255),
	last_name varchar(255) default '' not null
);

insert into users(id) values(1);

select * from users;

create table users_2(
	id int primary key,
	first_name varchar(255),
	last_name varchar(255) not null,
	age int default 0
);

insert into users_2(id, first_name, last_name) values(1, "Taro", "Yamada");

select * from users_2;

insert into users_2 values(2, "Jiro", "Suzuki", NULL);

-- UNIQUE制約
create table login_users(
	id int primary key,
	name varchar(255) not null,
	email varchar(255) not null unique
);

insert into login_users values(1, "Shingo", "abc@mail.com");
insert into login_users values(2, "Shingo", "abc@mail.com"); -- 同じ値を入れようとするとエラーになる

create table tmp_names(
	name varchar(255) unique
);

insert into tmp_names values (NULL);

select * from tmp_names;


-- CHECK制約
create table customers(
	id int primary key,
	name varchar(255),
	age int check(age >= 20)
);

insert into customers values(1, "Taro", 21);
insert into customers values(1, "Jiro", 19); -- check条件を満たしていないのでエラーになる

-- 複数のカラムに対するCHECK制約
create table students(
	id int primary key,
	name varchar(255),
	age int,
	gender char(1),
	constraint chk_students check((age>=15 and age<=20) and (gender = "F" or gender = "M")) -- ビジネスロジックをカラムとして指定する
);

insert into students values(1, "Taro", 18, "M");
insert into students values(2, "Jiro", 18, "U"); -- 不正な値として検出される
insert into students values(3, "Sachiko", 14, "U"); -- 不正な値として検出される


-- 主キー制約 (NOTNULL, UNIQUE, インデックス付与)
insert into students values(NULL, "Taro", 18, "M"); -- NULLが許容されていないのでエラー
