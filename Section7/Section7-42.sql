SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

select * from users;

SELECT 
	*,
	case birth_place
	when "日本" then "日本人"
	when "Iraq" then "イラク人"
	else "外国人"
	end as "国籍"
from
	users
where
	id > 30;

select name,
	case
		when name in ("香川県","愛媛県","高知県","徳島県") then "四国"
		else "その他"
	end as "地域名"
		from prefectures;

-- 計算
SELECT 
	name,
	birth_day,
	case
		when date_format(birth_day, "%Y") % 4 = 0 then "うるう年"
		else "うるう年ではない"
	end as "うるう年チェック"
from users;

select
	*,
	CASE
		when student_id % 3 = 0 then test_score_1
		when student_id % 3 = 1 then test_score_2
		when student_id % 3 = 2 then test_score_3
	END as score
from tests_score;

-- ORDER BYにCASE
select *,
case
	when name in ("香川県","愛媛県","高知県","徳島県") then "四国"
	else "その他"
	end as "地域名"
from prefectures
order by
case
	when name in ("香川県","愛媛県","高知県","徳島県") then "四国"
	else "その他"
end desc;

-- UPDATE + CASE
select * from users;
alter table users add birth_era varchar(2) after birth_day;
select *,
case
	when birth_day < "1989-01-07" then "昭和"
	when birth_day < "2019-05-01" then "平成"
	when birth_day >= "2019-05-01" then "令和"
	else "不明"
end as "元号"
from users;
	