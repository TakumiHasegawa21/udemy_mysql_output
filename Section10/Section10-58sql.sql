SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- group by
select age, count(*), MAX(birth_day), min(birth_day) from users
where birth_place="日本"
group by age;

select 
	case
		when birth_place="日本" then "日本人"
		else "その他"
	end,
	count(*)
from
	users
group by
	case
		when birth_place="日本" then "日本人"
		else "その他"
	end;

SELECT 
case
	when name in ("香川県", "高知県", "愛媛県", "徳島県") then "四国"
	else "その他"
end as "地域名",
count(*)
from
	prefectures
group by
case
	when name in ("香川県", "高知県", "愛媛県", "徳島県") then "四国"
	else "その他"
end;
