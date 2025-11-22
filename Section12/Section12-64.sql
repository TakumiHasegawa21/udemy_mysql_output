use day_10_14_db;

SELECT * from departments;

select * from employees;

-- EXISTS
select * from employees as em
where exists (
	select 1 from departments as dt where em.department_id = dt.id
);

-- IN (EXISTSと同じ)
select * from employees as em
where em.department_id in(select id from departments);

select * from employees as em
where exists (
select 1 from departments as dt where dt.name in ("営業部", "開発部") AND em.department_id = dt.id
);
