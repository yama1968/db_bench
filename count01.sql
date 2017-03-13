
SELECT count(*) AS cnt,
       avg(click) AS p
  FROM (
    SELECT *
      FROM Train
     WHERE banner_pos = '3'
    ) AS T;

SELECT *
  FROM Train
 WHERE device_type = '2';
