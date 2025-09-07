SHOW TABLES;

# 全レコード, 全カラム
SELECT * FROM people;

# カラム一部
SELECT id, birth_day FROM people;

SELECT id AS "番号", name AS "名前" FROM people;

# WHERE句
SELECT * FROM people WHERE id = 1;

# UPDATE文
UPDATE people SET BIRTH_DAY="1990-01-01";

# UPDATE where
UPDATE people SET name="TARO", birth_day="2000-01-01" WHERE id=3;

UPDATE people SET name="TARO", birth_day="2000-01-01" WHERE id>4;

# DELETE: レコード削除
DELETE FROM people WHERE id>4;