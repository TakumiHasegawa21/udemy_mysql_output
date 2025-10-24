SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

select if(10 < 20, "A", "B");

select *, if(birth_place="日本", "日本人", "その他") as "国籍" from users;

select name, age, if(age < 20, "未成年", "成人")from users;

select *, if(class_no=6 AND height > 170, "6組の170cm以上の人", "その他") from students;