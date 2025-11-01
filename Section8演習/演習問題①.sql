SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

-- 問題1
SELECT 
	name, age
FROM
	customers
WHERE
	age >= 28 AND age <= 40
	AND name LIKE "%子"
ORDER BY
	age DESC
LIMIT
	5;

-- 問題2
SELECT
	*
FROM
	receipts;

INSERT INTO 
	receipts
VALUES
	(301, 100, "Store X", 10000);

-- 問題3
DELETE FROM
	receipts
WHERE
	id = 301;

-- 問題4
SELECT
	*
FROM
	prefectures;

DELETE FROM
	prefectures
WHERE
	 name = ""
	 OR name IS NULL;

-- 問題5
SELECT
	age
FROM
	customers
WHERE
	id BETWEEN 20 AND 50;

UPDATE
	customers
SET
	age=age+1
WHERE
	id BETWEEN 20 AND 50;

-- 問題6
SELECT
	*,
	CEILING(RAND()*5)
FROM
	students
WHERE
	class_no = 6;

UPDATE
	students
SET
	class_no=CEILING(RAND()*5)
WHERE
	class_no = 6;

-- 問題7
SELECT
	*
FROM 
	students
WHERE
	height < ALL
	(SELECT
		height+10
	FROM
		students
	WHERE
		class_no IN(3,4)
	)
AND
	class_no = 1;

-- 問題8
SELECT
	trim(department)
FROM 
	employees;

UPDATE employees SET department=trim(department);

-- 問題9
SELECT
	*, ROUND(salary*0.9)
FROM 
	employees
WHERE
	salary >= 5000000;

UPDATE 
	employees
SET salary=CASE 
	WHEN salary >= 5000000 THEN ROUND(salary*0.9)
	WHEN salary < 5000000 THEN ROUND(salary*1.1)
END;

-- 問題10
SELECT
	*
FROM 
	customers;

INSERT INTO 
	customers
VALUES
	(101, "名無権兵衛", 0, CURDATE());

-- 問題11
