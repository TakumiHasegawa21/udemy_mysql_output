SELECT DATABASE();

USE my_db;

# テーブル作成
CREATE TABLE people(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 birth_day DATE DEFAULT"1990-01-01" 
);

# INSERT1
INSERT INTO people VALUES(1, "TARO", "2001-01-01");

SELECT * FROM people;

# INSERTカラム指定
INSERT INTO people(id, name) VALUES(2, "JIRO");

# シングルクォーテーション
INSERT INTO people(id, name) VALUES(3, 'SABURO');

INSERT INTO people VALUES(4, 'John''s son', '2021-01-01');

INSERT INTO people VALUES(5, 'John"s son', '2021-01-01');

INSERT INTO people VALUES(6, "John""s son", '2021-01-01');