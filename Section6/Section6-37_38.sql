SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

 -- LENGTH, CHAR_LENGTH
select length("ABC");
select length("あいう"); -- 9バイト

select name, length(name) from users;

-- TRIM, LTRIM, RTRIM 空白削除
select ltrim(" ABC ");
select rtrim(" ABC ");
select trim(" ABC ");

select name, char_length(name) AS name_length
from employees
where char_length(name) <> char_length(trim(name));

-- UPDATEして空白を削除したものにする
update employees
set name=trim(name)
where char_length(name) <> char_length(trim(name));

-- REPLACE: 置換
select replace ("I like an apple", "apple", "lemon");

select replace(name, "Mrs", "Ms") from users where name like 'Mrs%';

select replace(name, "Mrs", "Ms") from users where name like 'Mrs%';

update users set name = replace(name, "Mrs", "Ms") where name like 'Mrs%';

select * from users;

-- UPPER LOWER(大文字、小文字)
select upper("apple");
select lower("APPLE");
select name, upper(name), lower(name) from users;

-- substring 一部取り出し
select substring(name, 2, 3), name from employees;
select * from employees where substring(name, 2, 1) = "田";

-- REVERSE: 逆順
select reverse(name), name from employees;
