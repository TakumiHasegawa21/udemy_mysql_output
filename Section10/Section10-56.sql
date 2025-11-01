SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- INTERSECT：重複を表示
select * from new_students
intersect
select * from students;
/*
2	根本 仁美	154	71	1
3	伊東 元久	150	78	2
21	金城 兵吉	176	79	3
*/

-- EXCEPT: new_studentsに存在して、studentsに存在しない
select * from new_students
except
select * from students;

-- どちらかに存在する
(select * from new_students
intersect
select * from students)
union all
(select * from new_students
except
select * from students);

