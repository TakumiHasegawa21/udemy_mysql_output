SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

# IN
SELECT * FROM users WHERE age IN(12,24,36);

SELECT * FROM users WHERE birth_place NOT IN("France","Gremany","Italy");

# SELECT + IN
SELECT * FROM customers WHERE id IN (SELECT customer_id FROM receipts);
SELECT * FROM customers WHERE id NOT IN (SELECT customer_id FROM receipts);

# ALL, ANY
SELECT * FROM users WHERE age > ALL(SELECT age FROM employees WHERE salary > 5000000);
SELECT * FROM users WHERE age = ANY(SELECT age FROM employees WHERE salary > 5000000);

# AND, OR
SELECT * FROM employees;

SELECT * FROM employees WHERE department = " 営業部 " AND name LIKE "%田%" AND age < 35;

SELECT * FROM employees WHERE department = " 営業部 " AND (name LIKE "%田%" OR name LIKE "%西%" )AND age < 35;

SELECT * FROM employees WHERE department IN (" 営業部 ", " 開発部 ");

SELECT * FROM employees WHERE NOT department = " 営業部 ";