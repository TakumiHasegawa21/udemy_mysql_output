-- IN * NULL
SELECT * from customers where name is null;
select * from customers where name in ("河野 文典","稲田 季雄") or name is null;

-- NOT IN
select * from customers where name not in ("河野 文典","稲田 季雄");
select * from customers where name not in ("河野 文典","稲田 季雄") AND name is not null;
-- NOT IN → name != "河野 文典" name !="稲田 季雄" name != NULL

-- ALL
-- customersテーブルからid<10の人の誕生日よりも古い誕生日の人をusersから取り出すSQL
select * from users where birth_day <= ALL(select birth_day from customers where id < 10 and birth_day is not null);

-- ALL, INの場合はNULLに気をつけましょう