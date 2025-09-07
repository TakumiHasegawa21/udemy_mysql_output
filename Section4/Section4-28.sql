SHOW TABLES;

DESCRIBE people;

ALTER TABLE people ADD age INT AFTER name;

INSERT INTO people VALUES(1, "John", 18, "2001-01-01");
INSERT INTO people VALUES(2, "Alice", 15, "2003-01-01");
INSERT INTO people VALUES(3, "Paul", 19, "2001-01-01");
INSERT INTO people VALUES(4, "Chris", 17, "2001-01-01");
INSERT INTO people VALUES(5, "Vette", 20, "2001-01-01");
INSERT INTO people VALUES(6, "Tsuyoshi", 21, "2001-01-01");

SELECT * FROM people;

# ageで昇順
SELECT * FROM people ORDER BY age;

# ageで降順
SELECT * FROM people ORDER BY age DESC;

# 2つカラム
SELECT * FROM people ORDER BY birth_day DESC, name ASC;

# ASC 昇順
# DESC 降順

# DISTINCT
SELECT DISTINCT birth_day FROM people;

# 両方とも重複の場合のみ削除
SELECT DISTINCT name, birth_day FROM people;

# LIMITは最初の行だけ削除
SELECT * FROM people LIMIT 3;

# 飛ばして表示(3飛ばして2表示)
SELECT * FROM people LIMIT 3,2;