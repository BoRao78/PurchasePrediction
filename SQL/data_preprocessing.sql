CREATE TABLE user_clean AS
SELECT *
FROM user;

DELETE
FROM user_clean
WHERE user_id IN (Select user_id
      FROM (SELECT user_id, max(behavior_type) b 
      From user
      Group by user_id)
      Where b != 4);

Create Table user_week1 AS
SELECT *
FROM user_clean
WHERE time <= '2014-11-27 23:00:00' And time >= '2014-11-22 00:00';

Create Table user_week2 AS
SELECT *
FROM user_clean
WHERE time <= '2014-12-04 23:00:00' And time >= '2014-11-29 00:00';

Create Table user_week4 AS
SELECT *
FROM user_clean
WHERE time <= '2014-12-18 23:00:00' And time >= '2014-12-13 00:00';