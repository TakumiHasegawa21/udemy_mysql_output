SHOW DATABASES;

USE day_4_9_db;

select * from users;

-- トランザクションの開始
START TRANSACTION;

-- UPDATE処理
UPDATE users SET name="奥山 成美" WHERE id=1;

-- ROLLBACK (トランザクション開始前に戻す)
ROLLBACK;

-- COMMIT(トランザクションをDBに反映)
COMMIT;

SELECT * FROM students;

DELETE FROM students WHERE id=300;

-- AUTOCOMMIT確認 (AUTOCOMMITをOFFにするとCOMMITをしない限り処理が反映されない)
SHOW VARIABLES WHERE variable_name = "autocommit";

SET AUTOCOMMIT = 0;

-- AUTOCOMMITを元に戻す
SET AUTOCOMMIT = 1;