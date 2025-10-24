SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- ROUND, FLOOR, CEILING
select round(13.14, -1); -- 整数一桁目を四捨五入

select floor(3.14); -- 切り捨て

select ceiling(3.14);

select rand(); # 0~1の間でランダム
select floor(rand() * 10); # 0~10の間でランダム

-- power
select weight / power(height/100, 2) as BMI from students;

-- COALESCE NULLでない最初の値を返す
select * from tests_score;

select coalesce(null, null, null, "A", null, "B");