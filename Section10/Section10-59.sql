SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- HAVING (GROUP BYした結果に対する条件付け)
select department, avg(salary)
from employees 
group by department
having avg(salary)>3980000;

select birth_place, age, count(*) from users
group by birth_place, age
having count(*)>2;

-- HAVINGのみ
select
	"重複なし"
from
	users
having
	count(distinct age) = count(age);