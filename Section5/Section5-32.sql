SELECT DATABASE();

SHOW DATABASES;

USE day_4_9_db;

DESCRIBE customers;

# IS NULLでないと取り出せない
SELECT * FROM customers WHERE name IS NULL;

SELECT NULL IS NULL;

# IS NOT NULL
SELECT * FROM customers WHERE name IS NOT NULL;

SELECT * FROM prefectures;

SELECT * FROM prefectures WHERE name IS NULL;

SELECT * FROM prefectures WHERE name = "";

# BETWEEN
SELECT * FROM users WHERE age BETWEEN 5 AND 10;

SELECT * FROM users WHERE age NOT BETWEEN 5 AND 10;

# LIKE
SELECT * FROM users WHERE name LIKE "村%"; # 前方一致

SELECT * FROM users WHERE name LIKE "%郎"; # 後方一致

SELECT * FROM users WHERE name LIKE "%ab%"; # 中間一致

SELECT * FROM prefectures WHERE name LIKE "福_県"; # _は任意の１文字