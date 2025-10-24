SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- 算術演算子
select 1 + 1;

select name, age, age+3 as Age_3 from users limit 10;

select age-1 as Age_1 from users limit 10;

select birth_day, birth_day+2 from users limit 10;

select department, name, salary*1.1 as salary_next_year from employees;

select salary / 10 from employees;

-- CONCAT(文字の連結) ||
select concat(department, ":", name) from employees;
select concat(name, "(",age,")") from users;

select now(); -- 現在時刻
select now(), name, age from users;

select curdate(); -- 日付のみ
select date_format(now(), "%Y%m%d%H")