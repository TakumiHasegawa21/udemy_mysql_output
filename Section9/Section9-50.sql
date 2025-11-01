SHOW DATABASES;

USE day_4_9_db;

select * from users;

start transaction;

select * from customers;

-- 主キーでUPDATE(行ロック)
update customers set age=43 where id=1;

-- 行ロック解除
rollback;

start transaction;

-- 主キーでないカラムでアップデートをかけるとテーブル全体のロックがかかるので注意
update customers set age=42 where name="河野 文典";

-- SELECTのロック
-- FOR SHARE(共有ロック)
-- FOR UPDATE(排他ロック)

start transaction;
select * from customers where id=1 for share;
rollback

start transaction;
select * from customers where id=1 for update;
rollback;

-- LOCK TABLE READ (読み込み専用)
lock table customers read;
select * from customers;
update customers set age=42 where id=1;
unlock tables;

-- LOCK TABLE WRITE (自分は書き込みも読み込みも可能だが他ユーザーは)
lock table customers write;
select * from customers;
update customers set age=42 where id=1;

-- DEAD LOCK
start transaction;
update customers set age=42 where id=1;
