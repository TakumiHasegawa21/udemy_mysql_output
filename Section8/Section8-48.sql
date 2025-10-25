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