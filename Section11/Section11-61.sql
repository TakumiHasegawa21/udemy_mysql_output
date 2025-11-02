show databases;

create database day_10_14_db;

use day_10_14_db;

show tables;

-- テーブルに別名をつける
select
	cs.name
from
	classes as cs;
