SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

select * from customers where name is null;

-- count
select count(*) from customers; -- 何行データが入っているか
select count(name) from customers; -- 列指定(この列に何行入っているか(nullはカウントしない))

select count(name) from customers where id>80;

-- MAX:最大, MIN：最小
select max(age), min(age) from users where birth_place="日本";

select max(birth_day), min(birth_day) from users;

-- SUM:合計値, avg:平均
select sum(salary) from employees;
select avg(salary) from employees;

-- AVG: NULLの扱いが面倒 (存在する値の中で平均値を算出)
create table tmp_count(
	num int
);
show tables;

insert into tmp_count values(1);
insert into tmp_count values(2);
insert into tmp_count values(3);
insert into tmp_count values(NULL);

select * from tmp_count;

-- coalesceを入れることでnullも含めて (1+2+3+0) / 4 = 1.5となる
select avg(coalesce(num, 0)) from tmp_count;