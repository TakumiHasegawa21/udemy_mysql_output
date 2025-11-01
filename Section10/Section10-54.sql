SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- UNION: 重複は削除
select * from new_students
union
select * from students;

select * from new_students
union
select * from students
order by id;

-- UNION ALL: 重複削除しない (こっちの方が処理時間が短い)
select * from new_students
union all
select * from students;

select * from new_students
union all
select * from students
order by id;

select * from students where id<10
union all
select * from new_students where id>250;

-- 型が同じであればから無名が異なっていても結合可能
select id, name from students where id<10
union
select age, name from users where id<10;

-- order byの時は一つ目のSQLのカラム名を指定
select id, name from students where id<10
union
select age, name from users where id<10
order by id;

-- カラムの数が異なっているとエラーになる
select id, name, height from students;
union
select age, name from users;

